ScriptName PDBoardroomDoorTriggerScript Extends ObjectReference Const
{ Opens linked door on trigger enter }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueParadiso Auto Const mandatory
Quest Property DialogueECSConstant Auto Const mandatory
Int Property PreReqStage = 305 Auto Const
Int Property FFConstantZ04DebugStage = 54 Auto Const
Float Property DoorTimerLength = 10.0 Auto Const

;-- Functions ---------------------------------------

Function CloseBoardroomDoor()
  Self.GetLinkedRef(None).SetOpen(False)
EndFunction

Event OnTriggerEnter(ObjectReference akActionRef)
  If DialogueParadiso.GetStageDone(PreReqStage) || DialogueECSConstant.GetStageDone(FFConstantZ04DebugStage)
    ObjectReference myDoor = Self.GetLinkedRef(None)
    If myDoor.GetOpenState() >= 3
      myDoor.SetOpen(True)
      Self.StartTimer(DoorTimerLength, 0)
    EndIf
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  If !Self.IsInTrigger(Game.GetPlayer() as ObjectReference)
    Self.CloseBoardroomDoor()
  Else
    Self.StartTimer(DoorTimerLength, 0)
  EndIf
EndEvent
