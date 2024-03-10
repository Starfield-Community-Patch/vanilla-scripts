ScriptName Fragments:Quests:QF_OE_AustinF_CECSuperfan_00006E53 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property PlayerEnemyFaction Auto Const
ReferenceAlias Property Alias_NPC00 Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory
Scene Property Scene_PlayerWins Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Companion.GetActorRef().EvaluatePackage(False)
  Alias_NPC00.GetActorRef().AddToFaction(PlayerEnemyFaction)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Scene_PlayerWins.Start()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
