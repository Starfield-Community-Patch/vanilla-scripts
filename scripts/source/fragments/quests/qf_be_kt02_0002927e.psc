ScriptName Fragments:Quests:QF_BE_KT02_0002927E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property SpaceshipCrew Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const mandatory
Float Property GravityFloat Auto Const mandatory
GlobalVariable Property BE_KT01_InstanceID Auto Const mandatory
Scene Property BE_KT02_001_SceneStart Auto Const mandatory
LeveledItem Property LL_Drink_Any Auto Const mandatory
wwiseevent Property PartyMusicTrack Auto Const mandatory
MusicType Property MusicSilencer Auto Const mandatory
RefCollectionAlias Property Alias_GenericCrew Auto Const mandatory
ReferenceAlias Property Alias_CrewPartygoer Auto Const mandatory
ReferenceAlias Property Alias_Boatswain Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_Announcer Auto Const mandatory
Explosion Property BE_KT02_ExplosionHavok Auto Const mandatory
ReferenceAlias Property Alias_EnableMarker Auto Const mandatory
Quest Property SE_KT02 Auto Const mandatory
RefCollectionAlias Property Alias_AllCrew Auto Const mandatory
wwiseevent Property ShipPowerOn Auto Const mandatory
ReferenceAlias Property Alias_CaptainFurniture Auto Const mandatory
Faction Property BEKT02_CaptainFaction Auto Const mandatory
wwiseevent Property ZeroGOff Auto Const mandatory
ReferenceAlias Property Alias_BoatswainFurniture Auto Const mandatory
Faction Property BEKT02_BoatswainFaction Auto Const mandatory
ReferenceAlias Property Alias_GravitySwitch Auto Const mandatory
ReferenceAlias Property Alias_CrewPartygoer01 Auto Const mandatory
ReferenceAlias Property Alias_Pilot Auto Const mandatory
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
LocationAlias Property Alias_EnemyShipInteriorLocation Auto Const mandatory
Keyword Property LocTypeZeroGAllowClothes Auto Const mandatory
ReferenceAlias Property Alias_MiniBot Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_MiniBot.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0006_Item_00()
  BE_KT02_001_SceneStart.Stop()
EndFunction

Function Fragment_Stage_0007_Item_00()
  Alias_MiniBot.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0008_Item_00()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  kmyQuest.SetShipGravity(1.0)
  Alias_MiniBot.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0009_Item_00()
  Alias_Captain.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_CaptainFurniture.GetRef().SetFactionOwner(BEKT02_CaptainFaction, False)
  Alias_BoatswainFurniture.GetRef().SetFactionOwner(BEKT02_BoatswainFaction, False)
  Cell myCell = Alias_PilotSeat.GetRef().GetParentCell()
  myCell.SetPublic(True)
  Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(LocTypeZeroGAllowClothes)
EndFunction

Function Fragment_Stage_0015_Item_00()
  spaceshipreference enemyShipRef = Alias_EnemyShip.GetShipRef()
  enemyShipRef.SetValue(SpaceshipCrew, 0.0)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_AllCrew.AddRef(Alias_Captain.GetRef())
  Alias_AllCrew.AddRef(Alias_Boatswain.GetRef())
  Alias_AllCrew.AddRef(Alias_CrewPartygoer01.GetRef())
  Alias_AllCrew.AddRef(Alias_CrewPartygoer.GetRef())
  Alias_AllCrew.AddRef(Alias_Pilot.GetRef())
  SE_KT02.SetStage(30)
  BE_KT02_001_SceneStart.Start()
EndFunction

Function Fragment_Stage_0024_Item_00()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  ShipPowerOn.Play(Game.GetPlayer() as ObjectReference, None, None)
  Utility.Wait(1.0)
  kmyQuest.SetShipGravity(1.0)
  Alias_EnableMarker.GetRef().EnableNoWait(False)
  Alias_AllCrew.EvaluateAll()
  Alias_MiniBot.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  kmyQuest.SetShipGravity(GravityFloat)
  Game.GetPlayer().PlaceAtMe(BE_KT02_ExplosionHavok as Form, 1, False, False, True, None, None, True)
  BE_KT02_001_SceneStart.Stop()
  Alias_EnableMarker.GetRef().DisableNoWait(False)
  Alias_MiniBot.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  spaceshipreference enemyShipRef = Alias_EnemyShip.GetShipRef()
  enemyShipRef.SetValue(DockingPermission, 4.0)
  Utility.Wait(6.0)
  If !Self.GetStageDone(15)
    enemyShipRef.DisableWithGravJump()
  EndIf
  Self.Stop()
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_AllCrew.RemoveFromFaction(REPlayerFriend)
  Alias_AllCrew.AddtoFaction(PlayerEnemyFaction)
  Alias_AllCrew.SetValue(Aggression, 1.0)
  Alias_AllCrew.StartCombatAll(Game.GetPlayer() as ObjectReference)
EndFunction
