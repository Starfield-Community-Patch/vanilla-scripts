ScriptName RI03_SceneDataSetStage Extends Scene
{ Script for setting a quest's stage from the Scene Data on a scene. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
  Int Property StageToSet = -1 Auto Const mandatory
  { Stage to set. }
  Quest Property QuestToSet Auto Const mandatory
  { Quest to set the stage on. }
EndGroup

Group Optional_Properties
  Bool Property SetStageOnEnd = False Auto Const
  { If true, set stage on end. If false, set stage on begin. }
  Int Property PrereqStage = -1 Auto Const
  { Stage that must be set for this script's functionality to execute. }
  Int Property TurnOffStage = -1 Auto Const
  { If stage >= TurnOffStage, this script's functionality is ignored. }
  Int Property TurnOffStageDone = -1 Auto Const
  { If this stage is specfically done, this script's functionality is ignored. }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log. }
EndGroup


;-- Functions ---------------------------------------

Event OnBegin()
  If !SetStageOnEnd
    Self.TryToSetStage()
  EndIf
EndEvent

Event OnEnd()
  If SetStageOnEnd
    Self.TryToSetStage()
  EndIf
EndEvent

Function TryToSetStage()
  defaultscriptfunctions.TryToSetStage(Self as ScriptObject, ShowTraces, QuestToSet, StageToSet, PrereqStage, TurnOffStage, TurnOffStageDone, None, False, None, None, None, None, None, None, None, False, None, False, None)
EndFunction
