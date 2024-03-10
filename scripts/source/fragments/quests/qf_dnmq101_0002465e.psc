ScriptName Fragments:Quests:QF_DNMQ101_0002465E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_VecteraExteriorMiners Auto Const mandatory
ActorValue Property Suspicious Auto Const mandatory
RefCollectionAlias Property Alias_PirateRefCollection Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_VecteraExteriorMiners.SetValue(Suspicious, 2.0)
  Alias_PirateRefCollection.SetValue(Suspicious, 2.0)
EndFunction
