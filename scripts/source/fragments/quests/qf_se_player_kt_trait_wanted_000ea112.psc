ScriptName Fragments:Quests:QF_SE_Player_KT_Trait_Wanted_000EA112 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_Patrollers Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Quest Property TraitWanted Auto Const mandatory
GlobalVariable Property Trait_Wanted_KillGlobal Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
spaceshipbase Property BountyHunterShip Auto Const mandatory
spaceshipbase Property BountyHunterShipBoss Auto Const mandatory
ReferenceAlias Property Alias_BountyNote01 Auto Const mandatory
ReferenceAlias Property Alias_PatrolShip01 Auto Const mandatory
Book Property Trait_Wanted_DataSlate01 Auto Const mandatory
Scene Property SE_Player_Trait_Wanted_HailCombat Auto Const mandatory
Scene Property SE_Player_Trait_Wanted_HailStart Auto Const mandatory
ReferenceAlias Property Alias_PatrolShip02 Auto Const mandatory
ReferenceAlias Property Alias_PatrolShip03 Auto Const mandatory
ReferenceAlias Property Alias_PatrolShip04 Auto Const mandatory
GlobalVariable Property Trait_Credit_ExtortionSmall Auto Const mandatory
GlobalVariable Property Trait_Credit_ExtortionMedium Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
ReferenceAlias Property Alias_PatrolShip05 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
spaceshipbase Property BountyHunterUnaggressive Auto Const mandatory
GlobalVariable Property Trait_Credit_ValueIncrease Auto Const mandatory
GlobalVariable Property Trait_Credit_WantedMedium Auto Const mandatory
GlobalVariable Property Trait_Wanted_SE_CooldownDays Auto Const mandatory
ActorValue Property Trait_Wanted_SE_Cooldown_AVIF Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
GlobalVariable Property SE_Player_ChanceTraitWantedGlobal Auto Const mandatory
Int Property OddsStart Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  TraitWanted.Start()
  Alias_PatrolShip04.GetShipRef().SetValue(Aggression, 0.0)
  Alias_PatrolShip05.GetShipRef().SetValue(Aggression, 0.0)
EndFunction

Function Fragment_Stage_0000_Item_01()
  SE_Player_ChanceTraitWantedGlobal.SetValue(OddsStart as Float)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Utility.Wait(5.0)
  SE_Player_Trait_Wanted_HailStart.Start()
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_PatrolShip01.GetShipRef().EnableWithGravJump()
  Alias_PatrolShip02.GetShipRef().EnableWithGravJump()
EndFunction

Function Fragment_Stage_0010_Item_01()
  Alias_PatrolShip03.GetShipRef().EnableWithGravJump()
EndFunction

Function Fragment_Stage_0010_Item_02()
  Alias_PatrolShip04.GetShipRef().EnableWithGravJump()
  Alias_PatrolShip05.GetShipRef().EnableWithGravJump()
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_Patrollers.RemovefromFaction(PlayerFriendFaction)
  Alias_Patrollers.AddtoFaction(PlayerEnemyFaction)
  Alias_Patrollers.SetValue(Aggression, 1.0)
  Alias_Patrollers.StartCombatAll(Alias_Player.GetShipRef() as ObjectReference)
  Alias_PatrolShip01.GetShipRef().AddAliasedItem(Trait_Wanted_DataSlate01 as Form, Alias_BountyNote01 as Alias, 1, True)
  SE_Player_Trait_Wanted_HailStart.Stop()
EndFunction

Function Fragment_Stage_0025_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, Trait_Credit_ExtortionSmall.GetValueInt(), False, None)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, Trait_Credit_ExtortionMedium.GetValueInt(), False, None)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0090_Item_00()
  SE_Player_Trait_Wanted_HailStart.Stop()
  TraitWanted.SetStage(20)
  Utility.Wait(1.0)
  Alias_MapMarker.GetRef().DisableNoWait(False)
  ObjectReference[] ShipRef = Alias_Patrollers.GetArray()
  Int I = 0
  While I < ShipRef.Length
    (ShipRef[I] as spaceshipreference).DisableWithGravJump()
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0100_Item_00()
  TraitWanted.SetStage(10)
  Int ChanceValue = Trait_Wanted_KillGlobal.GetValueInt()
  Trait_Wanted_KillGlobal.SetValue((ChanceValue + 1) as Float)
  If !Self.GetStageDone(80)
    Int BountyIncrease = Trait_Credit_ValueIncrease.GetValueInt()
    Int CurrentBountyValue = Trait_Credit_WantedMedium.GetValueInt() + BountyIncrease
    Trait_Credit_WantedMedium.SetValue(CurrentBountyValue as Float)
  EndIf
  Float expiry = Utility.ExpiryDay(Trait_Wanted_SE_CooldownDays.GetValue(), None, -1.0, -1.0)
  Game.GetPlayer().SetValue(Trait_Wanted_SE_Cooldown_AVIF, expiry)
EndFunction

Function Fragment_Stage_0100_Item_01()
  Int ChanceValue = SE_Player_ChanceTraitWantedGlobal.GetValueInt()
  SE_Player_ChanceTraitWantedGlobal.SetValue((ChanceValue + 1) as Float)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
