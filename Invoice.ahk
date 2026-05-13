
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%


IniRead, current_num, settings.ini, Sequence, LastNumber, 00000

!F9::
    
    formatted_num := Format("{:07}", current_num)
    
    invoice_string := "AAPI" . formatted_num . "S"
    

    SendInput, %invoice_string%
    

    TrayTip, Auto-Invoice, Sent: %invoice_string%, 1
    

    current_num += 1
    IniWrite, %current_num%, settings.ini, Sequence, LastNumber
return

!F10::
    InputBox, NewNum, Update Sequence, Enter the next Invoice Number starting digit:, , 250, 150
    if !ErrorLevel
    {
        current_num := NewNum
        IniWrite, %current_num%, settings.ini, Sequence, LastNumber
        MsgBox, 64, Updated, Sequence is now set to: %current_num%, 2
    }
return
