#
#  Trumpet Winsock 3.0 Profile.cmd
#
#  Copyright (C) 1996 distributed by
#  Trumpet Software International Pty Ltd 
#  A.C.N 070065860
#  Under Licence from the Copyright owners.
#  All Rights Reserved.
#
%ok = [load $username]
%ok = %ok & [load $password]
%ok = %ok & [load $number]
if (! %ok) | (param(1) <> "preload")
  dialog "profile.res","profile",%ok
    edit $username,101
    edit $password,102
    edit $number,103
    button "modem.cmd",104
    button "server.cmd",105
    help "trumpwsk.hlp",999,"profile"
  end
  if %ok then
    save $username
    save $password
    save $number
  else
    exit
  end
end
