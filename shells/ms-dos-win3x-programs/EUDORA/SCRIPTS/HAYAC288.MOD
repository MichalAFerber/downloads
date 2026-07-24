;Hayes Accura and Optima 28.8K FAX/Modem MNP & V.42
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
;    Negotiate Fallback V.42 then MNP then async     S36=7  default
;    Try V.42 fall back to MNP2-4                      &Q9  
;    Fix baud rate - Default?
;    all result codes -                                 X4  default
;    XON/XOFF flow control                             &K4
;    RTS/CTS flow control                              &K3  default
;    Negotiate at higest DCE line fall back             N1  default
;	 NEED to use \\ to make \ appear in init string
;	 standard C string problem, not a bug
;
send AT &F&C1&D2X4N1&K4&Q9S7=60\r
waitfor OK
;
set FlowControl=Hardware
;
