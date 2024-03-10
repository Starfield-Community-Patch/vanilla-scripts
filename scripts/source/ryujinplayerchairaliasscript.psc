ScriptName RyujinPlayerChairAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property iStageToSet Auto Const mandatory
Int Property iPreReqStage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Actor PlayerRef = Game.GetPlayer()
  Quest OwningQuest = Self.GetOwningQuest()
  If akActionRef == PlayerRef as ObjectReference
    If !PlayerRef.IsInCombat() && OwningQuest.GetStageDone(iPreReqStage)
      OwningQuest.SetStage(iStageToSet)
    EndIf
  EndIf
EndEvent
