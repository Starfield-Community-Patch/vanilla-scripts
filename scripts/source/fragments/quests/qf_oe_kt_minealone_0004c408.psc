ScriptName Fragments:Quests:QF_OE_KT_MineAlone_0004C408 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_NPC_Trader Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_NPC_Trader.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Actor TraderRef = Alias_NPC_Trader.GetActorRef()
  TraderRef.AddtoFaction(PlayerEnemyFaction)
  TraderRef.SetValue(Aggression, 1.0)
  TraderRef.StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction
