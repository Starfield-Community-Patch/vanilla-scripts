ScriptName Fragments:Quests:QF_OE_KT_KeepInMine_00046F6E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property OE_KT_KeepInMine_Scene01 Auto Const mandatory
ReferenceAlias Property Alias_NPC_Foreperson Auto Const mandatory
FormList Property OE_KT_FoodGiftList Auto Const mandatory
LeveledItem Property LL_Loot_Resource_Both_Common Auto Const mandatory
Scene Property OE_KT_KeepInMine_030_Thanks Auto Const mandatory
Scene Property OE_KT_KeepInMine_020_TL00b Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group00 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  OE_KT_KeepInMine_Scene01.Start()
EndFunction

Function Fragment_Stage_0030_Item_00()
  ObjectReference Miner = Alias_NPC_Foreperson.GetRef()
  Int FoodAmount = Miner.GetItemCount(OE_KT_FoodGiftList as Form)
  Miner.RemoveItem(OE_KT_FoodGiftList as Form, FoodAmount, False, None)
  Alias_NPC_Foreperson.GetRef().OpenOneWayTransferMenu(True, OE_KT_FoodGiftList)
EndFunction

Function Fragment_Stage_0040_Item_00()
  OE_KT_KeepInMine_020_TL00b.Stop()
  OE_KT_KeepInMine_030_Thanks.Start()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Int OreAmount = 0
  Int FoodAmount = Alias_NPC_Foreperson.GetRef().GetItemCount(OE_KT_FoodGiftList as Form)
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  If FoodAmount >= 20
    OreAmount = FoodAmount / 4
  EndIf
  If FoodAmount >= 20
    PlayerRef.AddItem(LL_Loot_Resource_Both_Common as Form, OreAmount, False)
  ElseIf FoodAmount >= 10
    PlayerRef.AddItem(LL_Loot_Resource_Both_Common as Form, 3, False)
  ElseIf FoodAmount >= 5
    PlayerRef.AddItem(LL_Loot_Resource_Both_Common as Form, 2, False)
  Else
    PlayerRef.AddItem(LL_Loot_Resource_Both_Common as Form, 1, False)
  EndIf
EndFunction

Function Fragment_Stage_0066_Item_00()
  Alias_NPC_Group00.AddtoFaction(PlayerEnemyFaction)
  Alias_NPC_Group00.SetValue(Aggression, 1.0)
  Alias_NPC_Group00.StartCombatAll(Game.GetPlayer() as ObjectReference)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
