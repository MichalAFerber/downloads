;Default:Hayes (unreliable transfers)
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
; Remove this line if you are modifying this file and are using a modem
; which has a line speed higher than 2400 baud.  
set BaudRate=2400
;
cancelon ERROR
;
send AT\r
pause 1
;
; Configuration for a generic Hayes modem
;   &F    - Restore factory defaults
;   V1    - Verbose responses
;   X4    - Most verbose/informative responses (for a typical modem)
;   &C1   - Raise DCD only when carrier is present
;   S7=60 - modem hangs up after 60 seconds if carrier is not established
;
send AT &FV1X4&C1&D2S7=60\r
waitfor OK
;
;   A detailed discussion of how to setup a modem configuration file can be
;   found in Appendix E of the Eudora manual.
;
;   1.	Enter the command that configures your modem to respond to DTR.
;
;   EXAMPLE:  send AT &D2\r
;
;
;   2.	Enter the command that configures your modem for reliable operation
;	(MNP4 or V.42).
;
;   EXAMPLE:  send AT \\N2\r
;
;
;   3.	Enter the command that supports hardware flow control (strongly
;       recommended.
;
;   EXAMPLE:  send AT *FL\r
;
;
;   4.	If you have set your modem to support hardware flow control (as
;	described in step 3), change the following command that sets the
;	Eudora FlowControl variable to Hardware.  This command overrides
;	the FlowControl value in the [Dialup] section of the EUDORA.INI
;	file (this feature is only available in version 2.0.2 or later).  
;	This setting must match step 3 or you will lose data and corrupt
;	mail messages.
;
set FlowControl=Software
; set FlowControl=Hardware
;
;   5.	Enter the command that fixes (freezes) the modem baud rate.
;
;   EXAMPLE:  send AT \\J0\r
;
