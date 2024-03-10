ScriptName LC165SpaceQuestScript Extends Quest
{ One of the quest scripts for LC165, Buried Temple. Handles the space encounter at the beginning of the quest. }

;-- Variables ---------------------------------------
Float CONST_AdversaryShipRetreatHealthPercent = 0.400000006 Const
Float CONST_AllyAppearsDelay = 3.0 Const
Int CONST_AllySpawnTimerID = 1 Const
Float CONST_InitialCloakingDelayMax = 0.5 Const
Float CONST_InitialCloakingDelayMin = 0.25 Const
Float CONST_InitialSpawnDelayMax = 0.5 Const
Float CONST_InitialSpawnDelayMin = 0.25 Const
Int CONST_LevelMod_Medium = 1 Const
Float CONST_ReinforcementSpawnDelayMax = 1.5 Const
Float CONST_ReinforcementSpawnDelayMin = 0.5 Const
Int CONST_ShipDockingPermission_Never = 4 Const
Int CONST_Stage_AdversaryShipRetreatedStage = 180 Const
Int CONST_Stage_AllyShipEnabledStage = 150 Const
Int CONST_Stage_ReinforcementsFinishedSpawningStage = 131 Const
Int CONST_Stage_SpaceBattleCompletedStage = 190 Const
Int CONST_Stage_SpaceBattleStartedStage = 110 Const
Int CONST_Stage_SpawnReinforcementsStage = 130 Const
Float adversary01ShipBaseHealth
spaceshipreference adversary01ShipRef
Bool adversary01ShipRetreated
Float adversary02ShipBaseHealth
spaceshipreference adversary02ShipRef
Bool adversary02ShipRetreated
spaceshipreference allyShipRef
Bool hasEnabledAllyShip
Actor player
ObjectReference spaceHoldPositionTriggerRef
Bool waitingForPlayerToSit

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard CheckForAdversaryRetreat

;-- Properties --------------------------------------
Group QuestProperties
  spaceshipbase Property QuickstartShip Auto Const mandatory
  { If the player is not in a ship when the space quickstart is run, spawn this ship and force them into it. }
EndGroup

Group AutofillProperties
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property PlayerShipPilotSeat Auto Const mandatory
  ReferenceAlias Property AllyShip Auto Const mandatory
  ReferenceAlias Property Adversary01Ship Auto Const mandatory
  ReferenceAlias Property Adversary02Ship Auto Const mandatory
  ReferenceAlias Property AdversaryShipStartMarker Auto Const mandatory
  ReferenceAlias Property Adversary01ShipStartMarker Auto Const mandatory
  ReferenceAlias Property Adversary02ShipStartMarker Auto Const mandatory
  ReferenceAlias Property GenericShipSpawnPoint01Marker Auto Const mandatory
  ReferenceAlias Property GenericShipSpawnPoint02Marker Auto Const mandatory
  ReferenceAlias Property SpaceHoldPositionTrigger Auto Const mandatory
  RefCollectionAlias Property InitialGenericShips Auto Const mandatory
  RefCollectionAlias Property ReinforcementGenericShips Auto Const mandatory
  RefCollectionAlias Property AllShips Auto Const mandatory
  MusicType Property MUSGenesisCombatBoss_MQ302_SpaceBattle Auto Const mandatory
  ObjectReference Property NewGameShipMarkerRef Auto Const mandatory
  spaceshipbase Property LC165_LvlStarbornShip Auto Const mandatory
  Location Property LC165BuriedTempleSpaceLocation Auto Const mandatory
  Faction Property PlayerFriendFaction Auto Const mandatory
  Perk Property Piloting Auto Const mandatory
  Spell Property AbStarbornShipCloaking Auto Const mandatory
  Keyword Property DMP_Combat_HoldPosition Auto Const mandatory
  GlobalVariable Property MQ302B_AllyShipSpawnDelay Auto Const mandatory
  ActorValue Property Health Auto Const mandatory
  ActorValue Property DockingPermission Auto Const mandatory
  ActorValue Property Aggression Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  player = Game.GetPlayer()
  spaceHoldPositionTriggerRef = SpaceHoldPositionTrigger.GetRef()
