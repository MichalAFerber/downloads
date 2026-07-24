#
#  Trumpet Winsock 3.0 Bye.cmd
#
#  Copyright (C) 1996 distributed by
#  Trumpet Software International Pty Ltd 
#  A.C.N 070065860
#  Under Licence from the Copyright owners.
#  All Rights Reserved.
#  
#
#
#
include "modem.cmd","preload"
#
exec "c:\windows\playnow.exe c:\sounds\dialup2\silence.wav"
status "Disconnecting modem..."
if %usedtr
  set dtr off
  #sleep 1
  set dtr on
end
if %useat
  # set the hangup string to a sensible value in case user 
  # has blanked it out by mistake.  Otherwise modem will not
  # hang up.
  if trim($modemhangup) = ""
    $modemhangup = "h"
  end
  #sleep 1
  output +++
  #if ![input 1 +++]
  #  %ok = [input 2 OKg\n]
  #else
    output \n
  #end
  output at$modemhangup\r
  input 2 NO CARRIER\n
end

status "Modem has been disconnected."

