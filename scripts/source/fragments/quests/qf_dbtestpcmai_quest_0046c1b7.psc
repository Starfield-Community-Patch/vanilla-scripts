ScriptName Fragments:Quests:QF_DBTestPCMAI_Quest_0046C1B7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_NearbyPackin Auto Const mandatory
ActorValue Property DBTestPCMPackinVisitedAV Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Alias_NearbyPackin.GetRef().SetValue(DBTestPCMPackinVisitedAV, 1.0)
  Alias_NearbyPackin.RefillAlias()
EndFunction
