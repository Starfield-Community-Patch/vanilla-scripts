ScriptName Fragments:Quests:QF_OE_MP_AcelesPatrol_00118925 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_BiomePredators Auto Const mandatory
ReferenceAlias Property Alias_TerrorMorph Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_MapMarker.TryToEnable()
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.Stop()
EndFunction