EndEvent

Function QuickstartToSpace()
  spaceshipreference playerShipRef = PlayerShip.GetShipRef()
  If playerShipRef == None
    inputenablelayer myEnableLayer = inputenablelayer.Create()
    myEnableLayer.DisablePlayerControls(True, True, True, False, False, True, True, False, True, True, False)
    spaceshipreference testShip = NewGameShipMarkerRef.PlaceShipAtMe(QuickstartShip as Form, 4, True, False, False, True, None, None, None, True)
    SQ_PlayerShip.ResetPlayerShip(testShip)
    SQ_PlayerShip.ResetHomeShip(testShip)
    player.AddPerk(Piloting, False)
    player.AddPerk(Piloting, False)
    player.AddPerk(Piloting, False)
    player.AddPerk(Piloting, False)
    player.MoveTo(testShip as ObjectReference, 0.0, 0.0, 0.0, True, False)
    SQ_PlayerShip.HandleShipTakeOff(True, False)
    PlayerShipPilotSeat.GetRef().Activate(player as ObjectReference, False)
    myEnableLayer.Delete()
    waitingForPlayerToSit = True
    Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnSit")
    While waitingForPlayerToSit
      Utility.Wait(0.5)
    EndWhile
  EndIf
EndFunction

Event Actor.OnSit(Actor akSource, ObjectReference akFurniture)
  waitingForPlayerToSit = False
EndEvent

Function SetupSpaceEncounter()
  spaceshipreference playerShipRef = PlayerShip.GetShipRef()
  adversary01ShipRef = Adversary01Ship.GetShipRef()
  adversary01ShipRef.Reset(None)
  adversary01ShipBaseHealth = adversary01ShipRef.GetBaseValue(Health)
  adversary02ShipRef = Adversary02Ship.GetShipRef()
  If adversary02ShipRef == None
    Self.Private_SetupAdversaryShip(adversary01ShipRef, AdversaryShipStartMarker.GetRef())
    Utility.Wait(Utility.RandomFloat(CONST_InitialSpawnDelayMin, CONST_InitialSpawnDelayMax))
    Self.Private_SetupGenericShip(GenericShipSpawnPoint01Marker.GetRef(), LC165_LvlStarbornShip, CONST_LevelMod_Medium)
    Utility.Wait(Utility.RandomFloat(CONST_InitialSpawnDelayMin, CONST_InitialSpawnDelayMax))
    Self.Private_SetupGenericShip(GenericShipSpawnPoint02Marker.GetRef(), LC165_LvlStarbornShip, CONST_LevelMod_Medium)
  Else
    adversary02ShipRef.Reset(None)
    adversary02ShipBaseHealth = adversary02ShipRef.GetBaseValue(Health)
    Self.Private_SetupAdversaryShip(adversary01ShipRef, Adversary01ShipStartMarker.GetRef())
    Utility.Wait(Utility.RandomFloat(CONST_InitialSpawnDelayMin, CONST_InitialSpawnDelayMax))
    Self.Private_SetupAdversaryShip(adversary02ShipRef, Adversary02ShipStartMarker.GetRef())
    Utility.Wait(Utility.RandomFloat(CONST_InitialSpawnDelayMin, CONST_InitialSpawnDelayMax))
    Self.Private_SetupGenericShip(GenericShipSpawnPoint01Marker.GetRef(), LC165_LvlStarbornShip, CONST_LevelMod_Medium)
  EndIf
EndFunction

