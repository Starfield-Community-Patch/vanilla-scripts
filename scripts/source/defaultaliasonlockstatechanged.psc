ScriptName DefaultAliasOnLockStateChanged Extends DefaultAliasParent default
{ Sets stage if THIS Alias's lock state changes.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest() }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property CheckForUnlock = True Auto Const
  { If true (default), exceute this script if the lock state changes to Unlocked. If false, if the lock state changes to Locked. }
EndGroup


;-- Functions ---------------------------------------

Event OnLockStateChanged()
  If CheckForUnlock && Self.TryIsLocked() == False || CheckForUnlock == False && Self.TryIsLocked()
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, None, None)
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
  EndIf
EndEvent
