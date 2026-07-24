#
#  Trumpet Winsock 3.0 Server.cmd
#
#  Copyright (C) 1996 distributed by
#  Trumpet Software International Pty Ltd 
#  A.C.N 070065860
#  Under Licence from the Copyright owners.
#  All Rights Reserved.
# 
# 
$promptuser = "sername:"
$promptpass = "ssword:"
$promptcmd  = ">"
$slipcmd    = "s"
$slipready  = ""
$pppcmd     = "p"
$pppready   = ""
%getaddr    = 0
$addrprompt = ""
%ok = [load $promptuser]
%ok = %ok & [load $promptpass]
%ok = %ok & [load $promptcmd]
%ok = %ok & [load $slipcmd]
%ok = %ok & [load $slipready]
%ok = %ok & [load $pppcmd]
%ok = %ok & [load $pppready]
%ok = %ok & [load %getaddr]
%ok = %ok & [load $addrprompt]
if (param(1) <> "preload") | ! %ok
  dialog "profile.res","server",%ok
    edit $promptuser,101
    edit $promptpass,102
    edit $promptcmd,103
    edit $slipcmd,104
    edit $slipready,105
    edit $pppcmd,106
    edit $pppready,107
    toggle %getaddr,108
    edit $addrprompt,109
    help "trumpwsk.hlp",999,"server profile"
  end
  if %ok
    save $promptuser
    save $promptpass
    save $promptcmd
    save $slipcmd
    save $slipready
    save $pppcmd
    save $pppready
    save %getaddr
    save $addrprompt
  else
    exit
  end
end
