FasdUAS 1.101.10   ��   ��    k             l     ��  ��    T N =============================================================================     � 	 	 �   = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =   
  
 l     ��  ��    !  @file    DevSnapSaver.scpt     �   6   @ f i l e         D e v S n a p S a v e r . s c p t      l     ��  ��    2 , @brief   Archive a web page using Paparazzi     �   X   @ b r i e f       A r c h i v e   a   w e b   p a g e   u s i n g   P a p a r a z z i      l     ��  ��    2 , @author  Michael Hucka <mhucka@caltech.edu>     �   X   @ a u t h o r     M i c h a e l   H u c k a   < m h u c k a @ c a l t e c h . e d u >      l     ��  ��    C = @license Please see the file LICENSE in the parent directory     �   z   @ l i c e n s e   P l e a s e   s e e   t h e   f i l e   L I C E N S E   i n   t h e   p a r e n t   d i r e c t o r y      l     ��   !��     : 4 @repo    https://github.com/mhucka/devonthink-hacks    ! � " " h   @ r e p o         h t t p s : / / g i t h u b . c o m / m h u c k a / d e v o n t h i n k - h a c k s   # $ # l     �� % &��   % T N =============================================================================    & � ' ' �   = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = $  ( ) ( l     �� * +��   *       + � , ,    )  - . - l     �� / 0��   / T N DEVONthink has a web import facility that is already able to create full-page    0 � 1 1 �   D E V O N t h i n k   h a s   a   w e b   i m p o r t   f a c i l i t y   t h a t   i s   a l r e a d y   a b l e   t o   c r e a t e   f u l l - p a g e .  2 3 2 l     �� 4 5��   4 Q K snapshots of web pages in PDF format.  However, in my experience, it often    5 � 6 6 �   s n a p s h o t s   o f   w e b   p a g e s   i n   P D F   f o r m a t .     H o w e v e r ,   i n   m y   e x p e r i e n c e ,   i t   o f t e n 3  7 8 7 l     �� 9 :��   9 S M fails to work for long pages (in which case, it produces a blank PDF).  I've    : � ; ; �   f a i l s   t o   w o r k   f o r   l o n g   p a g e s   ( i n   w h i c h   c a s e ,   i t   p r o d u c e s   a   b l a n k   P D F ) .     I ' v e 8  < = < l     �� > ?��   > , & found Paparazzi! to be more reliable.    ? � @ @ L   f o u n d   P a p a r a z z i !   t o   b e   m o r e   r e l i a b l e . =  A B A l     ��������  ��  ��   B  C D C l     �� E F��   E R L Unfortunately, the use of DEVONthink's import command via AppleScript loses    F � G G �   U n f o r t u n a t e l y ,   t h e   u s e   o f   D E V O N t h i n k ' s   i m p o r t   c o m m a n d   v i a   A p p l e S c r i p t   l o s e s D  H I H l     �� J K��   J P J some of the nice features of its native web clipper facility, such as the    K � L L �   s o m e   o f   t h e   n i c e   f e a t u r e s   o f   i t s   n a t i v e   w e b   c l i p p e r   f a c i l i t y ,   s u c h   a s   t h e I  M N M l     �� O P��   O 6 0 list of recently used Groups.  It's a tradeoff.    P � Q Q `   l i s t   o f   r e c e n t l y   u s e d   G r o u p s .     I t ' s   a   t r a d e o f f . N  R S R l     ��������  ��  ��   S  T U T l     �� V W��   V &   Global variables and constants.    W � X X @   G l o b a l   v a r i a b l e s   a n d   c o n s t a n t s . U  Y Z Y l     �� [ \��   [ S M ............................................................................    \ � ] ] �   . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . Z  ^ _ ^ l     ��������  ��  ��   _  ` a ` p       b b ������ 0 thetitle theTitle��   a  c d c p       e e ������ 0 theurl theURL��   d  f g f p       h h ������ "0 destinationfile destinationFile��   g  i j i l     ��������  ��  ��   j  k l k l     m���� m r      n o n m      p p � q q & / t m p / _ p a p a r a z z i . p d f o o      ���� "0 destinationfile destinationFile��  ��   l  r s r l     ��������  ��  ��   s  t u t l     �� v w��   v   Utility functions.    w � x x &   U t i l i t y   f u n c t i o n s . u  y z y l     �� { |��   { S M ............................................................................    | � } } �   . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . z  ~  ~ l     ��������  ��  ��     � � � i      � � � I      �������� 0 devonthink_import  ��  ��   � O     � � � � k    � � �  � � � I   ������
