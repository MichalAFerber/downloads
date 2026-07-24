;Supra 14.4 FaxModem V.32bis data  V.42bis
;
; Script Written by jeffb@pacifier.rain.com Depending on what model Supra
; you are using you may need to edit the send AT line to suit your modem,
; for "Supra 14.4 V.32bis Data V.42bis MNP 2-5" this seems to work great.
;
cancelon ERROR
;
;    All Settings are set with the &F2\r
;    -----------------------------------
;    Hardware flow - Default
;    DTR handling  - Default
;    AutoReliable  - Default
;    all result codes - Default
;
;
;
send AT\r
pause 1
send AT &F2X4\r
waitfor OK
;
set FlowControl=Hardware

