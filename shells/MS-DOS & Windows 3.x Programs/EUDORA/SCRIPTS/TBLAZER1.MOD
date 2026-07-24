;Telebit Trailblazer PEP
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
;    Hardware flow - S58=2S68=255
;    DTR handling  - S52=2
;    Reliable only - S50=255
;    Fix baud rate - S66=1
;    Data & Parity - S60=0  8bit, no parity, 1 stop.  Eudora's default
;    Compression   - S110=1
;
send AT &FX4S7=60S50=255S52=2S58=2S68=255S60=0S66=1S110=1\r
waitfor OK
;
set FlowControl=Hardware
;
