ScriptName Fragments:Quests:QF_MS04_001CD001 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property MS04_PickedUp_IntroBook Auto Const mandatory
Book Property MS04_IntroSlate Auto Const mandatory
ReferenceAlias Property Alias_SecretOutpostSlate Auto Const mandatory
Scene Property MS04_SpacerEavesdrop01 Auto Const mandatory
ReferenceAlias Property Alias_Livvey Auto Const mandatory
Scene Property MS04_0500_FinalMessage Auto Const mandatory
Scene Property AudioLogs_MS04_AliceInheritance Auto Const mandatory
Scene Property AudioLogs_MS04_AliceLearnsMantis Auto Const mandatory
Scene Property MS04_Livvey_01_PuzzleSolved Auto Const mandatory
Scene Property MS04_0475_LivveyBetrayal Auto Const mandatory
ReferenceAlias Property Alias_InitialSpacer Auto Const mandatory
Scene Property MS04_0300_InitialSpacerWarning Auto Const mandatory
Scene Property MS04_0390_LiveyBark Auto Const mandatory
Scene Property MS04_SpacerEavesdrop02 Auto Const mandatory
ReferenceAlias Property Alias_BetrayalDoor Auto Const mandatory
ReferenceAlias Property Alias_MantisShip Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ActorValue Property MS04_Foreknowledge_LivveyBetrayalAV Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_WorldMapMarker Auto Const mandatory
ObjectReference Property LC119RobotActivationTrigger Auto Const mandatory
ReferenceAlias Property Alias_BetrayalTrigger Auto Const mandatory
ObjectReference Property LivveyExplosionMarker Auto Const mandatory
Explosion Property fragGrenadeExplosion Auto Const mandatory
ReferenceAlias Property Alias_LivveyExplosionMarker Auto Const mandatory
ActorValue Property SpaceshipRegistration Auto Const mandatory
Float Property cooldownDays Auto Const mandatory
GlobalVariable Property SE_Player_FAB15_Timestamp Auto Const mandatory
GlobalVariable Property SE_Player_FAB16_Timestamp Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  MS04_PickedUp_IntroBook.SetValue(1.0)
  Game.GetPlayer().RemoveItem(MS04_IntroSlate as Form, 1, True, None)
  Game.GetPlayer().AddAliasedItem(MS04_IntroSlate as Form, Alias_SecretOutpostSlate as Alias, 1, True)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Alias_WorldMapMarker.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  MS04_0300_InitialSpacerWarning.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0302_Item_00()
  Alias_InitialSpacer.GetRef().SetValue(Aggression, 2.0)
  Alias_InitialSpacer.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function Fragment_Stage_0305_Item_00()
  MS04_SpacerEavesdrop01.Start()
EndFunction

Function Fragment_Stage_0310_Item_00()
  MS04_SpacerEavesdrop02.Start()
EndFunction

Function Fragment_Stage_0325_Item_00()
  MS04_Livvey_01_PuzzleSolved.Start()
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveDisplayed(350, True, False)
EndFunction

Function Fragment_Stage_0355_Item_00()
  If Self.GetStageDone(360) && Self.GetStageDone(365) && Self.GetStageDone(370)
    Self.SetObjectiveCompleted(350, True)
  EndIf
  AudioLogs_MS04_AliceInheritance.Start()
EndFunction

Function Fragment_Stage_0360_Item_00()
  If Self.GetStageDone(355) && Self.GetStageDone(365) && Self.GetStageDone(370)
    Self.SetObjectiveCompleted(350, True)
  EndIf
  AudioLogs_MS04_AliceLearnsMantis.Start()
EndFunction

Function Fragment_Stage_0365_Item_00()
  If Self.GetStageDone(355) && Self.GetStageDone(360) && Self.GetStageDone(370)
    Self.SetObjectiveCompleted(350, True)
  EndIf
EndFunction

Function Fragment_Stage_0370_Item_00()
  If Self.GetStageDone(355) && Self.GetStageDone(360) && Self.GetStageDone(365)
    Self.SetObjectiveCompleted(350, True)
  EndIf
EndFunction

Function Fragment_Stage_0390_Item_00()
  If !Self.GetStageDone(480)
    Self.SetObjectiveDisplayed(400, True, False)
    MS04_0390_LiveyBark.Start()
  EndIf
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(400, True)
EndFunction

Function Fragment_Stage_0405_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Actor aTarg = Alias_Livvey.GetActorRef()
  aTarg.RemoveFromAllFactions()
  aTarg.SetValue(Aggression, 2.0)
  aTarg.StartCombat(Game.GetPlayer() as ObjectReference, False)
  aTarg.AddToFaction(PlayerEnemyFaction)
  aTarg.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0450_Item_00()
  Alias_Livvey.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0475_Item_00()
  MS04_0475_LivveyBetrayal.Start()
  ObjectReference oDoor = Alias_BetrayalDoor.GetRef()
  oDoor.SetOpen(False)
  oDoor.SetLockLevel(254)
  oDoor.Lock(True, False, True)
  Alias_BetrayalTrigger.GetRef().Enable(False)
  Game.GetPlayer().SetValue(MS04_Foreknowledge_LivveyBetrayalAV, 1.0)
EndFunction

Function Fragment_Stage_0477_Item_00()
  Alias_LivveyExplosionMarker.GetRef().PlaceAtMe(fragGrenadeExplosion as Form, 1, False, False, True, None, None, True)
  Alias_Livvey.GetActorRef().SetProtected(False)
  Alias_Livvey.GetActorRef().Kill(None)
  ObjectReference oDoor = Alias_BetrayalDoor.GetRef()
  oDoor.SetOpen(True)
  oDoor.SetLockLevel(0)
  oDoor.Lock(False, False, True)
EndFunction

Function Fragment_Stage_0480_Item_00()
  Self.SetObjectiveDisplayed(400, False, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(600, True, False)
  Self.SetObjectiveDisplayed(700, True, False)
  MS04_0500_FinalMessage.Start()
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(600, True)
  If Self.GetStageDone(700)
    Self.SetStage(800)
  EndIf
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(700, True)
  spaceshipreference myShip = Alias_MantisShip.GetShipRef()
  sq_playershipscript SQ_PlayerShip = Game.GetForm(95394) as sq_playershipscript
  SQ_PlayerShip.AddPlayerOwnedShip(myShip)
  myShip.SetValue(SpaceshipRegistration, 1.0)
  Alias_MantisShip.GetRef().Enable(False)
  Alias_MantisShip.GetShipRef().SetExteriorLoadDoorInaccessible(False)
  If Self.GetStageDone(600)
    Self.SetStage(800)
  EndIf
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveDisplayed(800, True, False)
  Actor aLivvey = Alias_Livvey.GetActorRef()
  If aLivvey.IsDead() == False
    aLivvey.Disable(False)
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Self.SetStage(9000)
  Float currentGameTime = Utility.GetCurrentGameTime()
  SE_Player_FAB15_Timestamp.SetValue(currentGameTime + cooldownDays)
  SE_Player_FAB16_Timestamp.SetValue(currentGameTime + cooldownDays)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
