;Motorola Codex 32xx series MNP & V.42
;
; If you make a change to this file you should change the description (the
; top line) so that the setup program can distinguish this new setup from
; the one you changed.  Be sure to rename and copy the modified file to
; the scripts directory.
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
;    Hardware flow - *FL3
;    DTR handling  - &D2
;    Reliable only - *SM2
;    Fix baud rate - *SC1
;    all result codes - *XC2
;
send AT &FX4&C1*FL3&D2*SM2*SC1*XC2*RS0S7=60\r
waitfor OK
;
set FlowControl=Hardware
;
