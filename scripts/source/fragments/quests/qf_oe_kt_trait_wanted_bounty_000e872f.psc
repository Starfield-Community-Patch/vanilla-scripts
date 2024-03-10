ScriptName Fragments:Quests:QF_OE_KT_Trait_Wanted_Bounty_000E872F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_NPC01 Auto Const mandatory
ReferenceAlias Property Alias_NPC02 Auto Const mandatory
ReferenceAlias Property Alias_NPC03 Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group01 Auto Const mandatory
ReferenceAlias Property Alias_NPC04 Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Book Property Trait_Wanted_DataSlate01 Auto Const mandatory
ReferenceAlias Property Alias_BountyNote01 Auto Const mandatory
GlobalVariable Property Trait_Credit_ExtortionSmall Auto Const mandatory
GlobalVariable Property Trait_Credit_ExtortionMedium Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory
ReferenceAlias Property Alias_Marker_ShipLandingA Auto Const mandatory
Faction Property PlayerAllyFaction Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Float Property TimeDelayForShipArrival Auto Const mandatory
Quest Property TraitWanted Auto Const mandatory
ReferenceAlias Property Alias_Marker_ShipLandingB Auto Const mandatory
ReferenceAlias Property Alias_ShipB Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group02 Auto Const mandatory
ReferenceAlias Property Alias_NPC05 Auto Const mandatory
ReferenceAlias Property Alias_NPC06 Auto Const mandatory
ReferenceAlias Property Alias_NPC07 Auto Const mandatory
Float Property ShipSpawnHeightFloat Auto Const mandatory
Scene Property Trait_NPC_BountyHunterEncounter Auto Const mandatory
GlobalVariable Property Trait_Wanted_KillGlobal Auto Const mandatory
spaceshipbase Property LvlShip_Ecliptic_Combat Auto Const mandatory
LocationAlias Property Alias_ShipA_InteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_ShipA_InteriorMarker00 Auto Const mandatory
LocationAlias Property Alias_ShipB_InteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_ShipB_InteriorMarker00 Auto Const mandatory
spaceshipbase Property LvlShip_Spacer_Combat Auto Const mandatory
LocationAlias Property Alias_ShipA_ExteriorLocation Auto Const mandatory
LocationAlias Property Alias_ShipB_ExteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_ShipA_LandingDeckMarker01 Auto Const mandatory
ReferenceAlias Property Alias_ShipB_LandingDeckMarker01 Auto Const mandatory
ReferenceAlias Property Alias_NPC08 Auto Const mandatory
ReferenceAlias Property Alias_NPC09 Auto Const mandatory
bescript Property BE_Generic Auto Const mandatory
ReferenceAlias Property Alias_ShipA_LandingDeckMarker02 Auto Const mandatory
ReferenceAlias Property Alias_ShipB_LandingDeckMarker02 Auto Const mandatory
ReferenceAlias Property Alias_ShipA_LandingDeckMarker03 Auto Const mandatory
ReferenceAlias Property Alias_ShipB_LandingDeckMarker03 Auto Const mandatory
ReferenceAlias Property Alias_ShipB_LandingDeckMarker00 Auto Const mandatory
ReferenceAlias Property Alias_ShipA_LandingDeckMarker00 Auto Const mandatory
GlobalVariable Property Trait_Credit_WantedMedium Auto Const mandatory
GlobalVariable Property Trait_Credit_ValueIncrease Auto Const mandatory
GlobalVariable Property SE_Player_ChanceTraitWantedGlobal Auto Const mandatory
GlobalVariable Property OE_Trait_Wanted_BountyHunters_Cooldown Auto Const mandatory
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory
ReferenceAlias[] Property enemyShipRef Auto Const mandatory
bescript[] Property BE_GenericQuests Auto Const mandatory
GlobalVariable Property Trait_Wanted_SE_CooldownDays Auto Const mandatory
ActorValue Property Trait_Wanted_SE_Cooldown_AVIF Auto Const mandatory
GlobalVariable Property OE_TraitWantedRandomPercent Auto Const mandatory
Int Property EncounterOdds Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Trait_NPC_BountyHunterEncounter.Start()
EndFunction

