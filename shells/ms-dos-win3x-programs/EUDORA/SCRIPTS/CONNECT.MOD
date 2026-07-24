;Digicom Connection V.42bis 14.4 fax/data modem
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
;    Hardware flow - &K3
;    DTR handling  - &D3
;    Reliable only - \N4 (v.42)
;	 Reliable only - \N2 (MNP)
;    Fix baud rate - default
;    all result codes - W1
;
send AT\r
pause 1
;
send AT &FX4&C1&D3S7=90\\N4W1&T5%C1\r
waitfor OK
;
set FlowControl=Hardware
;
