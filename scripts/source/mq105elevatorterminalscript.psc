ScriptName MQ105ElevatorTerminalScript Extends TerminalMenu

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Key Property MQ105SlaytonElevatorID Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  If auiMenuItemID == 1
    Game.GetPlayer().AddItem(MQ105SlaytonElevatorID as Form, 1, False)
  EndIf
EndEvent
