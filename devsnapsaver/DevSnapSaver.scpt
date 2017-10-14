-- =============================================================================
-- @file    DevSnapSaver.scpt
-- @brief   Archive a web page using Paparazzi
-- @author  Michael Hucka <mhucka@caltech.edu>
-- @license Please see the file LICENSE in the parent directory
-- @repo    https://github.com/mhucka/devonthink-hacks
-- =============================================================================
--
-- DEVONthink has a web import facility that is already able to create full-page
-- snapshots of web pages in PDF format.  However, in my experience, it often
-- fails to work for long pages (in which case, it produces a blank PDF).  I've
-- found Paparazzi! to be more reliable.
--
-- Unfortunately, the use of DEVONthink's import command via AppleScript loses
-- some of the nice features of its native web clipper facility, such as the
-- list of recently used Groups.  It's a tradeoff.

-- Global variables and constants.
-- ............................................................................

global theTitle
global theURL
global destinationFile

set destinationFile to "/tmp/_paparazzi.pdf"

-- Utility functions.
-- ............................................................................

on devonthink_import()
	tell application id "DNtp"
		activate
		set thisRecord to import destinationFile name theTitle
		if exists thisRecord then
			tell thisRecord
				set URL to theURL
				set tags to {"from-Safari", "archived-page"}
				set thisGroup to the current group of the database of thisRecord
			end tell
		else
			set thisGroup to the incoming group
		end if
		set refURL to the reference URL of thisRecord as string
		set thisArchive to create web document from theURL in thisGroup
		if exists thisArchive then
			tell thisArchive
				set URL to theURL
				set tags to {"from-Safari", "archived-page"}
				set comment to "PDF of this page archived in DEVONthink: " & refURL
			end tell
		end if
		set archiveRefURL to the reference URL of thisArchive as string
		if exists thisRecord then
			tell thisRecord
				set comment to "Web archive of this page archived in DEVONthink: " & archiveRefURL
			end tell
		end if
		set the clipboard to refURL
	end tell
end devonthink_import

-- Main body.
-- ............................................................................

-- Test if Paparazzi! is installed and complain if it isn't.

try
	tell application "Finder"
		get name of application file id "org.derailer.Paparazzi"
	end tell
on error
	display dialog "Could not find application Paparazzi! – quitting."
	return 1
end try

-- Good so far.  Proceed.

tell application "Safari"
	set theTitle to get name of the current tab of the front window
	set theURL to get URL of the current tab of the front window
end tell

try
	get theURL
on error
	display dialog "Could not obtain web page URL." buttons {"OK"} with icon 2
	return 1
end try

tell application "System Events"
	if exists file destinationFile then
		tell application "Finder" to delete destinationFile as POSIX file
	end if
end tell

tell application "Paparazzi!"
	activate
	capture theURL delay 20

	set toggleVisibility to true
	repeat while busy
		-- Wait until Paparazzi! finishes capturing the page.
		-- NB: if I put this visibility code outside the loop, Paparazzi
		-- doesn't hide after being invoked.
		if toggleVisibility then
			tell application "System Events"
				set visible of application process "Paparazzi!" to false
			end tell
			set toggleVisibility to false
		end if
	end repeat
	save as PDF in destinationFile
	close front window
end tell

tell application "System Events"
	if exists file destinationFile then
		my devonthink_import()
		tell application "Finder" to delete destinationFile as POSIX file
		display notification theURL with title "Saved to DEVONthink" subtitle theTitle
	else
		display alert "Paparazzi failed to save the file"
		activate application "Paparazzi!"
	end if
end tell


