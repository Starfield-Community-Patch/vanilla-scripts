ScriptName FloraOnHarvestScript Extends ObjectReference Const
{ set a global or quest stage when flora is harvested }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property GlobalToSet Auto Const
{ optional: global to set when flora is harvested }
Float Property ValueToSet = 1.0 Auto Const
{ value to set GlobalToSet to }
Quest Property QuestToSetStage Auto Const
{ optional: quest to set a stage on when flora is harvested }
Int Property StageToSet = -1 Auto Const
{ stage to set on QuestToSetStage }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    If GlobalToSet as Bool && GlobalToSet.GetValue() != ValueToSet
      GlobalToSet.SetValue(ValueToSet)
    EndIf
    If (QuestToSetStage as Bool && StageToSet > -1) && QuestToSetStage.GetStageDone(StageToSet) == False
      QuestToSetStage.SetStage(StageToSet)
    EndIf
  EndIf
EndEvent