Function Fragment_Stage_0004_Item_00()
  Quest __temp = Self as Quest
  oescript kmyQuest = __temp as oescript
  ObjectReference ExtraNPC = Alias_NPC04.GetRef()
  ObjectReference LandingMarker = Alias_ShipA_LandingDeckMarker03.GetRef()
  If LandingMarker != None
    ExtraNPC.MoveTo(LandingMarker, 0.0, 0.0, 0.0, True, False)
  Else
    ExtraNPC.MoveTo(Alias_NPC03.GetRef(), 0.0, 0.0, 0.0, True, False)
  EndIf
  Alias_NPC_Group01.AddRef(ExtraNPC)
  ExtraNPC.EnableNoWait(False)
EndFunction

Function Fragment_Stage_0004_Item_01()
  Alias_NPC04.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_0006_Item_00()
  Int I = Utility.RandomInt(0, 1)
  If I == 1
    Self.SetStage(7)
  EndIf
EndFunction

Function Fragment_Stage_0007_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  If Alias_Marker_ShipLandingB.GetRef() != None
    kmyQuest.LandShip(1)
  EndIf
EndFunction

Function Fragment_Stage_0008_Item_00()
  Alias_ShipB.RefillDependentAliases()
EndFunction

Function Fragment_Stage_0009_Item_00()
  Alias_ShipA.RefillDependentAliases()
  Alias_PilotSeat.GetRef().BlockActivation(True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  kmyQuest.LandShip(0)
  OE_TraitWantedRandomPercent.SetValue(EncounterOdds as Float)
EndFunction

Function Fragment_Stage_0010_Item_01()
  Quest __temp = Self as Quest
  oescript kmyQuest = __temp as oescript
  kmyQuest.SetCooldown()
EndFunction

Function Fragment_Stage_0015_Item_00()
  ObjectReference NPC01 = Alias_NPC01.GetActorRef() as ObjectReference
  ObjectReference NPC02 = Alias_NPC02.GetActorRef() as ObjectReference
  ObjectReference NPC03 = Alias_NPC03.GetActorRef() as ObjectReference
  NPC01.MoveTo(Alias_ShipA_LandingDeckMarker00.GetRef(), 0.0, 0.0, 0.0, True, False)
  NPC02.MoveTo(Alias_ShipA_LandingDeckMarker01.GetRef(), 0.0, 0.0, 0.0, True, False)
  NPC03.MoveTo(Alias_ShipA_LandingDeckMarker02.GetRef(), 0.0, 0.0, 0.0, True, False)
  NPC01.EnableNoWait(False)
  NPC02.EnableNoWait(False)
  NPC03.EnableNoWait(False)
EndFunction

Function Fragment_Stage_0015_Item_01()
  Self.SetStage(4)
EndFunction

Function Fragment_Stage_0015_Item_02()
  Self.SetStage(6)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_NPC_Group01.AddRef(Alias_NPC01.GetRef())
  Alias_NPC_Group01.AddRef(Alias_NPC02.GetRef())
  Alias_NPC_Group01.AddRef(Alias_NPC03.GetRef())
  If Self.GetStageDone(4)
    Alias_NPC_Group01.AddRef(Alias_NPC04.GetRef())
  EndIf
  Alias_NPC01.GetRef().AddAliasedItem(Trait_Wanted_DataSlate01 as Form, Alias_BountyNote01 as Alias, 1, True)
  Alias_NPC_Group01.RemovefromFaction(PlayerFriendFaction)
  Alias_NPC_Group01.AddtoFaction(PlayerEnemyFaction)
  Alias_NPC_Group01.StartCombatAll(Game.GetPlayer() as ObjectReference)
  Alias_NPC_Group01.SetValue(Game.GetAggressionAV(), 1.0)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, Trait_Credit_ExtortionMedium.GetValueInt(), False, None)
  Self.SetStage(150)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, Trait_Credit_ExtortionMedium.GetValueInt(), False, None)
  Game.GetPlayer().RemoveItem(Credits as Form, Trait_Credit_ExtortionMedium.GetValueInt(), False, None)
  Self.SetStage(150)
