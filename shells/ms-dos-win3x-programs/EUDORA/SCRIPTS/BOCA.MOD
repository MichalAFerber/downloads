;Boca Research Inc. 14.4
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
;   &F    - Restore factory defaults
;   V1    - Verbose responses
;   X4    - Most verbose/informative responses (for a typical modem)
;   &C1   - Raise DCD only when carrier is present
;   S7=60 - modem hangs up after 60 seconds if carrier is not established
;
send AT &FV1X4&C1&D2&R1&K3S7=60\r
waitfor OK
;
;   2.  Enter the command that configures your modem for reliable operation
;       (MNP4 or V.42).
;
;   EXAMPLE:  send AT \\N2\r
send AT &Q5\r
;
;   5.  Enter the command that fixes (freezes) the modem baud rate.
;
;   EXAMPLE:  send AT \\J0\r
;
send AT N0S37=11\r
; use for 14.4k operation
; send AT N0S37=9\r  is used for 9600
;
set FlowControl=Hardware
;
