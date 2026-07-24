; Boca Modem 14,400 MNP & V.42
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
;    AT&V to view cuurrent register settings
;    Hardware flow - &K4
;    DTR handling  - &D2
;    Select Reliable Link Mode - \N2
;    Need to send \\ to get \ in init string
;	 not a bug but standard C string protocol
;
send AT &F&C1&D2&K4\\N2\\YS95=60\r
waitfor OK
;
set FlowControl=Hardware
;
