ScriptName ReferenceAlias Extends Alias Native hidden

;-- Functions ---------------------------------------

Function ApplyToRef(ObjectReference akRef) Native

Function Clear() Native

Function ForceRefTo(ObjectReference akNewRef) Native

ObjectReference Function GetReference() Native

Event OnActivate(ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnActorActivatedRef(ObjectReference akActivatedRef)
  ; Empty function
EndEvent

Event OnAffinityEvent(affinityevent akAffinityEvent, ActorValue akActorValue, GlobalVariable akReactionValue, ObjectReference akTarget)
  ; Empty function
EndEvent

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  ; Empty function
EndEvent

Event OnBuilderMenuSelect(ActorValue akActorValue)
  ; Empty function
EndEvent

Event OnCellAttach()
  ; Empty function
EndEvent

Event OnCellDetach()
  ; Empty function
EndEvent

Event OnCellLoad()
  ; Empty function
EndEvent

Event OnClose(ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnCombatListAdded(Actor akTarget)
  ; Empty function
EndEvent

Event OnCombatListRemoved(Actor akTarget)
  ; Empty function
EndEvent

Event OnCombatStateChanged(ObjectReference akTarget, Int aeCombatState)
  ; Empty function
EndEvent

Event OnCommandModeCompleteCommand(Int aeCommandType, ObjectReference akTarget)
  ; Empty function
EndEvent

Event OnCommandModeEnter()
  ; Empty function
EndEvent

Event OnCommandModeExit()
  ; Empty function
EndEvent

Event OnCommandModeGiveCommand(Int aeCommandType, ObjectReference akTarget)
  ; Empty function
EndEvent

Event OnCompanionDismiss()
  ; Empty function
EndEvent

Event OnConsciousnessStateChanged(Bool abUnconscious)
  ; Empty function
EndEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  ; Empty function
EndEvent

Event OnCrewAssigned(Actor akCrew, ObjectReference akAssignmentRef, ObjectReference akPreviousAssignmentRef)
  ; Empty function
EndEvent

Event OnCrewDismissed(Actor akCrew, ObjectReference akPreviousAssignmentRef)
  ; Empty function
EndEvent

Event OnCripple(ActorValue akActorValue, Bool abCrippled)
  ; Empty function
EndEvent

Event OnDeath(ObjectReference akKiller)
  ; Empty function
EndEvent

Event OnDeferredKill(Actor akKiller)
  ; Empty function
EndEvent

Event OnDestroyed(ObjectReference akDestroyer)
  ; Empty function
EndEvent

Event OnDestructionStageChanged(Int aiOldStage, Int aiCurrentStage)
  ; Empty function
EndEvent

Event OnDifficultyChanged(Int aOldDifficulty, Int aNewDifficulty)
  ; Empty function
EndEvent

Event OnDying(ObjectReference akKiller)
  ; Empty function
EndEvent

Event OnEnterBleedout()
  ; Empty function
EndEvent

Event OnEnterFurniture(Actor akActionRef)
  ; Empty function
EndEvent

Event OnEnterOutpostBeaconMode()
  ; Empty function
EndEvent

Event OnEnterShipInterior(ObjectReference akShip)
  ; Empty function
EndEvent

Event OnEnterSneaking()
  ; Empty function
EndEvent

Event OnEquipped(Actor akActor)
  ; Empty function
EndEvent

Event OnEscortWaitStart()
  ; Empty function
EndEvent

Event OnEscortWaitStop()
  ; Empty function
EndEvent

Event OnExitFurniture(ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnExitShipInterior(ObjectReference akShip)
  ; Empty function
EndEvent

Event OnGetUp(ObjectReference akFurniture)
  ; Empty function
EndEvent

Event OnGrab()
  ; Empty function
EndEvent

Event OnHomeShipSet(spaceshipreference akShip, spaceshipreference akPrevious)
  ; Empty function
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  ; Empty function
EndEvent

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)
  ; Empty function
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  ; Empty function
EndEvent

Event OnItemUnequipped(Form akBaseObject, ObjectReference akReference)
  ; Empty function
EndEvent

Event OnKill(ObjectReference akVictim)
  ; Empty function
EndEvent

Event OnLoad()
  ; Empty function
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  ; Empty function
EndEvent

Event OnLockStateChanged()
  ; Empty function
EndEvent

Event OnMapMarkerDiscovered()
  ; Empty function
EndEvent

Event OnObjectDestroyed(ObjectReference akReference)
  ; Empty function
EndEvent

Event OnObjectRepaired(ObjectReference akReference)
  ; Empty function
EndEvent

Event OnOpen(ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnOutpostItemPowerOff(ObjectReference akPoweredItem)
  ; Empty function
EndEvent

Event OnOutpostItemPowerOn(ObjectReference akPoweredItem, ObjectReference akPowerGenerator)
  ; Empty function
EndEvent

Event OnPackageChange(Package akOldPackage)
  ; Empty function
EndEvent

Event OnPackageEnd(Package akOldPackage)
  ; Empty function
EndEvent

Event OnPackageStart(Package akNewPackage)
  ; Empty function
EndEvent

Event OnPartialCripple(ActorValue akActorValue, Bool abCrippled)
  ; Empty function
EndEvent

Event OnPickLock(ObjectReference akLockedRef, Bool abCrime, Bool abSucceeded, terminalmenu akLockedTerminalMenu, Int aiTerminalMenuItem)
  ; Empty function
EndEvent

Event OnPickpocketFailed()
  ; Empty function
EndEvent

Event OnPipboyRadioDetection(Bool abDetected)
  ; Empty function
EndEvent

Event OnPlayerArrested(ObjectReference akGuard, Location akLocation, Int aeCrimeType)
  ; Empty function
EndEvent

Event OnPlayerAssaultActor(ObjectReference akVictim, Location akLocation, Bool aeCrime)
  ; Empty function
EndEvent

Event OnPlayerBuyShip(spaceshipreference akShip)
  ; Empty function
EndEvent

Event OnPlayerCompleteResearch(ObjectReference akBench, Location akLocation, researchproject akProject)
  ; Empty function
EndEvent

Event OnPlayerCraftItem(ObjectReference akBench, Location akLocation, Form akCreatedItem)
  ; Empty function
EndEvent

Event OnPlayerCreateRobot(Actor akNewRobot)
  ; Empty function
EndEvent

Event OnPlayerCrimeGold(ObjectReference akVictim, Form akFaction, Int aeCrimeGold, Int aeCrimeType)
  ; Empty function
EndEvent

Event OnPlayerDialogueTarget()
  ; Empty function
EndEvent

Event OnPlayerEnterVertibird(ObjectReference akVertibird)
  ; Empty function
EndEvent

Event OnPlayerFailedPlotRoute(Int aeFailedPlotReason)
  ; Empty function
EndEvent

Event OnPlayerFallLongDistance(Float afDamage)
  ; Empty function
EndEvent

Event OnPlayerFireWeapon(Form akBaseObject)
  ; Empty function
EndEvent

Event OnPlayerFollowerWarp(ObjectReference akFollower)
  ; Empty function
EndEvent

Event OnPlayerHealTeammate(Actor akTeammate)
  ; Empty function
EndEvent

Event OnPlayerItemAdded(Form akBaseObject, ObjectReference akOwner, ObjectReference akSourceContainer, Int aeAcquireType)
  ; Empty function
EndEvent

Event OnPlayerJail(ObjectReference akGuard, Form akFaction, Location akLocation, Int aeCrimeGold)
  ; Empty function
EndEvent

Event OnPlayerLoadGame()
  ; Empty function
EndEvent

Event OnPlayerLoiteringBegin()
  ; Empty function
EndEvent

Event OnPlayerLoiteringEnd()
  ; Empty function
EndEvent

Event OnPlayerModArmorWeapon(Form akBaseObject, objectmod akModBaseObject)
  ; Empty function
EndEvent

Event OnPlayerModRobot(Actor akRobot, objectmod akModBaseObject)
  ; Empty function
EndEvent

Event OnPlayerModifiedShip(spaceshipreference akShip)
  ; Empty function
EndEvent

Event OnPlayerMurderActor(ObjectReference akVictim, Location akLocation, Bool aeCrime)
  ; Empty function
EndEvent

Event OnPlayerPayFine(ObjectReference akGuard, Form akFaction, Int aeCrimeGold)
  ; Empty function
EndEvent

Event OnPlayerPlanetSurveyComplete(planet akPlanet)
  ; Empty function
EndEvent

Event OnPlayerScannedObject(ObjectReference akScannedRef)
  ; Empty function
EndEvent

Event OnPlayerSellShip(spaceshipreference akShip)
  ; Empty function
EndEvent

Event OnPlayerSwimming()
  ; Empty function
EndEvent

Event OnPlayerTrespass(ObjectReference akVictim, Location akLocation, Bool aeCrime)
  ; Empty function
EndEvent

Event OnPlayerUseWorkBench(ObjectReference akWorkBench)
  ; Empty function
EndEvent

Event OnPowerOff()
  ; Empty function
EndEvent

Event OnPowerOn(ObjectReference akPowerGenerator)
  ; Empty function
EndEvent

Event OnQuickContainerOpened()
  ; Empty function
EndEvent

Event OnRaceSwitchComplete()
  ; Empty function
EndEvent

Event OnRead()
  ; Empty function
EndEvent

Event OnRecoverFromBleedout()
  ; Empty function
EndEvent

Event OnRelease()
  ; Empty function
EndEvent

Event OnReset()
  ; Empty function
EndEvent

Event OnScanned()
  ; Empty function
EndEvent

Event OnSell(Actor akSeller)
  ; Empty function
EndEvent

Event OnShipBought()
  ; Empty function
EndEvent

Event OnShipDock(Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  ; Empty function
EndEvent

Event OnShipFarTravel(Location aDepartureLocation, Location aArrivalLocation, Int aState)
  ; Empty function
EndEvent

Event OnShipGravJump(Location aDestination, Int aState)
  ; Empty function
EndEvent

Event OnShipLanding(Bool abComplete)
  ; Empty function
EndEvent

Event OnShipRefueled(Int aFuelAdded)
  ; Empty function
EndEvent

Event OnShipScan(Location aPlanet, ObjectReference[] aMarkersArray)
  ; Empty function
EndEvent

Event OnShipSold()
  ; Empty function
EndEvent

Event OnShipSystemDamaged(ActorValue akSystem, Int aBlocksLost, Bool aElectromagneticDamage, Bool aFullyDamaged)
  ; Empty function
EndEvent

Event OnShipSystemPowerChange(ActorValue akSystem, Bool abAddPower, Bool abDamageRelated)
  ; Empty function
EndEvent

Event OnShipSystemRepaired(ActorValue akSystem, Int aBlocksGained, Bool aElectromagneticDamage)
  ; Empty function
EndEvent

Event OnShipTakeOff(Bool abComplete)
  ; Empty function
EndEvent

Event OnShipUndock(Bool abComplete, spaceshipreference akUndocking, spaceshipreference akParent)
  ; Empty function
EndEvent

Event OnSit(ObjectReference akFurniture)
  ; Empty function
EndEvent

Event OnSpeechChallengeAvailable(ObjectReference akSpeaker)
  ; Empty function
EndEvent

Event OnSpellCast(Form akSpell)
  ; Empty function
EndEvent

Event OnTerminalMenuItemRun(Int auiMenuItemID, terminalmenu akTerminalBase, ObjectReference akTerminalRef)
  ; Empty function
EndEvent

Event OnTranslationAlmostComplete()
  ; Empty function
EndEvent

Event OnTranslationComplete()
  ; Empty function
EndEvent

Event OnTranslationFailed()
  ; Empty function
EndEvent

Event OnTrapHitStart(ObjectReference akTarget, Float afXVel, Float afYVel, Float afZVel, Float afXPos, Float afYPos, Float afZPos, Int aeMaterial, Bool abInitialHit, Int aeMotionType)
  ; Empty function
EndEvent

Event OnTrapHitStop(ObjectReference akTarget)
  ; Empty function
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnUnequipped(Actor akActor)
  ; Empty function
EndEvent

Event OnUnload()
  ; Empty function
EndEvent

Event OnWorkshopCargoLinkChanged(ObjectReference akOldTarget, ObjectReference akNewTarget)
  ; Empty function
EndEvent

Event OnWorkshopFlyCam(Bool aStart)
  ; Empty function
EndEvent

Event OnWorkshopMode(Bool aStart)
  ; Empty function
EndEvent

Event OnWorkshopNPCTransfer(Location akNewWorkshop, Keyword akActionKW)
  ; Empty function
EndEvent

Event OnWorkshopObjectGrabbed(ObjectReference akReference)
  ; Empty function
EndEvent

Event OnWorkshopObjectMoved(ObjectReference akReference)
  ; Empty function
EndEvent

Event OnWorkshopObjectPlaced(ObjectReference akReference)
  ; Empty function
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akReference)
  ; Empty function
EndEvent

Event OnWorkshopOutputLink(ObjectReference akSource, ObjectReference akTarget)
  ; Empty function
EndEvent

Function RemoveFromRef(ObjectReference akRef) Native

Bool Function ForceRefIfEmpty(ObjectReference akNewRef)
  If Self.GetReference()
    Return False
  Else
    Self.ForceRefTo(akNewRef)
    Return True
  EndIf
EndFunction

Actor Function GetActorReference()
  Return Self.GetReference() as Actor
EndFunction

ObjectReference Function GetRef()
  Return Self.GetReference()
EndFunction

Actor Function GetActorRef()
  Return Self.GetActorReference()
EndFunction

spaceshipreference Function GetShipReference()
  Return Self.GetReference() as spaceshipreference
EndFunction

spaceshipreference Function GetShipRef()
  Return Self.GetShipReference()
EndFunction

Bool Function TryToAddToFaction(Faction FactionToAddTo)
  Bool bSuccess = False
  ObjectReference myRef = Self.GetRef()
  If myRef
    bSuccess = myRef.TryToAddToFaction(FactionToAddTo)
  EndIf
  Return bSuccess
EndFunction

Bool Function TryToRemoveFromFaction(Faction FactionToRemoveFrom)
  Bool bSuccess = False
  ObjectReference myRef = Self.GetRef()
  If myRef
    bSuccess = myRef.TryToRemoveFromFaction(FactionToRemoveFrom)
  EndIf
  Return bSuccess
EndFunction

Bool Function TryToStopCombat()
  Bool bSuccess = False
  ObjectReference myRef = Self.GetRef()
  If myRef
    bSuccess = myRef.TryToStopCombat()
  EndIf
  Return bSuccess
EndFunction

Bool Function TryToDisable()
  ObjectReference Ref = Self.GetReference()
  If Ref
    Ref.Disable(False)
    Return True
  EndIf
  Return False
EndFunction

Bool Function TryToDisableNoWait()
  ObjectReference Ref = Self.GetReference()
  If Ref
    Ref.DisableNoWait(False)
    Return True
  EndIf
  Return False
EndFunction

Bool Function TryToEnable()
  ObjectReference Ref = Self.GetReference()
  If Ref
    Ref.Enable(False)
    Return True
  EndIf
  Return False
EndFunction

Bool Function TryToEnableNoWait()
  ObjectReference Ref = Self.GetReference()
  If Ref
    Ref.EnableNoWait(False)
    Return True
  EndIf
  Return False
EndFunction

Bool Function TryToEvaluatePackage()
  Bool bSuccess = False
  ObjectReference myRef = Self.GetRef()
  If myRef
    bSuccess = myRef.TryToEvaluatePackage()
  EndIf
  Return bSuccess
EndFunction

Bool Function TryToKill(ObjectReference akKiller)
  Bool bSuccess = False
  ObjectReference myRef = Self.GetRef()
  If myRef
    bSuccess = myRef.TryToKill(akKiller)
  EndIf
  Return bSuccess
EndFunction

Bool Function TryToMoveTo(ObjectReference RefToMoveTo)
  ObjectReference Ref = Self.GetReference()
  If Ref
    Ref.MoveTo(RefToMoveTo, 0.0, 0.0, 0.0, True, False)
    Return True
  EndIf
  Return False
EndFunction

Bool Function TryToReset()
  ObjectReference Ref = Self.GetReference()
  If Ref
    Ref.Reset(None)
    Return True
  EndIf
  Return False
EndFunction

Bool Function TryToClear()
  If Self.GetReference()
    Self.Clear()
    Return True
  EndIf
  Return False
EndFunction

Bool Function TryToDelete()
  ObjectReference Ref = Self.GetReference()
  If Ref
    Ref.Delete()
    Return True
  EndIf
  Return False
EndFunction

Location Function TryToGetCurrentLocation()
  ObjectReference Ref = Self.GetReference()
  If Ref
    Return Ref.GetCurrentLocation()
  EndIf
  Return None
EndFunction

Float Function TryToGetActorValue(ActorValue ActorValueToGet)
  Self.TryToGetValue(ActorValueToGet)
EndFunction

Float Function TryToGetValue(ActorValue akAV)
  ObjectReference Ref = Self.GetReference()
  If Ref
    Return Ref.GetValue(akAV)
  EndIf
  Return 0.0
EndFunction

Bool Function TryToSetActorValue(ActorValue ValueToSet, Float afValue)
  Return Self.TryToSetValue(ValueToSet, afValue)
EndFunction

Bool Function TryToSetValue(ActorValue akAV, Float afValue)
  ObjectReference Ref = Self.GetReference()
  If Ref
    Ref.SetValue(akAV, afValue)
    Return True
  EndIf
  Return False
EndFunction

Bool Function TryIsLocked()
  ObjectReference Ref = Self.GetReference()
  If Ref
    Return Ref.IsLocked()
  EndIf
  Return False
EndFunction

Function TryToSetPlayerResistingArrest()
  Actor guardActor = Self.GetActorRef()
  If guardActor
    guardActor.SetPlayerResistingArrest()
  Else
    spaceshipreference guardShip = Self.GetShipRef()
    If guardShip
      guardShip.SetPlayerResistingArrest()
    EndIf
  EndIf
EndFunction

Function TryToSendPlayerToJail(Bool abRemoveInventory, Bool abRealJail)
  Faction crimeFaction = None
  Actor guardActor = Self.GetActorRef()
  If guardActor
    crimeFaction = guardActor.GetCrimeFaction()
  Else
    spaceshipreference guardShip = Self.GetShipRef()
    If guardShip
      crimeFaction = guardShip.GetCrimeFaction()
    EndIf
  EndIf
  If crimeFaction
    crimeFaction.SendPlayerToJail(abRemoveInventory, abRealJail)
  EndIf
EndFunction

Function TryToPlayerPayFine(Bool abRemoveStolenItems, Bool abGoToJail)
  Faction crimeFaction = Self.TryToGetCrimeFaction()
  If crimeFaction
    crimeFaction.PlayerPayCrimeGold(abRemoveStolenItems, abGoToJail)
  EndIf
EndFunction

Function TryToSendSmugglingAlarm()
  spaceshipreference guardShip = Self.GetShipRef()
  If guardShip
    guardShip.SendSmugglingAlarm(True)
  EndIf
EndFunction

Bool Function TryToInstantDock(ReferenceAlias akTarget)
  spaceshipreference selfShipRef = Self.GetShipRef()
  spaceshipreference targetShipRef = akTarget.GetShipRef()
  If selfShipRef as Bool && targetShipRef as Bool
    Return selfShipRef.InstantDock(targetShipRef as ObjectReference)
  Else
    Return False
  EndIf
EndFunction

Bool Function TryToMoveNear(ObjectReference akTarget, Int positionVal, Int distanceVal, Int facingVal)
  ObjectReference Ref = Self.GetReference()
  If Ref as Bool && akTarget as Bool
    Ref.MoveNear(akTarget, positionVal, distanceVal, facingVal)
    Return True
  Else
    Return False
  EndIf
EndFunction

Faction Function TryToGetCrimeFaction()
  Faction crimeFaction = None
  Actor actorRef = Self.GetActorRef()
  If actorRef
    crimeFaction = actorRef.GetCrimeFaction()
  Else
    spaceshipreference shipRef = Self.GetShipRef()
    If shipRef
      crimeFaction = shipRef.GetCrimeFaction()
    EndIf
  EndIf
  Return crimeFaction
EndFunction

Function ClearAndRefillAlias()
  Self.Clear()
  Self.RefillAlias()
EndFunction
