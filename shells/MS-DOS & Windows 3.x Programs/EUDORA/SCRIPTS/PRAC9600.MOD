;Practical Peripherals 9600SA/14400FXMT
;
; last updated: 03/14/95 The University of Iowa
; by:           Feather Lacy (flacy@blue.weeg.uiowa.edu)
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
; Notes:
; Factory defaults:
;         &Q5    = V.42 EC (Error Correction) operation
;                  (Requires flow control).
;         &K3    = Enable RTS/CTS Hardware local flow control
;
; Other Settings:
;         &F     = Reset to Factory Defaults
;         &L0    = Lowest volume setting
;         &C1    = Track actual state of remote modem's carrier
;         &D2    = Hang up, disable auto-answer, return to command mode
;                  on DTR.
;
send AT&FL0&C1&D2\r
waitfor OK
;
set FlowControl=Hardware
;
