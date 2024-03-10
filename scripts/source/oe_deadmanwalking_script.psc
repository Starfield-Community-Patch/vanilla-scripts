ScriptName OE_DeadManWalking_Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group General
  Int Property InfectionStage = 300 Auto Const
EndGroup

Group Autofill
  sq_env_afflictionsscript Property ENV_AfflictionsScript Auto Const mandatory
  env_afflictionscript Property ENV_AFFL_Infection_LungInfection Auto Const mandatory
  env_afflictionscript Property ENV_AFFL_Infection_BrainInfection Auto Const mandatory
  env_afflictionscript Property ENV_AFFL_Infection_IntestinalInfection Auto Const mandatory
  ReferenceAlias Property Alias_Colonist Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Self as ScriptObject, "OnStageSet")
EndEvent

Event OnStageSet(Int auiStageID, Int auiItemID)
  If auiStageID == InfectionStage
    Self.InfectPlayer()
    Self.UnregisterForRemoteEvent(Self as ScriptObject, "OnStageSet")
  EndIf
EndEvent

Function InfectPlayer()
  ENV_AFFL_Infection_LungInfection.Gain(False, False)
  If Self.GetStageDone(600)
    ENV_AFFL_Infection_BrainInfection.Gain(False, False)
    ENV_AFFL_Infection_IntestinalInfection.Gain(False, False)
  EndIf
  Alias_Colonist.GetActorRef().SetProtected(False)
  Alias_Colonist.GetActorRef().EvaluatePackage(False)
EndFunction
