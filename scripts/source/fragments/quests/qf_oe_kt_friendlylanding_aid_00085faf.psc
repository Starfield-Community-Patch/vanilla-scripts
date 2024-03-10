ScriptName Fragments:Quests:QF_OE_KT_FriendlyLanding_Aid_00085FAF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LeveledItem Property LL_Weapon_Ranged_Any Auto Const mandatory
MiscObject Property InorgCommonHelium3 Auto Const mandatory
Potion Property DrinkPack_Water_Md Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property OE_Credit_ExtortionMedium Auto Const mandatory
FormList Property OnlyWaterList Auto Const mandatory
ReferenceAlias Property Alias_NPC_Trader Auto Const mandatory
Potion Property ShipRepairKit Auto Const mandatory
Potion Property DrinkPouch_CrystalWater_Md Auto Const mandatory
ReferenceAlias Property Alias_NPC02 Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group01 Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
ReferenceAlias Property Alias_NPC_Patrol Auto Const mandatory
ReferenceAlias Property Alias_NPC_Search Auto Const mandatory
LocationAlias Property Alias_ShipA_InteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_ShipA_LandingDeckMarker00 Auto Const mandatory
LocationAlias Property Alias_ShipA_ExteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
ReferenceAlias Property Alias_soundMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().RemoveItem(InorgCommonHelium3 as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0008_Item_00()
  Game.GetPlayer().RemoveItem(DrinkPouch_CrystalWater_Md as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0008_Item_01()
  Game.GetPlayer().RemoveItem(DrinkPack_Water_Md as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0009_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, OE_Credit_ExtortionMedium.GetValueInt(), False)
  If Self.GetStageDone(1)
    Self.SetStage(2)
  ElseIf Self.GetStageDone(3)
    Self.SetStage(8)
  Else
    Self.SetStage(12)
  EndIf
EndFunction

Function Fragment_Stage_0012_Item_00()
  Game.GetPlayer().RemoveItem(ShipRepairKit as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0015_Item_00()
  Alias_ShipA.GetShipRef().PlayAnimation("to_ShipDamageState02")
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_NPC_Group01.AddRef(Alias_NPC_Trader.GetRef())
  Alias_NPC_Group01.AddRef(Alias_NPC_Patrol.GetRef())
  Alias_NPC_Group01.AddRef(Alias_NPC_Search.GetRef())
EndFunction

Function Fragment_Stage_0025_Item_00()
  Alias_ShipA.RefillDependentAliases()
  Alias_MapMarker.TryToEnable()
  Alias_soundMarker.GetRef().EnableNoWait(False)
  Utility.Wait(6.0)
  Self.SetStage(30)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_NPC_Group01.RemoveFromFaction(REPlayerFriend)
  Alias_NPC_Group01.AddtoFaction(PlayerEnemyFaction)
  Alias_NPC_Group01.StartCombatAll(Game.GetPlayer() as ObjectReference)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  kmyQuest.LandShip(-1)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