�� .miscactvnull��� ��� null��  ��   �  � � � r     � � � I   �� � �
�� .DTpacd01DTrc       utxt � o    ���� "0 destinationfile destinationFile � �� ���
�� 
pnam � o    ���� 0 thetitle theTitle��   � o      ���� 0 
thisrecord 
thisRecord �  � � � Z    E � ��� � � I   �� ���
�� .coredoexbool       obj  � o    ���� 0 
thisrecord 
thisRecord��   � O     ; � � � k   $ : � �  � � � r   $ ) � � � o   $ %���� 0 theurl theURL � 1   % (��
�� 
pURL �  � � � r   * 2 � � � J   * . � �  � � � m   * + � � � � �  f r o m - S a f a r i �  ��� � m   + , � � � � �  a r c h i v e d - p a g e��   � 1   . 1��
�� 
tags �  ��� � r   3 : � � � l  3 8 ����� � n   3 8 � � � 1   6 8��
�� 
DTcg � l  3 6 ����� � n   3 6 � � � m   4 6��
�� 
DTkb � o   3 4���� 0 
thisrecord 
thisRecord��  ��  ��  ��   � o      ���� 0 	thisgroup 	thisGroup��   � o     !���� 0 
thisrecord 
thisRecord��   � r   > E � � � l  > C ����� � 1   > C��
�� 
DTig��  ��   � o      ���� 0 	thisgroup 	thisGroup �  � � � r   F Q � � � c   F O � � � l  F K ����� � n   F K � � � 1   G K��
�� 
rURL � o   F G���� 0 
thisrecord 
thisRecord��  ��   � m   K N��
�� 
TEXT � o      ���� 0 refurl refURL �  � � � r   R ] � � � I  R [�� � �
�� .DTpacd77DTrc       utxt � o   R S���� 0 theurl theURL � �� ���
�� 
DTin � o   V W���� 0 	thisgroup 	thisGroup��   � o      ���� 0 thisarchive thisArchive �  � � � Z   ^ � � ����� � I  ^ c�� ���
�� .coredoexbool       obj  � o   ^ _���� 0 thisarchive thisArchive��   � O   f � � � � k   j � � �  � � � r   j o � � � o   j k���� 0 theurl theURL � 1   k n��
�� 
pURL �  � � � r   p | � � � J   p x � �  � � � m   p s � � � � �  f r o m - S a f a r i �  ��� � m   s v � � � � �  a r c h i v e d - p a g e��   � 1   x {��
�� 
tags �  ��� � r   } � � � � b   } � � � � m   } � � � � � � R P D F   o f   t h i s   p a g e   a r c h i v e d   i n   D E V O N t h i n k :   � o   � ����� 0 refurl refURL � 1   � ���
�� 
DTco��   � o   f g���� 0 thisarchive thisArchive��  ��   �  � � � r   � � � � � c   � � � � � l  � � ����� � n   � � � � � 1   � ���
�� 
rURL � o   � ����� 0 thisarchive thisArchive��  ��   � m   � ���
�� 
TEXT � o      ���� 0 archiverefurl archiveRefURL �  � � � Z   � � � ����� � I  � ��� ���
�� .coredoexbool       obj  � o   � ����� 0 
thisrecord 
thisRecord��   � O   � � � � � r   � � � � � b   � � � � � m   � � � � � � � b W e b   a r c h i v e   o f   t h i s   p a g e   a r c h i v e d   i n   D E V O N t h i n k :   � o   � ����� 0 archiverefurl archiveRefURL � 1   � ���
�� 
DTco � o   � ����� 0 
thisrecord 
thisRecord��  ��   �  ��� � I  � ��� ���
�� .JonspClpnull���     **** � o   � ����� 0 refurl refURL��  ��   � 5     �� ���
�� 
capp � m     � � � � �  D N t p
�� kfrmID   �  �  � l     �������  ��  �     l     �~�~     Main body.    �    M a i n   b o d y .  l     �}	�}   S M ............................................................................   	 �

 �   . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  l     �|�{�z�|  �{  �z    l     �y�y   @ : Test if Paparazzi! is installed and complain if it isn't.    � t   T e s t   i f   P a p a r a z z i !   i s   i n s t a l l e d   a n d   c o m p l a i n   i f   i t   i s n ' t .  l     �x�w�v�x  �w  �v    l   $�u�t Q    $ O     e     n     1    �s
�s 
pnam 5    �r�q
�r 
appf m       �!! , o r g . d e r a i l e r . P a p a r a z z i
�q kfrmID   m    ""�                                                                                  MACS  alis    f  clarity                    ԛn}H+     (
Finder.app                                                      �1�GЎ        ����  	                CoreServices    ԛ��      �HA       (   '   &  1clarity:System: Library: CoreServices: Finder.app    
 F i n d e r . a p p    c l a r i t y  &System/Library/CoreServices/Finder.app  / ��   R      �p�o�n
�p .ascrerr ****      � ****�o  �n   k    $## $%$ I   !�m&�l
�m .sysodlogaskr        TEXT& m    '' �(( b C o u l d   n o t   f i n d   a p p l i c a t i o n   P a p a r a z z i !      q u i t t i n g .�l  % )�k) L   " $** m   " #�j�j �k  �u  �t   +,+ l     �i�h�g�i  �h  �g  , -.- l     �f/0�f  /   Good so far.  Proceed.   0 �11 .   G o o d   s o   f a r .     P r o c e e d .. 232 l     �e�d�c�e  �d  �c  3 454 l  % C6�b�a6 O   % C787 k   ) B99 :;: r   ) 4<=< e   ) 2>> n   ) 2?@? 1   / 1�`
�` 
pnam@ l  ) /A�_�^A n   ) /BCB 1   - /�]
�] 
cTabC l  ) -D�\�[D 4  ) -�ZE
�Z 
cwinE m   + ,�Y�Y �\  �[  �_  �^  = o      �X�X 0 thetitle theTitle; F�WF r   5 BGHG e   5 >II n   5 >JKJ 1   ; =�V
�V 
pURLK l  5 ;L�U�TL n   5 ;MNM 1   9 ;�S
�S 
cTabN l  5 9O�R�QO 4  5 9�PP
�P 
cwinP m   7 8�O�O �R  �Q  �U  �T  H o      �N�N 0 theurl theURL�W  8 m   % &QQ�                                                                                  sfri  alis    >  clarity                    ԛn}H+     G
Safari.app                                                     �@.Ӛ��        ����  	                Applications    ԛ��      ӛJ=       G   clarity:Applications: Safari.app   
 S a f a r i . a p p    c l a r i t y  Applications/Safari.app   / ��  �b  �a  5 RSR l     �M�L�K�M  �L  �K  S TUT l  D jV�J�IV Q   D jWXYW e   G JZZ o   G J�H�H 0 theurl theURLX R      �G�F�E
�G .ascrerr ****      � ****�F  �E  Y k   R j[[ \]\ I  R g�D^_
�D .sysodlogaskr        TEXT^ m   R U`` �aa < C o u l d   n o t   o b t a i n   w e b   p a g e   U R L ._ �Cbc
�C 
btnsb J   X ]dd e�Be m   X [ff �gg  O K�B  c �Ah�@
�A 
disph m   ` a�?�? �@  ] i�>i L   h jjj m   h i�=�= �>  �J  �I  U klk l     �<�;�:�<  �;  �:  l mnm l  k �o�9�8o O   k �pqp Z   q �rs�7�6r I  q {�5t�4
�5 .coredoexbool       obj t 4   q w�3u
�3 
fileu o   u v�2�2 "0 destinationfile destinationFile�4  s O  ~ �vwv I  � ��1x�0
�1 .coredelonull���     obj x c   � �yzy o   � ��/�/ "0 destinationfile destinationFilez m   � ��.
�. 
psxf�0  w m   ~ {{�                                                                                  MACS  alis    f  clarity                    ԛn}H+     (
Finder.app                                                      �1�GЎ        ����  	                CoreServices    ԛ��      �HA       (   '   &  1clarity:System: Library: CoreServices: Finder.app    
 F i n d e r . a p p    c l a r i t y  &System/Library/CoreServices/Finder.app  / ��  �7  �6  q m   k n||�                                                                                  sevs  alis    �  clarity                    ԛn}H+     (System Events.app                                               ������        ����  	                CoreServices    ԛ��      ��#(       (   '   &  8clarity:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p    c l a r i t y  -System/Library/CoreServices/System Events.app   / ��  �9  �8  n }~} l     �-�,�+�-  �,  �+  ~ � l  ���*�)� O   ���� k   ��� ��� I  � ��(�'�&
�( .miscactvnull��� ��� null�'  �&  � ��� I  � ��%��
�% .Pzi!Captnull���     ctxt� o   � ��$�$ 0 theurl theURL� �#��"
�# 
cDly� m   � ��!�! �"  � ��� l  � �� ���   �  �  � ��� r   � ���� m   � ��
� boovtrue� o      �� $0 togglevisibility toggleVisibility� ��� V   � ���� k   � ��� ��� l  � �����  � 9 3 Wait until Paparazzi! finishes capturing the page.   � ��� f   W a i t   u n t i l   P a p a r a z z i !   f i n i s h e s   c a p t u r i n g   t h e   p a g e .� ��� l  � �����  � E ? NB: if I put this visibility code outside the loop, Paparazzi    � ��� ~   N B :   i f   I   p u t   t h i s   v i s i b i l i t y   c o d e   o u t s i d e   t h e   l o o p ,   P a p a r a z z i  � ��� l  � �����  � ( " doesn't hide after being invoked.   � ��� D   d o e s n ' t   h i d e   a f t e r   b e i n g   i n v o k e d .� ��� Z   � ������ o   � ��� $0 togglevisibility toggleVisibility� k   � ��� ��� O   � ���� r   � ���� m   � ��
� boovfals� n      ��� 1   � ��
� 
pvis� 4   � ���
� 
pcap� m   � ��� ���  P a p a r a z z i !� m   � ����                                                                                  sevs  alis    �  clarity                    ԛn}H+     (System Events.app                                               ������        ����  	                CoreServices    ԛ��      ��#(       (   '   &  8clarity:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p    c l a r i t y  -System/Library/CoreServices/System Events.app   / ��  � ��� r   � ���� m   � ��
� boovfals� o      �� $0 togglevisibility toggleVisibility�  �  �  �  � 1   � ��
� 
pBzy� ��� I  � ����
� .coresavenull���     obj �  � ���
� 
fltp� m   � ��

�
 sFMTPDF � �	��
�	 
kfil� o   � ��� "0 destinationfile destinationFile�  � ��� I  ����
� .coreclosnull���     obj � 4  � ���
� 
cwin� m   � ��� �  �  � m   � ����                                                                                  Pzi!  alis    N  clarity                    ԛn}H+     GPaparazzi!.app                                                 s��iY�        ����  	                Applications    ԛ��      �i�X       G  $clarity:Applications: Paparazzi!.app    P a p a r a z z i ! . a p p    c l a r i t y  Applications/Paparazzi!.app   / ��  �*  �)  � ��� l     �� ���  �   ��  � ��� l R������ O  R��� Z  
Q������ I 
�����
�� .coredoexbool       obj � 4  
���
�� 
file� o  ���� "0 destinationfile destinationFile��  � k  ?�� ��� n ��� I  �������� 0 devonthink_import  ��  ��  �  f  � ��� O +��� I !*�����
�� .coredelonull���     obj � c  !&��� o  !"���� "0 destinationfile destinationFile� m  "%��
�� 
psxf��  � m  ���                                                                                  MACS  alis    f  clarity                    ԛn}H+     (
Finder.app                                                      �1�GЎ        ����  	                CoreServices    ԛ��      �HA       (   '   &  1clarity:System: Library: CoreServices: Finder.app    
 F i n d e r . a p p    c l a r i t y  &System/Library/CoreServices/Finder.app  / ��  � ���� I ,?����
�� .sysonotfnull��� ��� TEXT� o  ,/���� 0 theurl theURL� ����
�� 
appr� m  25�� ��� & S a v e d   t o   D E V O N t h i n k� �����
�� 
subt� o  89���� 0 thetitle theTitle��  ��  ��  � k  BQ�� ��� I BI�����
�� .sysodisAaleR        TEXT� m  BE�� ��� B P a p a r a z z i   f a i l e d   t o   s a v e   t h e   f i l e��  � ���� I JQ�����
�� .miscactvnull��� ��� null� m  JM���                                                                                  Pzi!  alis    N  clarity                    ԛn}H+     GPaparazzi!.app                                                 s��iY�        ����  	                Applications    ԛ��      �i�X       G  $clarity:Applications: Paparazzi!.app    P a p a r a z z i ! . a p p    c l a r i t y  Applications/Paparazzi!.app   / ��  ��  ��  � m  ���                                                                                  sevs  alis    �  clarity                    ԛn}H+     (System Events.app                                               ������        ����  	                CoreServices    ԛ��      ��#(       (   '   &  8clarity:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p    c l a r i t y  -System/Library/CoreServices/System Events.app   / ��  ��  ��  � ��� l     ��������  ��  ��  � ���� l     ��������  ��  ��  ��       �������  � ������ 0 devonthink_import  
�� .aevtoappnull  �   � ****� �� ����������� 0 devonthink_import  ��  ��  � ������������ 0 
thisrecord 
thisRecord�� 0 	thisgroup 	thisGroup�� 0 refurl refURL�� 0 thisarchive thisArchive�� 0 archiverefurl archiveRefURL� �� ������������������� � ����������������� � � ��� ���
�� 
capp
�� kfrmID  
�� .miscactvnull��� ��� null�� "0 destinationfile destinationFile
�� 
pnam�� 0 thetitle theTitle
�� .DTpacd01DTrc       utxt
�� .coredoexbool       obj �� 0 theurl theURL
�� 
pURL
�� 
tags
�� 
DTkb
�� 
DTcg
�� 
DTig
�� 
rURL
�� 
TEXT
�� 
DTin
�� .DTpacd77DTrc       utxt
�� 
DTco
�� .JonspClpnull���     ****�� �)���0 �*j O���l E�O�j   � �*�,FO��lv*�,FO��,�,E�UY 	*a ,E�O�a ,a &E�O�a �l E�O�j  (�  �*�,FOa a lv*�,FOa �%*a ,FUY hO�a ,a &E�O�j  � a �%*a ,FUY hO�j U� �����������
�� .aevtoappnull  �   � ****� k    R��  k�� �� 4�� T�� m�� �� �����  ��  ��  �  � 1 p��"�� ��������'��Q����������`��f����|�������������������������������������������������� "0 destinationfile destinationFile
�� 
appf
�� kfrmID  
�� 
pnam��  ��  
�� .sysodlogaskr        TEXT
�� 
cwin
�� 
cTab�� 0 thetitle theTitle
�� 
pURL�� 0 theurl theURL
�� 
btns
�� 
disp�� 
�� 
file
�� .coredoexbool       obj 
�� 
psxf
�� .coredelonull���     obj 
�� .miscactvnull��� ��� null
�� 
cDly�� 
�� .Pzi!Captnull���     ctxt�� $0 togglevisibility toggleVisibility
�� 
pBzy
�� 
pcap
�� 
pvis
�� 
fltp
�� sFMTPDF 
�� 
kfil
�� .coresavenull���     obj 
�� .coreclosnull���     obj �� 0 devonthink_import  
�� 
appr
�� 
subt
�� .sysonotfnull��� ��� TEXT
�� .sysodisAaleR        TEXT��S�E�O � 
*���0�,EUW X  �j 
OkO� *�k/�,�,EE�O*�k/�,�,EE` UO _ W X  a a a kva la  
OkOa  !*a �/j  � �a &j UY hUOa  l*j O_ a a l OeE`  O 4h*a !,E_    a  f*a "a #/a $,FUOfE`  Y h[OY��O*a %a &a '�a  (O*�k/j )UOa  I*a �/j  -)j+ *O� �a &j UO_ a +a ,a -�a  .Y a /j 0Oa j U ascr  ��ޭ