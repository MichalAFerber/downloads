#
#  Trumpet Winsock 3.0 Login.cmd
#
#  Copyright (C) 1996 distributed by
#  Trumpet Software International Pty Ltd 
#  A.C.N 070065860
#  Under Licence from the Copyright owners.
#  All Rights Reserved.
#  
#
#trace on
#
# set up some strings for dialling up
#
include "profile.cmd","preload"
include "modem.cmd","preload"
include "server.cmd","preload"
%attempts = 10

###############################################
# timeouts for various sections of the script #
###############################################
#
#
# timeout for busy tone... adjust this until the BUSY string is detected.
%busytimeout = 10
# time between successive busy attempts.
%busywait = 10
# time to wait for a CONNECT string to be received
%connecttimeout = 12
# time to wait until DCD is detected
%onlinetimeout = 2
# time to wait for username & password prompts
%logintimeout = 10
# time to wait for server prompt to appear
%prompttimeout = 10
# time to wait for a SLIP address to be parsed
%addresstimeout = 10

%getaddr = 0

#
#----------------------------------------------------------
#
# initialize modem
#
output \13
%n = [input 1 \n]
if %usereset
  status "Initializing modem..."

#  sleep 2

  output "at"$modemreset\13
  #%x = matchinput(10,"OK","ERROR")
  #if %x = 2
  #  message "Incorrect modem reset string.    Please change profile."
  #  abort
  #end
  #if %x = 0
  #  message "Modem is not responding."
  #  abort
  #end
end
#sleep 1
#
# setup our modem commands
#
#%x = matchinput(10,"OK","ERROR")
#if %x = 2
#  message "Incorrect modem init string.    Please change profile."
#  abort
#end
#if %x = 0
#  message "Modem is not responding."
#  abort
#end
#
# do the dial up....send phone number
#
%connected = 0
repeat
%n = 0
repeat
  %n = %n + 1
  if %n > %attempts
    message "Too many dial attempts"
    abort
  end
  status Dialling $number...(attempt %n)
  exec "c:\windows\playnow.exe c:\sounds\dialup2\dialing.wav"
  output "at"$modemdial$number\13
  sleep 2
  %ok = 0
  %which = matchinput(%connecttimeout,"CONNECT","BUSY","NO DIALTONE","NO CARRIER")
  if %which = 1
    %ok = 1
    sleep 1
    exec "c:\windows\playnow.exe c:\sounds\dialup2\attempt.wav"
  end
  if %which = 2
    status "The line is busy...pausing for a while"
    exec "c:\windows\playnow.exe c:\sounds\dialup2\busy.wav"
    output "+++"\13
    output "ath"\13
    sleep %busywait
  end
  if %which = 3
    message "No Dial tone.  Please check modem or phone line."
    #abort
  end
  if %which = 4
    exec "c:\windows\playnow.exe c:\sounds\dialup2\noconn.wav"
    message "No carrier - check condition of line or phone number"
    #abort
  end
until %ok
input 10 \n
#
#  wait till it's safe to send because some modems hang up
#  if you transmit during the connection phase
#
wait %onlinetimeout dcd
status Connected.  Now logging in as $username...
#
# now prod the terminal server
#
output \13

#
#  wait for the username prompt
#
#if $promptuser <> ""
#  input %logintimeout $promptuser
#  output $username\13
#end
#
# and the password
#

#sleep 1

#if $promptpass <> ""
#  input %logintimeout $promptpass
#  output $password\13
#end
#
# we are now logged in
#
status "Logged in. Now switching to Internet..."
#if $promptcmd <> ""
#  input %prompttimeout $promptcmd
#end
if %ppp
  #
  # jump into ppp mode
  #
  if $pppcmd <> ""
    output $pppcmd\13
  end
  #
  # wait for PPP prompt.
  if $pppready <> ""
    input %prompttimeout $pppready
  end
  #
  if %getaddr
    input %addresstimeout $addrprompt
    #
    # parse address
    #
    address %addresstimeout
    input %addresstimeout \n
    display \n
    display PPP mode selected.  Your IP address is \i.\n
    status Connected.  Your IP address is \i.
  else
    display \n\n"PPP mode selected.  Will try to negotiate IP address."\n
    status "PPP mode selected.  Will try to negotiate IP address."
    sleep 4
    exec "c:\windows\playnow.exe c:\sounds\dialup2\success.wav"
    %connected = 1
  end
  #
else
  #
  # jump into slip mode
  #
  if $slipcmd <> ""
    output $slipcmd\13
  end
  if $slipready <> ""
    input %prompttimeout $slipready
  end
  #
  # wait for the address string
  #
  if %getaddr
    if $addrprompt <> ""
      input %addresstimeout $addrprompt
    end
    #
    # parse address
    #
    address 30
    input %addresstimeout \n
    display \n
    display SLIP mode selected.  Your IP address is \i.\n
    status SLIP mode selected.  Your IP address is \i.
  else
    display \n\n"SLIP mode selected.  Will try to negotiate IP address."\n
    status "SLIP mode selected.  Will try to negotiate IP address."
    #sleep 1
  end
end
#
# now we are finished.
#
until %connected

