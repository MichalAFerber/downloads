;ATI 2400 ETC MNP & V.42
;
; If you make a change to this file you should change the name (line above)
; and copy it into the scripts directory (in case you change scripts).
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
;    Hardware flow           -&K3
;    Compression Enable      -&U1
;    V.42 error control mode -&Q6
;	 Enable data buffer      -&O1
;    Enable fallback control -&N1
;    V.42 error correction   -&F2
;	 All above codes enables when AT&F2 sent
;	 not necessary to resend
;
send AT&F2S7=60\r
waitfor OK
;
set FlowControl=Hardware
;
