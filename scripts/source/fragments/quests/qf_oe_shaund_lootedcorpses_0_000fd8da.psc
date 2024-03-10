ScriptName Fragments:Quests:QF_OE_ShaunD_LootedCorpses_0_000FD8DA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_NPC01 Auto Const mandatory
ActorValue Property Aggression Auto Const
Faction Property PlayerEnemyFaction Auto Const
ReferenceAlias Property Alias_Marker_Corpse00 Auto Const mandatory
Furniture Property NPCSearchingFloor Auto Const
Keyword Property LinkCustom01 Auto Const
RefCollectionAlias Property Alias_Corpses Auto Const mandatory
ReferenceAlias Property Alias_LootingFurn Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Float offset = 1.0
  ObjectReference lootingFurn = Alias_LootingFurn.GetRef()
  lootingFurn.SetAngle(0.0, 0.0, 180.0)
  lootingFurn.MoveTo(Alias_Marker_Corpse00.getReference(), 0.0, offset, 0.0, False, False)
  lootingFurn.MoveToNearestNavmeshLocation()
  Int I = 1
  While I < Alias_Corpses.GetCount()
    Alias_Corpses.GetAt(I - 1).SetLinkedRef(Alias_Corpses.GetAt(I), None, True)
    I += 1
  EndWhile
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
