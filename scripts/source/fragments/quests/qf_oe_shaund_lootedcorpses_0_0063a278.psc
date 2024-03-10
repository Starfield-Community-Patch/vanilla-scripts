ScriptName Fragments:Quests:QF_OE_ShaunD_LootedCorpses_0_0063A278 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Player Auto Const mandatory
ReferenceAlias Property Alias_NPC01 Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const
ActorValue Property Aggression Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_NPC01.GetActorReference().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Alias_NPC01.GetActorReference().AddToFaction(PlayerEnemyFaction)
  Alias_NPC01.GetActorReference().SetValue(Aggression, 1.0)
  Alias_NPC01.GetActorReference().StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest
  oescript kmyQuest = __temp as oescript
EndFunction
