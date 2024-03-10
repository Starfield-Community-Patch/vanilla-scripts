ScriptName DefaultTopicInfo Extends TopicInfo Const hidden
{ Master script for the DefaultTopicInfo scripts.

TODO `TTP-27142: Default Script: reimplement DefaultTopicInfo` }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
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
  Quest Property QuestToSetStageOn Auto Const
  { If this is left blank, stage will be set on topic info's owning quest }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log. }
EndGroup


;-- Functions ---------------------------------------

Function TryToSetStage()
  Quest questToSet = QuestToSetStageOn
  If questToSet == None
    questToSet = Self.GetOwningQuest()
  EndIf
  defaultscriptfunctions.TryToSetStage(Self as ScriptObject, ShowTraces, questToSet, StageToSet, PrereqStage, TurnOffStage, TurnOffStageDone, None, False, None, None, None, None, None, None, None, False, None, False, None)
EndFunction
