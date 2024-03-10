ScriptName Fragments:Quests:QF_TestStopCombat_01001D47 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_EclipticEnemy Auto Const mandatory
ReferenceAlias Property Alias_CitizenFriend Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Alias_EclipticEnemy.GetActorRef().StopCombat()
  Alias_CitizenFriend.GetActorRef().StopCombat()
EndFunction
