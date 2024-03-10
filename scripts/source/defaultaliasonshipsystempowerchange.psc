ScriptName DefaultAliasOnShipSystemPowerChange Extends ReferenceAlias Const default
{ sets stages when the ship in this alias changes system power

Actor values for ship systems:
 SpaceshipBuildableEnginePower
 SpaceshipBuildableThrusterPower
 SpaceshipBuildableShieldPower
 SpaceshipGravJumpPower }

;-- Structs -----------------------------------------
Struct SystemPowerChangeStage
  Int StageToSet
  { Stage to Set }
  ActorValue TargetSystem
  { The ship system we're interested in }
  Bool SetStageOnlyWhenPowerAdded
  { OPTIONAL - (Default: false) If true, stage will be set only when power is added to this system. If false, stage will be set when any power change is made to this system }
  Bool SetStageOnlyFromNormalPowerChange
  { OPTIONAL - (Default: false) If true, stage will be set only when this system power change is not from taking damage. If false, stage will be set when this system changes power for any reason, including system damage }
  Int PrereqStage = -1
  { OPTIONAL - Stage that must be set for this script's functionality to execute for this case }
  Int TurnOffStage = -1
  { OPTIONAL - If stage >= TurnOffStage, this script's functionality is ignored for this case }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group SystemPowerChange_Properties
  defaultaliasonshipsystempowerchange:systempowerchangestage[] Property SystemPowerChangeStages Auto Const
  { array of stage/system data }
EndGroup

Group Optional_Properties
  Int Property PrereqStage = -1 Auto Const
  { Stage that must be set for this script's functionality to execute }
  Int Property TurnOffStage = -1 Auto Const
  { If stage >= TurnOffStage, this script's functionality is ignored }
  Int Property TurnOffStageDone = -1 Auto Const
  { If this stage is specfically done, this script's functionality is ignored }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { (Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
EndGroup


;-- Functions ---------------------------------------

Event OnShipSystemPowerChange(ActorValue akSystem, Bool abAddPower, Bool abDamageRelated)
  Quest myQuest = Self.GetOwningQuest()
  If (PrereqStage == -1 || myQuest.GetStageDone(PrereqStage)) && (TurnOffStage == -1 || myQuest.GetStage() < TurnOffStage)
    Int I = 0
    While I < SystemPowerChangeStages.Length
      defaultaliasonshipsystempowerchange:systempowerchangestage theSystemPowerChange = SystemPowerChangeStages[I]
      If theSystemPowerChange.TargetSystem == akSystem
        If myQuest.GetStageDone(theSystemPowerChange.StageToSet) == False && (theSystemPowerChange.PrereqStage == -1 || myQuest.GetStageDone(theSystemPowerChange.PrereqStage)) && (theSystemPowerChange.TurnOffStage == -1 || myQuest.GetStage() < theSystemPowerChange.TurnOffStage)
          If theSystemPowerChange.SetStageOnlyWhenPowerAdded == False || abAddPower
            If theSystemPowerChange.SetStageOnlyFromNormalPowerChange == False || abDamageRelated == False
              defaultscriptfunctions.TryToSetStage(Self as ScriptObject, ShowTraces, myQuest, theSystemPowerChange.StageToSet, PrereqStage, TurnOffStage, TurnOffStageDone, None, False, None, None, None, None, None, None, None, False, None, False, None)
            EndIf
          EndIf
        EndIf
      EndIf
      I += 1
    EndWhile
  EndIf
EndEvent
