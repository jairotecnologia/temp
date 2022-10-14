;--------------------------------------------------------------------------------------------
 ;check $ret[0] for trueness, and $ret[1] for type of connection according to variables provided...
 ;--------------------------------------------------------------------------------------------
 $INTERNET_CONNECTION_MODEM          = 0x1
 $INTERNET_CONNECTION_LAN            = 0x2
 $INTERNET_CONNECTION_PROXY          = 0x4
 $INTERNET_CONNECTION_MODEM_BUSY     = 0x8
 $INTERNET_RAS_INSTALLED             = 0x10
 $INTERNET_CONNECTION_OFFLINE        = 0x20
 $INTERNET_CONNECTION_CONFIGURED     = 0x40
 
     $ret = DllCall("WinInet.dll","int","InternetGetConnectedState","int_ptr",0,"int",0)
 
     If $ret[0] then
        ;check type of connection
         $sX = "Connected !" & @LF & "------------------" & @LF
         If BitAND($ret[1], $INTERNET_CONNECTION_MODEM)      Then $sX = $sX & "MODEM" & @LF
         If BitAND($ret[1], $INTERNET_CONNECTION_LAN)        Then $sX = $sX & "LAN" & @LF
         If BitAND($ret[1], $INTERNET_CONNECTION_PROXY)      Then $sX = $sX & "PROXY" & @LF
         If BitAND($ret[1], $INTERNET_CONNECTION_MODEM_BUSY) Then $sX = $sX & "MODEM_BUSY" & @LF
         If BitAND($ret[1], $INTERNET_RAS_INSTALLED)         Then $sX = $sX & "RAS_INSTALLED" & @LF
         If BitAND($ret[1], $INTERNET_CONNECTION_OFFLINE)    Then $sX = $sX & "OFFLINE" & @LF
         If BitAND($ret[1], $INTERNET_CONNECTION_CONFIGURED) Then $sX = $sX & "CONFIGURED" & @LF
     Else
         $sX = "Not Connected"
     Endif
 
     MsgBox(4096,$ret[0] & ":" & $ret[1],$sX)