Function Private_SetupAdversaryShip(spaceshipreference ship, ObjectReference startMarker)
  ship.Disable(False)
  ship.MoveTo(startMarker, 0.0, 0.0, 0.0, True, False)
  ship.SetNoBleedoutRecovery(True)
  ship.SetValue(DockingPermission, CONST_ShipDockingPermission_Never as Float)
  ship.SetLinkedRef(spaceHoldPositionTriggerRef, DMP_Combat_HoldPosition, True)
  ship.AddToFaction(PlayerFriendFaction)
  AllShips.AddRef(ship as ObjectReference)
  Self.RegisterForHitEvent(ship as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  Self.RegisterForRemoteEvent(ship as ScriptObject, "OnEnterBleedout")
  ship.EnableWithGravJumpNoWait()
EndFunction

Function Private_SetupGenericShip(ObjectReference shipSpawnMarker, spaceshipbase shipBase, Int shipLevelMod)
  spaceshipreference genericShipRef = shipSpawnMarker.PlaceShipAtMe(shipBase as Form, shipLevelMod, True, False, True, True, None, None, None, True)
  genericShipRef.SetLinkedRef(spaceHoldPositionTriggerRef, DMP_Combat_HoldPosition, True)
  genericShipRef.AddToFaction(PlayerFriendFaction)
  InitialGenericShips.AddRef(genericShipRef as ObjectReference)
  AllShips.AddRef(genericShipRef as ObjectReference)
  Self.RegisterForRemoteEvent(genericShipRef as ScriptObject, "OnDying")
  genericShipRef.EnableWithGravJumpNoWait()
EndFunction

Function ForceCloakStarbornShips()
  spaceshipreference[] initialGenericShipRefs = InitialGenericShips.GetArray() as spaceshipreference[]
  Int I = 0
  While I < initialGenericShipRefs.Length
    initialGenericShipRefs[I].AddSpell(AbStarbornShipCloaking, True)
    Utility.Wait(Utility.RandomFloat(CONST_InitialCloakingDelayMin, CONST_InitialCloakingDelayMax))
    I += 1
  EndWhile
  adversary01ShipRef.AddSpell(AbStarbornShipCloaking, True)
  If adversary02ShipRef != None
    Utility.Wait(Utility.RandomFloat(CONST_InitialCloakingDelayMin, CONST_InitialCloakingDelayMax))
    adversary02ShipRef.AddSpell(AbStarbornShipCloaking, True)
  EndIf
EndFunction

Function StartSpaceEncounter()
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange")
  MUSGenesisCombatBoss_MQ302_SpaceBattle.Add()
  spaceshipreference playerShipRef = PlayerShip.GetShipRef()
  adversary01ShipRef.RemoveFromFaction(PlayerFriendFaction)
  adversary01ShipRef.SetValue(Aggression, 2.0)
  adversary01ShipRef.StartCombat(playerShipRef, False)
  adversary01ShipRef.EvaluatePackage(False)
  If adversary02ShipRef != None
    adversary02ShipRef.RemoveFromFaction(PlayerFriendFaction)
    adversary02ShipRef.SetValue(Aggression, 2.0)
    adversary02ShipRef.StartCombat(playerShipRef, False)
    adversary02ShipRef.EvaluatePackage(False)
  EndIf
  Int I = 0
  spaceshipreference[] initialGenericShipRefs = InitialGenericShips.GetArray() as spaceshipreference[]
  While I < initialGenericShipRefs.Length
    initialGenericShipRefs[I].RemoveFromFaction(PlayerFriendFaction)
    initialGenericShipRefs[I].StartCombat(playerShipRef, False)
    initialGenericShipRefs[I].EvaluatePackage(False)
    I += 1
  EndWhile
  Self.StartTimer(MQ302B_AllyShipSpawnDelay.GetValue(), CONST_AllySpawnTimerID)
EndFunction

Event OnTimer(Int timerID)
  If timerID == CONST_AllySpawnTimerID
    If PlayerShip.GetShipRef().GetCurrentLocation() == LC165BuriedTempleSpaceLocation
      Self.EnablePlayerAllyShip()
    Else
      Self.StartTimer(CONST_AllyAppearsDelay, CONST_AllySpawnTimerID)
    EndIf
  EndIf
EndEvent

Function EndSpaceEncounter()
  MUSGenesisCombatBoss_MQ302_SpaceBattle.Remove()
EndFunction

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSource, Location akOldLoc, Location akNewLoc)
  If akNewLoc == LC165BuriedTempleSpaceLocation && Self.GetStageDone(CONST_Stage_SpaceBattleStartedStage) && !Self.GetStageDone(CONST_Stage_SpaceBattleCompletedStage)
    MUSGenesisCombatBoss_MQ302_SpaceBattle.Add()
  ElseIf akOldLoc == LC165BuriedTempleSpaceLocation
    MUSGenesisCombatBoss_MQ302_SpaceBattle.Remove()
  EndIf
