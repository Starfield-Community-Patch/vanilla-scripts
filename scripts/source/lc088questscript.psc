ScriptName LC088QuestScript Extends Quest
{ Quest script for LC088, the Crimson Fleet Final Battle. }

;-- Variables ---------------------------------------
Int CONST_CaptainState_Active = 0 Const
Int CONST_CaptainState_Dead = 2 Const
Int CONST_CaptainState_Freed = 4 Const
Int CONST_CaptainState_Imprisoned = 3 Const
Int CONST_CaptainState_Inactive = 1 Const
Int CONST_EstelleDifficulty_Default = 3 Const
Int CONST_LC088Space_DebugModeStage = 30 Const
Int CONST_LC088Space_PlayerSetupDoneStage = 32 Const

;-- Properties --------------------------------------
Group AutofillProperties
  Quest Property LC088_Space Auto Const mandatory
  Quest Property LC088_Vigilance Auto Const mandatory
  Quest Property LC088_Key Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Rokov Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Mathis Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Naeva Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Adler Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Huan Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Estelle Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainStateDifficulty_Estelle Auto Const mandatory
  ActorValue Property CFSD01EvidenceTotal Auto Const mandatory
  ActorValue Property CFSD01EvidenceMax Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function QuickstartSpace(Int stage, Int missingEvidenceFragments, Int rokovState, Int mathisState, Int naevaState, Int adlerState, Int huanState, Int estelleState, Int estelleDifficulty)
  Self.Start()
  Self.UpdateCaptainStates(rokovState, mathisState, naevaState, adlerState, huanState, estelleState, estelleDifficulty)
  Game.GetPlayer().SetValue(CFSD01EvidenceTotal, Math.Max(0.0, Game.GetPlayer().GetValue(CFSD01EvidenceMax) - missingEvidenceFragments as Float))
  LC088_Space.SetStage(stage)
EndFunction

Function QuickstartVigilance(Int stage, Int rokovState, Int mathisState, Int naevaState, Int adlerState, Int huanState, Int estelleState, Int estelleDifficulty)
  Self.Start()
  Self.UpdateCaptainStates(rokovState, mathisState, naevaState, adlerState, huanState, estelleState, estelleDifficulty)
  LC088_Vigilance.SetStage(stage)
EndFunction

Function QuickstartKey(Int stage, Int rokovState, Int mathisState, Int naevaState, Int adlerState, Int huanState, Int estelleState, Int estelleDifficulty)
  Self.Start()
  Self.UpdateCaptainStates(rokovState, mathisState, naevaState, adlerState, huanState, estelleState, estelleDifficulty)
  LC088_Key.SetStage(stage)
EndFunction

Function UpdateCaptainStates(Int rokovState, Int mathisState, Int naevaState, Int adlerState, Int huanState, Int estelleState, Int estelleDifficulty)
  CrimsonFleetCaptainState_Rokov.SetValue(rokovState as Float)
  CrimsonFleetCaptainState_Mathis.SetValue(mathisState as Float)
  CrimsonFleetCaptainState_Naeva.SetValue(naevaState as Float)
  CrimsonFleetCaptainState_Adler.SetValue(adlerState as Float)
  CrimsonFleetCaptainState_Huan.SetValue(huanState as Float)
  CrimsonFleetCaptainState_Estelle.SetValue(estelleState as Float)
  If estelleDifficulty == 0
    estelleDifficulty = CONST_EstelleDifficulty_Default
  EndIf
  CrimsonFleetCaptainStateDifficulty_Estelle.SetValue(estelleDifficulty as Float)
EndFunction
