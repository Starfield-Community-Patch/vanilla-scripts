ScriptName CityCYRedTape03QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PlayerInJailTriggerStage = 885 Auto Const
Int Property JailCellDoorClosedStage = 887 Auto Const
ReferenceAlias Property JailDoor Auto Const mandatory
ReferenceAlias Property JailTrigger Auto Const mandatory

;-- Functions ---------------------------------------

Function CloseJailCell()
  If Self.GetStageDone(JailCellDoorClosedStage) == False
    If JailTrigger.GetRef().IsInTrigger(Game.GetPlayer() as ObjectReference) == False
      ObjectReference myDoor = JailDoor.GetRef()
      myDoor.SetOpen(False)
      myDoor.SetDoorInaccessible(True)
      Self.SetStage(JailCellDoorClosedStage)
    ElseIf Self.GetStageDone(PlayerInJailTriggerStage) == False
      Self.SetStage(PlayerInJailTriggerStage)
    Else
      Self.StartTimer(3.0, 0)
    EndIf
  EndIf
EndFunction

Event OnTimer(Int aiTimerID)
  Self.CloseJailCell()
EndEvent
