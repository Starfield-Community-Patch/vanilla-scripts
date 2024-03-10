ScriptName Fragments:Quests:QF_UC_NA_CL_VanguardScene_0006AA90 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property UC_NA_CL_TolimanScene_Scene Auto Const mandatory
ReferenceAlias Property Alias_Pilot Auto Const mandatory
ReferenceAlias Property Alias_Citizen Auto Const mandatory
ReferenceAlias Property Alias_Trigger Auto Const mandatory
ReferenceAlias Property Alias_Functionary02 Auto Const mandatory
ReferenceAlias Property Alias_RecruitM02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  UC_NA_CL_TolimanScene_Scene.Start()
EndFunction

Function Fragment_Stage_0999_Item_00()
  Alias_Pilot.GetRef().Disable(False)
  Alias_Citizen.GetRef().Disable(False)
  Alias_Functionary02.GetRef().Disable(False)
  Alias_RecruitM02.GetRef().Disable(False)
  Alias_Trigger.GetRef().Disable(False)
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