EndFunction

Function Fragment_Stage_0035_Item_00()
  Alias_NPC_Group02.RemovefromFaction(PlayerAllyFaction)
  Alias_NPC_Group02.AddtoFaction(PlayerEnemyFaction)
  Alias_NPC_Group02.StartCombatAll(Game.GetPlayer() as ObjectReference)
EndFunction

Function Fragment_Stage_0040_Item_00()
  ObjectReference[] landingRamps = Alias_ShipB.GetShipRef().GetLandingRamps()
  Int I = 0
  While I < landingRamps.Length
    landingRamps[I].SetOpen(True)
    I += 1
  EndWhile
  ObjectReference NPC05 = Alias_NPC05.GetRef()
  ObjectReference NPC06 = Alias_NPC06.GetRef()
  ObjectReference NPC07 = Alias_NPC07.GetRef()
  ObjectReference NPC08 = Alias_NPC08.GetRef()
  ObjectReference NPC09 = Alias_NPC09.GetRef()
  NPC05.MoveTo(Alias_ShipB_LandingDeckMarker00.GetRef(), 0.0, 0.0, 0.0, True, False)
  NPC06.MoveTo(Alias_ShipB_LandingDeckMarker01.GetRef(), 0.0, 0.0, 0.0, True, False)
  NPC07.MoveTo(Alias_ShipB_LandingDeckMarker02.GetRef(), 0.0, 0.0, 0.0, True, False)
  NPC08.MoveTo(Alias_ShipB_LandingDeckMarker03.GetRef(), 0.0, 0.0, 0.0, True, False)
  NPC09.MoveTo(Alias_ShipB_LandingDeckMarker03.GetRef(), 0.0, 0.0, 0.0, True, False)
  NPC05.EnableNoWait(False)
  NPC06.EnableNoWait(False)
  NPC07.EnableNoWait(False)
  NPC08.EnableNoWait(False)
  NPC09.EnableNoWait(False)
  Alias_NPC_Group02.StartCombatAll(Alias_NPC01.GetRef())
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetStage(10)
EndFunction

Function Fragment_Stage_0079_Item_00()
  Int I = 0
  While I < BE_GenericQuests.Length
    If BE_GenericQuests[I].IsRunning() && enemyShipRef[I].GetShipRef() == Alias_ShipB.GetShipRef()
      BE_GenericQuests[I].SetEnemyShipLandingRampsOpenState(True)
    EndIf
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0080_Item_00()
  Int I = 0
  While I < BE_GenericQuests.Length
    If BE_GenericQuests[I].IsRunning() && enemyShipRef[I].GetShipRef() == Alias_ShipA.GetShipRef()
      BE_GenericQuests[I].SetEnemyShipLandingRampsOpenState(True)
    EndIf
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0100_Item_00()
  TraitWanted.Start()
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_NPC01.GetActorRef().EvaluatePackage(False)
  TraitWanted.SetStage(10)
  Int ChanceValue = Trait_Wanted_KillGlobal.GetValueInt()
  Trait_Wanted_KillGlobal.SetValue((ChanceValue + 1) as Float)
  If !Self.GetStageDone(30)
    Int BountyIncrease = Trait_Credit_ValueIncrease.GetValueInt()
    Int CurrentBountyValue = Trait_Credit_WantedMedium.GetValueInt() + BountyIncrease
    Trait_Credit_WantedMedium.SetValue(CurrentBountyValue as Float)
  EndIf
  Float expiry = Utility.ExpiryDay(Trait_Wanted_SE_CooldownDays.GetValue(), None, -1.0, -1.0)
  Game.GetPlayer().SetValue(Trait_Wanted_SE_Cooldown_AVIF, expiry)
  OE_TraitWantedRandomPercent.SetValue(EncounterOdds as Float)
EndFunction

Function Fragment_Stage_0150_Item_01()
  Int ChanceValue = SE_Player_ChanceTraitWantedGlobal.GetValueInt()
  SE_Player_ChanceTraitWantedGlobal.SetValue((ChanceValue + 1) as Float)
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest
  oescript kmyQuest = __temp as oescript
  Self.Stop()
EndFunction
