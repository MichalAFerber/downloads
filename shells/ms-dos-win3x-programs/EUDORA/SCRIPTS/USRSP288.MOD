;US Robotics 28.8 Int/Ext Sportster Fax/Data LAPM & MNP
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
;    Hardware flow - &H1
;    Auto Data Compression - &K1
;    DTR handling  - &D2
;    Reliable      - &M4
;    Software Flow OFF -&I0
send AT &F&C1&D2&H1&I0&K1&M4\r
waitfor OK
;
set FlowControl=Hardware
;
