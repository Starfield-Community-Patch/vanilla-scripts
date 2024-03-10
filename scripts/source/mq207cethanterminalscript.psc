ScriptName MQ207CEthanTerminalScript Extends TerminalScript
{ Variant terminal script for Ethan's Terminal in MQ207C, which Ethan 'uses' as part of the entry scene. }

;-- Functions ---------------------------------------

Function EndScriptControl()
  Self.GotoState("")
EndFunction

;-- State -------------------------------------------
Auto State ScriptControl

  Function CheckOpenState()
    ; Empty function
  EndFunction

  Event OnCellLoad()
    Self.PlayAnimation("Play01")
  EndEvent
EndState
