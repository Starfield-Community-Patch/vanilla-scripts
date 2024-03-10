ScriptName Fragments:Quests:QF_OE_KT_FriendlyLanding_Ven_00083246 Extends Quest Const hidden

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
ReferenceAlias Property Alias_NPC_Merc Auto Const mandatory
ReferenceAlias Property Alias_NPC_Robot Auto Const mandatory
ReferenceAlias Property Alias_NPC_Pet Auto Const mandatory
ReferenceAlias Property Alias_NPC_PetOwner Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group01 Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Marker_TravelB03 Auto Const mandatory
GlobalVariable Property OE_KT_FriendlyVendorsGlobal Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
GlobalVariable Property OE_KT_ParkerGrumbleDeathStatus Auto Const mandatory
GlobalVariable Property OE_KT_ParkerMetOnceGlobal Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
Faction Property OE_KT_FriendlyVendorsFaction Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0025_Item_00()
  ObjectReference RobotRef = Alias_NPC_Robot.GetRef()
  ObjectReference TraderRef = Alias_NPC_Trader.GetRef()
  RobotRef.EnableNoWait(False)
  Alias_NPC_Group01.AddRef(TraderRef)
  Alias_NPC_Group01.AddRef(RobotRef)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Actor MercRef = Alias_NPC_Merc.GetActorRef()
  ObjectReference TraderRef = Alias_NPC_Trader.GetRef()
  MercRef.EquipItem(LL_Weapon_Ranged_Any as Form, False, False)
  Alias_NPC_Group01.AddRef(MercRef as ObjectReference)
  Alias_NPC_Group01.AddRef(TraderRef)
EndFunction

Function Fragment_Stage_0034_Item_00()
  OE_KT_FriendlyVendorsGlobal.SetValue(1.0)
EndFunction

Function Fragment_Stage_0035_Item_00()
  ObjectReference OwnerRef = Alias_NPC_PetOwner.GetRef()
  ObjectReference PetRef = Alias_NPC_Pet.GetRef()
  PetRef.EnableNoWait(False)
  OwnerRef.EnableNoWait(False)
  Alias_NPC_Group01.AddRef(PetRef)
  Alias_NPC_Group01.AddRef(OwnerRef)
EndFunction

Function Fragment_Stage_0040_Item_00()
  OE_KT_ParkerMetOnceGlobal.SetValue(1.0)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_NPC_Group01.RemoveFromFaction(REPlayerFriend)
  Alias_NPC_Group01.SetValue(Aggression, 1.0)
  Alias_NPC_Group01.AddtoFaction(PlayerEnemyFaction)
  Alias_NPC_Group01.StartCombatAll(Game.GetPlayer() as ObjectReference)
EndFunction

Function Fragment_Stage_0066_Item_00()
  OE_KT_ParkerGrumbleDeathStatus.SetValue(1.0)
EndFunction

Function Fragment_Stage_0090_Item_00()
  Int random = Utility.RandomInt(0, 100)
  If random > 50
    Self.SetStage(25)
  ElseIf random > 0
    Self.SetStage(30)
  EndIf
EndFunction

Function Fragment_Stage_0090_Item_01()
  Self.SetStage(35)
EndFunction

Function Fragment_Stage_0090_Item_02()
  Alias_MapMarker.TryToEnable()
  Alias_ShipA.GetShipRef().SetFactionOwner(OE_KT_FriendlyVendorsFaction, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
