;Practical Peripherals 14400FXSA Fax/Data LAPM & MNP
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
;  2) Passes Break through, does not go into command mode
;  3) Must operate in reliable mode LAMP or MNP
;  4) Hardware flow control is desired, modem and eudora.ini file must match
;  5) The modem does not change the DCE speed after connect
;
cancelon ERROR
;
send AT\r
pause 1
;
;    Hardware flow - &K3
;    DTR handling  - &D2
;    Reliable only - S36=4
;
send AT &FX4&C1&K3&D2&S36=4S7=60\r
waitfor OK
;
set FlowControl=Hardware
;