EndEvent

Event SpaceshipReference.OnDying(spaceshipreference akSource, ObjectReference akKiller)
  If !Self.GetStageDone(CONST_Stage_SpawnReinforcementsStage)
    Self.SetStage(CONST_Stage_SpawnReinforcementsStage)
  EndIf
EndEvent

Function SpawnSpaceEncounterReinforcements()
  spaceshipreference playerShipRef = PlayerShip.GetShipRef()
  If adversary02ShipRef == None
    Self.SetStage(CONST_Stage_ReinforcementsFinishedSpawningStage)
    If !hasEnabledAllyShip
      Self.StartTimer(CONST_AllyAppearsDelay, CONST_AllySpawnTimerID)
    EndIf
  Else
    Self.SetStage(CONST_Stage_ReinforcementsFinishedSpawningStage)
  EndIf
EndFunction

Function EnablePlayerAllyShip()
  If !hasEnabledAllyShip
    hasEnabledAllyShip = True
    allyShipRef = AllyShip.GetShipRef()
    If allyShipRef != None
      allyShipRef.MoveNear(PlayerShip.GetShipRef() as ObjectReference, allyShipRef.CONST_NearPosition_ForwardWide, allyShipRef.CONST_NearDistance_Close, allyShipRef.CONST_NearFacing_AwaySmall)
      allyShipRef.SetValue(DockingPermission, CONST_ShipDockingPermission_Never as Float)
      allyShipRef.EnableWithGravJump()
      AllShips.AddRef(allyShipRef as ObjectReference)
    EndIf
    Self.SetStage(CONST_Stage_AllyShipEnabledStage)
  EndIf
EndFunction

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Bool retreated = Self.CheckForAdversaryRetreat(akTarget as spaceshipreference, -1.0)
  If !retreated
    Self.RegisterForHitEvent(akTarget as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  EndIf
EndEvent

Event SpaceshipReference.OnEnterBleedout(spaceshipreference akSource)
  Self.CheckForAdversaryRetreat(akSource, 0.0)
EndEvent

Bool Function CheckForAdversaryRetreat(spaceshipreference ship, Float overrideHealthPercent)
  Bool shipRetreated = False
  Guard CheckForAdversaryRetreat ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If ship == adversary01ShipRef
      Float adversary01ShipHealthPercent = adversary01ShipRef.GetValue(Health) / adversary01ShipBaseHealth
      If overrideHealthPercent >= 0.0
        adversary01ShipHealthPercent = overrideHealthPercent
      EndIf
      If adversary01ShipHealthPercent < CONST_AdversaryShipRetreatHealthPercent
        shipRetreated = True
        adversary01ShipRetreated = True
        If adversary01ShipRef.Is3DLoaded()
          adversary01ShipRef.DisableWithGravJumpNoWait()
        Else
          adversary01ShipRef.DisableNoWait(False)
        EndIf
      EndIf
    ElseIf ship == adversary02ShipRef
      Float adversary02ShipHealthPercent = adversary02ShipRef.GetValue(Health) / adversary02ShipBaseHealth
      If overrideHealthPercent >= 0.0
        adversary02ShipHealthPercent = overrideHealthPercent
      EndIf
      If adversary02ShipHealthPercent < CONST_AdversaryShipRetreatHealthPercent
        shipRetreated = True
        adversary02ShipRetreated = True
        If adversary02ShipRef.Is3DLoaded()
          adversary02ShipRef.DisableWithGravJumpNoWait()
        Else
          adversary02ShipRef.DisableNoWait(False)
        EndIf
      EndIf
    EndIf
    If adversary01ShipRetreated && (adversary02ShipRef == None || adversary02ShipRetreated)
      Self.SetStage(CONST_Stage_AdversaryShipRetreatedStage)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  Return shipRetreated
EndFunction
