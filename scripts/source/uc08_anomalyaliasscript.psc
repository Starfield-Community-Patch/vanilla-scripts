ScriptName UC08_AnomalyAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet = 528 Auto Const
{ Stage to set when the "OnDying" event for this NPC is triggered }

;-- Functions ---------------------------------------

Event OnDying(ObjectReference akKiller)
  If !Self.GetOwningQuest().GetStageDone(StageToSet)
    Self.GetOwningQuest().SetStage(StageToSet)
  EndIf
EndEvent
