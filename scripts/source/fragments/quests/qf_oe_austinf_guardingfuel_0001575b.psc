ScriptName Fragments:Quests:QF_OE_AustinF_GuardingFuel_0001575B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Furniture Property NPCInjuredOnGround Auto Const
Keyword Property LinkCustom01 Auto Const
ReferenceAlias Property Alias_NPC00 Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_NPC00.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Alias_NPC00.GetActorRef().AddToFaction(PlayerEnemyFaction)
EndFunction
