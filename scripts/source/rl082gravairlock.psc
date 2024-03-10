ScriptName RL082GravAirlock Extends TerminalMenu
{ Script to handle interaction with Zero G airlock in level RL083 }

;-- Variables ---------------------------------------
ObjectReference AirlockDoor01
ObjectReference AirlockDoor02
ObjectReference[] LinkedRefs

;-- Properties --------------------------------------
Cell Property RL082TAWarehouse01 Auto Const
Keyword Property LinkCustom01 Auto Const mandatory
Keyword Property LinkCustom02 Auto Const mandatory
Int Property menuItemID_01 = 1 Auto Const
Int Property menuItemID_02 = 2 Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  Self.HandleMenuItem(auiMenuItemID)
  LinkedRefs = akTerminalRef.GetLinkedRefChain(None, 100)
  AirlockDoor01 = akTerminalRef.GetLinkedRef(LinkCustom01)
  AirlockDoor02 = akTerminalRef.GetLinkedRef(LinkCustom02)
EndEvent

Function HandleMenuItem(Int auiMenuItemID)
  If auiMenuItemID == menuItemID_01
    Self.StartTimer(0.100000001, 10)
  ElseIf auiMenuItemID == menuItemID_02
    Self.StartTimer(0.100000001, 20)
  EndIf
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == 10
    AirlockDoor01.lock(True, False, True)
    AirlockDoor01.SetLockLevel(253)
    AirlockDoor02.unlock(False)
    RL082TAWarehouse01.setGravityScale(0.0)
    Int I = 0
    While I < LinkedRefs.Length
      LinkedRefs[I].ApplyHavokImpulse(Utility.RandomFloat(-1.0, 1.0), Utility.RandomFloat(-1.0, 1.0), Utility.RandomFloat(-1.0, 1.0), (LinkedRefs[I].GetMass() * Utility.RandomInt(1, 2) as Float) * 0.25)
      I += 1
    EndWhile
  ElseIf aiTimerID == 20
    AirlockDoor01.unlock(False)
    AirlockDoor01.setopen(True)
    AirlockDoor02.lock(True, False, True)
    AirlockDoor02.SetLockLevel(253)
    RL082TAWarehouse01.setGravityScale(1.0)
  EndIf
EndEvent
