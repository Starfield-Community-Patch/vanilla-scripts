ScriptName TestOpenCloseSyncScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Function ToggleState()
  Int currentState = Self.GetOpenState()
  Self.SetOpen(currentState >= 3)
EndFunction

Function SetState(Bool bOpenMe)
  Self.SetOpen(bOpenMe)
EndFunction
