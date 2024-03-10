ScriptName MQ206BPlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property SanctumPlayerSeat Auto Const mandatory
Int Property iPrereqStage = 140 Auto Const
Int Property iSetStage = 150 Auto Const

;-- Functions ---------------------------------------

Event OnSit(ObjectReference akFurniture)
  Quest myQuest = Self.GetOwningQuest()
  If akFurniture == SanctumPlayerSeat.GetRef()
    If myQuest.GetStageDone(iPrereqStage)
      myQuest.SetStage(iSetStage)
    EndIf
  EndIf
EndEvent
