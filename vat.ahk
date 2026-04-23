!v:: 
    Clipboard := "" 
    Send, ^c 
    ClipWait, 1 
    
    if (ErrorLevel) 
    {
        ToolTip, Walang na-copy!
        SetTimer, RemoveToolTip, -2000
        return
    }

    CleanAmount := StrReplace(Clipboard, ",", "")
    
    if CleanAmount is number
    {
        NetAmount := CleanAmount / 1.12
        FormattedNet := Round(NetAmount, 2)
        
        Clipboard := FormattedNet
        Send, ^v 
        
        ToolTip, VAT Deducted: %FormattedNet%
        SetTimer, RemoveToolTip, -2000
    }
    else
    {
        ToolTip, Error: Hindi ito numero!
        SetTimer, RemoveToolTip, -2000
    }
return


RemoveToolTip:
    ToolTip
return