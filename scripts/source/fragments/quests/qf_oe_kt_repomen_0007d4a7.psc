ScriptName Fragments:Quests:QF_OE_KT_RepoMen_0007D4A7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LeveledItem Property LL_Weapon_Ranged_Any Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group01 Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
spaceshipbase Property RepoSpaceship Auto Const mandatory
ReferenceAlias Property Alias_Marker_ShipLandingA Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory
LocationAlias Property Alias_ShipA_InteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_ShipA_InteriorMarker00 Auto Const mandatory
LeveledItem Property LL_OE_AlternativeReward Auto Const mandatory
Faction Property OE_GroupAllyFaction Auto Const mandatory
GlobalVariable Property OE_Credit_RepoBounty Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_NPC_RepoPerson03 Auto Const mandatory
ReferenceAlias Property Alias_NPC_RepoPerson02 Auto Const mandatory
ReferenceAlias Property Alias_NPC_RepoPerson01 Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Faction Property CrimeFactionFreestar Auto Const mandatory
ReferenceAlias Property Alias_NPCStandingClipboard Auto Const mandatory
ReferenceAlias Property Alias_ShipDoor Auto Const mandatory
LocationAlias Property Alias_ShipA_ExteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_ShipA_LandingDeckMarker00 Auto Const mandatory
ReferenceAlias Property Alias_ShipA_LandingDeckMarker01 Auto Const mandatory
ReferenceAlias Property Alias_Marker_TravelB02 Auto Const mandatory
ReferenceAlias Property Alias_ShipA_LandingDeckMarker02 Auto Const mandatory
ActorBase Property LvlSecurity_Freestar Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
ActorBase Property LvlSecurity_UC Auto Const mandatory
ReferenceAlias Property Alias_ShipA_PilotSeat Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  kmyQuest.LandShip(1)
EndFunction

Function Fragment_Stage_0020_Item_00()
  ObjectReference mySeat = Alias_ShipA_PilotSeat.GetRef()
  mySeat.BlockActivation(True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  ObjectReference mySeat = Alias_ShipA_PilotSeat.GetRef()
  mySeat.BlockActivation(False, False)
  Alias_ShipA_PilotSeat.Clear()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_NPC_Group01.RemoveFromFaction(REPlayerFriend)
  Alias_NPC_Group01.AddtoFaction(PlayerEnemyFaction)
  Alias_NPC_Group01.StartCombatAll(Game.GetPlayer() as ObjectReference)
EndFunction

Function Fragment_Stage_0080_Item_00()
  Self.SetStage(84)
EndFunction

Function Fragment_Stage_0080_Item_01()
  ObjectReference LandingDeckUCRef = Alias_ShipA_LandingDeckMarker00.GetRef()
  ObjectReference UCGuard01Ref = LandingDeckUCRef.PlaceAtMe(LvlSecurity_UC as Form, 1, False, False, True, None, None, True)
  ObjectReference UCGuard02Ref = LandingDeckUCRef.PlaceAtMe(LvlSecurity_UC as Form, 1, False, False, True, None, None, True)
  ObjectReference UCGuard03Ref = LandingDeckUCRef.PlaceAtMe(LvlSecurity_UC as Form, 1, False, False, True, None, None, True)
  Alias_NPC_RepoPerson01.ForceRefTo(UCGuard01Ref)
  Alias_NPC_RepoPerson02.ForceRefTo(UCGuard02Ref)
  Alias_NPC_RepoPerson03.ForceRefTo(UCGuard03Ref)
  Alias_NPC_Group01.AddRef(Alias_NPC_RepoPerson01.GetRef())
  Alias_NPC_Group01.AddRef(Alias_NPC_RepoPerson02.GetRef())
  Alias_NPC_Group01.AddRef(Alias_NPC_RepoPerson03.GetRef())
  Alias_NPC_Group01.EnableAll(LandingDeckUCRef as Bool)
  Alias_NPC_Group01.MoveAllTo(LandingDeckUCRef)
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0084_Item_00()
  ObjectReference LandingDeckRef = Alias_ShipA_LandingDeckMarker00.GetRef()
  ObjectReference Freestar01Ref = LandingDeckRef.PlaceAtMe(LvlSecurity_Freestar as Form, 1, False, False, True, None, None, True)
  ObjectReference Freestar02Ref = LandingDeckRef.PlaceAtMe(LvlSecurity_Freestar as Form, 1, False, False, True, None, None, True)
  ObjectReference Freestar03Ref = LandingDeckRef.PlaceAtMe(LvlSecurity_Freestar as Form, 1, False, False, True, None, None, True)
  Alias_NPC_RepoPerson01.ForceRefTo(Freestar01Ref)
  Alias_NPC_RepoPerson02.ForceRefTo(Freestar02Ref)
  Alias_NPC_RepoPerson03.ForceRefTo(Freestar03Ref)
  Alias_NPC_Group01.AddRef(Alias_NPC_RepoPerson01.GetRef())
  Alias_NPC_Group01.AddRef(Alias_NPC_RepoPerson02.GetRef())
  Alias_NPC_Group01.AddRef(Alias_NPC_RepoPerson03.GetRef())
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0090_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  Alias_ShipA.RefillDependentAliases()
  If Self.GetStageDone(10)
    Self.SetStage(80)
  Else
    Self.SetStage(84)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  Int I = Utility.RandomInt(0, 1)
  If I == 1
    kmyQuest.LandShip(0)
  Else
    Self.SetStage(10)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_01()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  kmyQuest.LandShip(0)
EndFunction

Function Fragment_Stage_0100_Item_02()
  Self.SetStage(10)
EndFunction

Function Fragment_Stage_0100_Item_03()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  Int I = Utility.RandomInt(0, 1)
  If I == 1
    kmyQuest.LandShip(0)
  Else
    Self.SetStage(10)
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_Guard.Clear()
  Self.Stop()
EndFunction
