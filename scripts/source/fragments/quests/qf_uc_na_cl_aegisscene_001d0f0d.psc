ScriptName Fragments:Quests:QF_UC_NA_CL_AEGISScene_001D0F0D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property UC_NA_CL_TolimanScene_Scene Auto Const mandatory
ReferenceAlias Property Alias_Pilot Auto Const mandatory
ReferenceAlias Property Alias_Citizen Auto Const mandatory
ReferenceAlias Property Alias_Trigger Auto Const mandatory
Scene Property UC_NA_CL_AEGISScene_PlayerDetected Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_Pilot.GetRef().Enable(False)
  Alias_Citizen.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  UC_NA_CL_TolimanScene_Scene.Start()
EndFunction

Function Fragment_Stage_0150_Item_00()
  If !Self.GetStageDone(200)
    UC_NA_CL_TolimanScene_Scene.Stop()
    UC_NA_CL_AEGISScene_PlayerDetected.Start()
    Self.SetStage(160)
  EndIf
EndFunction

Function Fragment_Stage_0999_Item_00()
  Alias_Pilot.GetRef().Disable(False)
  Alias_Citizen.GetRef().Disable(False)
  Alias_Trigger.GetRef().Disable(False)
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
