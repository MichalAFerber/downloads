#
#  Trumpet Winsock 3.0 Modem.cmd
#
#  Copyright (C) 1994,1995 Peter R. Tattam & 
#  Trumpet Software International Pty Ltd (TSI)
#  All rights reserved.
#
#  Unless TSI has given prior written consent to such use, 
#  no permission is granted to distribute or otherwise make available 
#  to the public modified versions of this script for commercial purposes.  
#  Any permitted distribution of modified versions of the script must
#  retain the copyright notice at the start of this file and must clearly 
#  identify those parts of the file which have been modified.
#
$modeminit = "&f&c1&k3"
$modemdial = "dt"
$modemhangup = "h"
$modemreset = "z"
%usereset = 1
%usedtr = 0
%useat = 1
%ok = [load $modeminit]
%ok = %ok & [load $modemdial]
%ok = %ok & [load $modemhangup]
%ok = %ok & [load $modemreset]
%ok = %ok & [load %usereset]
%ok = %ok & [load %usedtr]
%ok = %ok & [load %useat]
if ! %ok | param(1) <> "preload"
  dialog "profile.res","modem",%ok
    edit $modeminit,101
    edit $modemdial,102
    edit $modemhangup,103
    edit $modemreset,104
    toggle %usereset,105
    toggle %useat,106
    toggle %usedtr,107
    help "trumpwsk.hlp",999,"modem profile"
  end
  if %ok
    save $modeminit
    save $modemdial
    save $modemhangup
    save $modemreset
    save %usereset
    save %useat
    save %usedtr
  else
    exit
  end
end
