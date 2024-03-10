ScriptName CityCYRedTape01TextTerminalScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnTerminalMenuItemRun(Int auiMenuItemID, terminalmenu akTerminalBase, ObjectReference akTerminalRef)
  Self.AddTextReplacementData("PlayerLabel", Game.GetPlayer() as Form)
EndEvent
