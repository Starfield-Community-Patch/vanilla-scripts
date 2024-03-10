ScriptName OutpostObjectOnObjectPlacedScript Extends ObjectReference Const
{ sets a global or quest stage when this object is placed (built) }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property GlobalToSet Auto Const
{ optional: global to set when object is placed }
Float Property ValueToSet = 1.0 Auto Const
{ value to set GlobalToSet to }
Quest Property QuestToSetStage Auto Const
{ optional: quest to set a stage on when object is placed }
Int Property StageToSet = -1 Auto Const
{ stage to set on QuestToSetStage }

;-- Functions ---------------------------------------

Event OnWorkshopObjectPlaced(ObjectReference akReference)
  If GlobalToSet as Bool && GlobalToSet.GetValue() != ValueToSet
    GlobalToSet.SetValue(ValueToSet)
  EndIf
  If (QuestToSetStage as Bool && StageToSet > -1) && QuestToSetStage.GetStageDone(StageToSet) == False
    QuestToSetStage.SetStage(StageToSet)
  EndIf
EndEvent
