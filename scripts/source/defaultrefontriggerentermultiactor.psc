ScriptName DefaultRefOnTriggerEnterMultiActor Extends DefaultOnEnterMultiActor conditional default
{ sets a quest stage when the specified multiple actors enter a trigger

NOT YET FULLY REIMPLEMENTED.
It will test for stages but not other criteria.
Sorry for the inconvenience.
`TTP-27123: Default Script: fully implement DefaultRefOnTriggerEnterMultiActor`
Please alert Jon Paul Duvall and we'll try to make this a priority.
Thanks! :) }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
  Quest Property QuestToSet Auto Const mandatory
  { Quest containing the Stage to set }
  Int Property StageToSet = -1 Auto Const mandatory
  { Stage to Set }
EndGroup

Group Optional_Properties
  Int Property PrereqStage = -1 Auto Const
  { Stage that must be set for this script's functionality to execute }
  Int Property TurnOffStage = -1 Auto Const
  { If stage >= TurnOffStage, this script's functionality is ignored }
  Int Property TurnOffStageDone = -1 Auto Const
  { If this stage is specfically done, this script's functionality is ignored }
  Bool Property DeleteWhenDone = True Auto
  { If true (default) will delete itself triggered. }
EndGroup


;-- Functions ---------------------------------------

Function TryToSetStage(Bool PlayerCheckOverride, ObjectReference RefToCheck, Form FormToCheck, ObjectReference[] ReferenceArray, ReferenceAlias[] AliasArray, Faction[] FactionArray, Form[] FormArray, Location[] LocationArray, LocationAlias[] LocationAliasArray, Bool LocationMatchIfChild)
  defaultscriptfunctions.TryToSetStage(Self as ScriptObject, ShowTraces, QuestToSet, StageToSet, PrereqStage, TurnOffStage, TurnOffStageDone, None, False, None, None, None, None, None, None, None, False, None, False, None)
EndFunction

Function TriggerMe()
  Self.TryToSetStage(False, None, None, None, None, None, None, None, None, False)
  If DeleteWhenDone && QuestToSet.GetStageDone(StageToSet)
    Self.Delete()
  EndIf
  Parent.TriggerMe()
EndFunction
