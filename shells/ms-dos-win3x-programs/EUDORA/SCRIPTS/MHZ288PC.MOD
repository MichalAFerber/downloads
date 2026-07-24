; Megahertz 28.8 XJ2288 PCMCIA
;
; If you make a change to this file you should change the description (the
; top line) so that the setup program can distinguish this new setup from
; the one you changed.  Be sure to rename and copy the modified file to
; the scripts directory.
;
;     This document applies to Megahertz modems XJ2288 and CC3288,
;     which incorporate the AT&T HSM288xCF chipset.

;
; An explicit \r must be placed at the end of a send line if you wish to
; terminate the line.  \r\n are stripped to \r.  \n will be sent without
; translation.
;
; The modem is assumed to be configured such that
;  1) When DTR is dropped the modem dropps carier and goes into command mode
;  2) Must operate in reliable mode LAMP or MNP
;  3) Hardware flow control is desired, modem and eudora.ini file must match
;  4) The modem does not change the DCE speed after connect
;
cancelon ERROR
;
send AT\r
pause 1
;
;    Hardware flow                            - &K3
;    DTR handling                             - &D2
;    MNP, normal, or LAPM connections         - \N3
;    DTE flow control, RTS/CTS hardware       - \Q3
;    Enable MNP5 compression                  - %C1
;    state of remote carrier is tracked       - &C1
;    describe connect codes,compression etc   - W1
;	 display connect messages                 - X4
;
send AT &F&C1&D2&K3W1X4\\Q3\\N3S7=60 \r
waitfor OK
;
set FlowControl=Hardware
;
