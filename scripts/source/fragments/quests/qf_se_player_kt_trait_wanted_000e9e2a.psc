ScriptName Fragments:Quests:QF_SE_Player_KT_Trait_Wanted_000E9E2A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property Attack01_100a_DefenderHailStart Auto Const mandatory
RefCollectionAlias Property Alias_DefendersRC Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
Quest Property TraitWanted Auto Const mandatory
ReferenceAlias Property Alias_AttackerShip01 Auto Const mandatory
ReferenceAlias Property Alias_SpacerShip02 Auto Const mandatory
ReferenceAlias Property Alias_SpacerShip03 Auto Const mandatory
ReferenceAlias Property Alias_AttackerShip02 Auto Const mandatory
ReferenceAlias Property Alias_AttackerShip03 Auto Const mandatory
GlobalVariable Property Trait_Credit_ValueIncrease Auto Const mandatory
GlobalVariable Property Trait_Credit_WantedMedium Auto Const mandatory
GlobalVariable Property Trait_Wanted_SE_CooldownDays Auto Const mandatory
ActorValue Property Trait_Wanted_SE_Cooldown_AVIF Auto Const mandatory
GlobalVariable Property Trait_Wanted_KillGlobal Auto Const mandatory
GlobalVariable Property SE_Player_ChanceTraitWantedGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  TraitWanted.Start()
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_DefendersRC.RemoveFromFaction(PlayerFriendFaction)
  Alias_DefendersRC.AddtoFaction(PlayerEnemyFaction)
  Alias_DefendersRC.StartCombatAll(Alias_PlayerShip.GetShipRef() as ObjectReference)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Utility.Wait(7.0)
  spaceshipreference pDefender01 = Alias_HailingShip.GetShipRef()
  spaceshipreference pDefender02 = Alias_SpacerShip02.GetShipRef()
  spaceshipreference pDefender03 = Alias_SpacerShip03.GetShipRef()
  spaceshipreference pAttacker = Alias_AttackerShip01.GetShipRef()
  pDefender01.MoveNear(pAttacker as ObjectReference, 0, 0, 0)
  pDefender02.MoveNear(pAttacker as ObjectReference, 0, 0, 0)
  pDefender03.MoveNear(pAttacker as ObjectReference, 0, 0, 0)
  pDefender01.EnableWithGravJump()
  pDefender02.EnableWithGravJump()
  pDefender03.EnableWithGravJump()
EndFunction

Function Fragment_Stage_0030_Item_00()
  spaceshipreference pAttacker01 = Alias_AttackerShip01.GetShipRef()
  spaceshipreference pAttacker02 = Alias_AttackerShip02.GetShipRef()
  spaceshipreference pAttacker03 = Alias_AttackerShip03.GetShipRef()
  spaceshipreference playerShip = Alias_PlayerShip.GetShipRef()
  pAttacker01.MoveNear(playerShip as ObjectReference, 0, 0, 0)
  pAttacker02.MoveNear(playerShip as ObjectReference, 0, 0, 0)
  pAttacker03.MoveNear(playerShip as ObjectReference, 0, 0, 0)
  pAttacker01.EnableWithGravJump()
  pAttacker02.EnableWithGravJump()
  pAttacker03.EnableWithGravJump()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Attack01_100a_DefenderHailStart.Start()
  Int ChanceValue = Trait_Wanted_KillGlobal.GetValueInt()
  Trait_Wanted_KillGlobal.SetValue((ChanceValue + 1) as Float)
  Int BountyIncrease = Trait_Credit_ValueIncrease.GetValueInt()
  Int CurrentBountyValue = Trait_Credit_WantedMedium.GetValueInt() + BountyIncrease
  Trait_Credit_WantedMedium.SetValue(CurrentBountyValue as Float)
  Float expiry = Utility.ExpiryDay(Trait_Wanted_SE_CooldownDays.GetValue(), None, -1.0, -1.0)
  Game.GetPlayer().SetValue(Trait_Wanted_SE_Cooldown_AVIF, expiry)
EndFunction

Function Fragment_Stage_0050_Item_01()
  Int ChanceValue = SE_Player_ChanceTraitWantedGlobal.GetValueInt()
  SE_Player_ChanceTraitWantedGlobal.SetValue((ChanceValue + 1) as Float)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Utility.Wait(3.0)
  ObjectReference[] ShipsRef = Alias_DefendersRC.GetArray()
  Int I = 0
  While I < ShipsRef.Length
    (ShipsRef[I] as spaceshipreference).DisableWithGravJump()
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
