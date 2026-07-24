;Hayes Optima 14.4/2400 & 14.4 fax/data modem
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
;    Hardware flow - &K3
;    DTR handling  - &D2
;    Reliable only - S36=4S46=138
;    Fix baud rate - N0
;    all result codes - W2S95=32
;
send AT\r
pause 1
;
send AT &FX4W2&C1&D2&K3S7=60S36=4S46=138N0W2S95=32\r
waitfor OK
;
set FlowControl=Hardware
;
