ScriptName Fragments:Quests:QF_UC_CY_HeatleechScene_00158F2C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property UC_CY_HeatleechScene_Scene Auto Const mandatory
ReferenceAlias Property Alias_Pilot Auto Const mandatory
ReferenceAlias Property Alias_Tech01 Auto Const mandatory
ReferenceAlias Property Alias_Tech02 Auto Const mandatory
ReferenceAlias Property Alias_EnableMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0200_Item_00()
  UC_CY_HeatleechScene_Scene.Start()
EndFunction

Function Fragment_Stage_0210_Item_00()
  Alias_Pilot.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Alias_Tech01.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  UC_CY_HeatleechScene_Scene.Stop()
  Alias_Pilot.GetRef().Disable(False)
  Alias_Tech01.GetRef().Disable(False)
  Alias_Tech02.GetRef().Disable(False)
  Alias_EnableMarker.GetRef().Disable(False)
  Self.Stop()
EndFunction
