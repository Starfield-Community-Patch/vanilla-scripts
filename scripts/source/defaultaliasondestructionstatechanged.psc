ScriptName DefaultAliasOnDestructionStateChanged Extends DefaultAliasParent default
{ Set stage when THIS Alias's destruction stage changes.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest() }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Int Property DestructionStateToCheckFor = 1 Auto Const
  { Set the stage when this destruction state is reached. }
EndGroup


;-- Functions ---------------------------------------

Event OnDestructionStageChanged(Int aiOldStage, Int aiCurrentStage)
  If aiCurrentStage <= DestructionStateToCheckFor
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, None, None)
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
  EndIf
EndEvent
