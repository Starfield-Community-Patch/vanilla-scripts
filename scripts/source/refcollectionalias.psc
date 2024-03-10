ScriptName RefCollectionAlias Extends Alias Native hidden

;-- Functions ---------------------------------------

Int Function Find(ObjectReference akFindRef) Native

Actor[] Function GetActorArray() Native

ObjectReference[] Function GetArray() Native

ObjectReference Function GetAt(Int aiIndex) Native

Int Function GetCount() Native

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnActorActivatedRef(ObjectReference akSenderRef, ObjectReference akActivatedRef)
  ; Empty function
EndEvent

Event OnAffinityEvent(ObjectReference akSenderRef, affinityevent akAffinityEvent, ActorValue akActorValue, GlobalVariable akReactionValue, ObjectReference akTarget)
  ; Empty function
EndEvent

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  ; Empty function
EndEvent

Event OnBuilderMenuSelect(ObjectReference akSenderRef, ActorValue akActorValue)
  ; Empty function
EndEvent

Event OnCellAttach(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnCellDetach(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnCellLoad(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnClose(ObjectReference akSenderRef, ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnCombatListAdded(ObjectReference akSenderRef, Actor akTarget)
  ; Empty function
EndEvent

Event OnCombatListRemoved(ObjectReference akSenderRef, Actor akTarget)
  ; Empty function
EndEvent

Event OnCombatStateChanged(ObjectReference akSenderRef, ObjectReference akTarget, Int aeCombatState)
  ; Empty function
EndEvent

Event OnCommandModeCompleteCommand(ObjectReference akSenderRef, Int aeCommand, ObjectReference akTarget)
  ; Empty function
EndEvent

Event OnCommandModeEnter(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnCommandModeExit(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnCommandModeGiveCommand(ObjectReference akSenderRef, Int aeCommand, ObjectReference akTarget)
  ; Empty function
EndEvent

Event OnCompanionDismiss(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnConsciousnessStateChanged(ObjectReference akSenderRef, Bool abUnconscious)
  ; Empty function
EndEvent

Event OnContainerChanged(ObjectReference akSenderRef, ObjectReference akNewContainer, ObjectReference akOldContainer)
  ; Empty function
EndEvent

Event OnCrewAssigned(ObjectReference akSenderRef, Actor akCrew, ObjectReference akAssignmentRef, ObjectReference akPreviousAssignmentRef)
  ; Empty function
EndEvent

Event OnCrewDismissed(ObjectReference akSenderRef, Actor akCrew, ObjectReference akPreviousAssignmentRef)
  ; Empty function
EndEvent

Event OnCripple(ObjectReference akSenderRef, ActorValue akActorValue, Bool abCrippled)
  ; Empty function
EndEvent

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
  ; Empty function
EndEvent

Event OnDeferredKill(ObjectReference akSenderRef, Actor akKiller)
  ; Empty function
EndEvent

Event OnDestroyed(ObjectReference akSenderRef, ObjectReference akDestroyer)
  ; Empty function
EndEvent

Event OnDestructionStageChanged(ObjectReference akSenderRef, Int aiOldStage, Int aiCurrentStage)
  ; Empty function
EndEvent

Event OnDifficultyChanged(ObjectReference akSenderRef, Int aOldDifficulty, Int aNewDifficulty)
  ; Empty function
EndEvent

Event OnDying(ObjectReference akSenderRef, ObjectReference akKiller)
  ; Empty function
EndEvent

Event OnEnterBleedout(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnEnterFurniture(ObjectReference akSenderRef, Actor akActionRef)
  ; Empty function
EndEvent

Event OnEnterOutpostBeaconMode()
  ; Empty function
EndEvent

Event OnEnterShipInterior(ObjectReference akSenderRef, ObjectReference akShip)
  ; Empty function
EndEvent

Event OnEnterSneaking(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnEquipped(ObjectReference akSenderRef, Actor akActor)
  ; Empty function
EndEvent

Event OnEscortWaitStart(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnEscortWaitStop(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnExitFurniture(ObjectReference akSenderRef, ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnExitShipInterior(ObjectReference akSenderRef, ObjectReference akShip)
  ; Empty function
EndEvent

Event OnGetUp(ObjectReference akSenderRef, ObjectReference akFurniture)
  ; Empty function
EndEvent

Event OnGrab(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnHomeShipSet(ObjectReference akSenderRef, spaceshipreference akShip, spaceshipreference akPrevious)
  ; Empty function
EndEvent

Event OnItemAdded(ObjectReference akSenderRef, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  ; Empty function
EndEvent

Event OnItemEquipped(ObjectReference akSenderRef, Form akBaseObject, ObjectReference akReference)
  ; Empty function
EndEvent

Event OnItemRemoved(ObjectReference akSenderRef, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  ; Empty function
EndEvent

Event OnItemUnequipped(ObjectReference akSenderRef, Form akBaseObject, ObjectReference akReference)
  ; Empty function
EndEvent

Event OnKill(ObjectReference akSenderRef, ObjectReference akVictim)
  ; Empty function
EndEvent

Event OnLoad(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnLocationChange(ObjectReference akSenderRef, Location akOldLoc, Location akNewLoc)
  ; Empty function
EndEvent

Event OnLockStateChanged(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnMapMarkerDiscovered(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnObjectDestroyed(ObjectReference akSenderRef, ObjectReference akReference)
  ; Empty function
EndEvent

Event OnObjectRepaired(ObjectReference akSenderRef, ObjectReference akReference)
  ; Empty function
EndEvent

Event OnOpen(ObjectReference akSenderRef, ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnOutpostItemPowerOff(ObjectReference akSenderRef, ObjectReference akPoweredItem)
  ; Empty function
EndEvent

Event OnOutpostItemPowerOn(ObjectReference akSenderRef, ObjectReference akPoweredItem, ObjectReference akPowerGenerator)
  ; Empty function
EndEvent

Event OnPackageChange(ObjectReference akSenderRef, Package akOldPackage)
  ; Empty function
EndEvent

Event OnPackageEnd(ObjectReference akSenderRef, Package akOldPackage)
  ; Empty function
EndEvent

Event OnPackageStart(ObjectReference akSenderRef, Package akNewPackage)
  ; Empty function
EndEvent

Event OnPartialCripple(ObjectReference akSenderRef, ActorValue akActorValue, Bool abCrippled)
  ; Empty function
EndEvent

Event OnPickLock(ObjectReference akSenderRef, ObjectReference akLockedRef, Bool abCrime, Bool abSucceeded, terminalmenu akLockedTerminalMenu, Int aiTerminalMenuItem)
  ; Empty function
EndEvent

Event OnPickpocketFailed(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnPipboyRadioDetection(ObjectReference akSenderRef, Bool abDetected)
  ; Empty function
EndEvent

Event OnPlayerArrested(ObjectReference akSenderRef, ObjectReference akGuard, Location akLocation, Int aeCrimeType)
  ; Empty function
EndEvent

Event OnPlayerAssaultActor(ObjectReference akSenderRef, ObjectReference akVictim, Location akLocation, Bool aeCrime)
  ; Empty function
EndEvent

Event OnPlayerBuyShip(ObjectReference akSenderRef, spaceshipreference akShip)
  ; Empty function
EndEvent

Event OnPlayerCompleteResearch(ObjectReference akSenderRef, ObjectReference akBench, Location akLocation, researchproject akProject)
  ; Empty function
EndEvent

Event OnPlayerCraftItem(ObjectReference akSenderRef, ObjectReference akBench, Location akLocation, Form akCreatedItem)
  ; Empty function
EndEvent

Event OnPlayerCreateRobot(ObjectReference akSenderRef, Actor akNewRobot)
  ; Empty function
EndEvent

Event OnPlayerCrimeGold(ObjectReference akSenderRef, ObjectReference akVictim, Form akFaction, Int aeCrimeGold, Int aeCrimeType)
  ; Empty function
EndEvent

Event OnPlayerDialogueTarget(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnPlayerEnterVertibird(ObjectReference akSenderRef, ObjectReference akVertibird)
  ; Empty function
EndEvent

Event OnPlayerFailedPlotRoute(ObjectReference akSenderRef, Int aeFailedPlotReason)
  ; Empty function
EndEvent

Event OnPlayerFallLongDistance(ObjectReference akSenderRef, Float afDamage)
  ; Empty function
EndEvent

Event OnPlayerFireWeapon(ObjectReference akSenderRef, Form akBaseObject)
  ; Empty function
EndEvent

Event OnPlayerFollowerWarp(ObjectReference akSenderRef, ObjectReference akFollower)
  ; Empty function
EndEvent

Event OnPlayerHealTeammate(ObjectReference akSenderRef, Actor akTeammate)
  ; Empty function
EndEvent

Event OnPlayerItemAdded(ObjectReference akSenderRef, Form akBaseObject, ObjectReference akOwner, ObjectReference akSourceContainer, Int aeAcquireType)
  ; Empty function
EndEvent

Event OnPlayerJail(ObjectReference akSenderRef, ObjectReference akGuard, Form akFaction, Location akLocation, Int aeCrimeGold)
  ; Empty function
EndEvent

Event OnPlayerLoadGame(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnPlayerLoiteringBegin(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnPlayerLoiteringEnd(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnPlayerModArmorWeapon(ObjectReference akSenderRef, Form akBaseObject, objectmod akModBaseObject)
  ; Empty function
EndEvent

Event OnPlayerModRobot(ObjectReference akSenderRef, Actor akRobot, objectmod akModBaseObject)
  ; Empty function
EndEvent

Event OnPlayerModifiedShip(ObjectReference akSenderRef, spaceshipreference akShip)
  ; Empty function
EndEvent

Event OnPlayerMurderActor(ObjectReference akSenderRef, ObjectReference akVictim, Location akLocation, Bool aeCrime)
  ; Empty function
EndEvent

Event OnPlayerPayFine(ObjectReference akSenderRef, ObjectReference akGuard, Form akFaction, Int aeCrimeGold)
  ; Empty function
EndEvent

Event OnPlayerPlanetSurveyComplete(ObjectReference akSenderRef, planet akPlanet)
  ; Empty function
EndEvent

Event OnPlayerScannedObject(ObjectReference akSenderRef, ObjectReference akScannedRef)
  ; Empty function
EndEvent

Event OnPlayerSellShip(ObjectReference akSenderRef, spaceshipreference akShip)
  ; Empty function
EndEvent

Event OnPlayerSwimming(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnPlayerTrespass(ObjectReference akSenderRef, ObjectReference akVictim, Location akLocation, Bool aeCrime)
  ; Empty function
EndEvent

Event OnPlayerUseWorkBench(ObjectReference akSenderRef, ObjectReference akWorkBench)
  ; Empty function
EndEvent

Event OnPowerOff(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnPowerOn(ObjectReference akSenderRef, ObjectReference akPowerGenerator)
  ; Empty function
EndEvent

Event OnQuickContainerOpened(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnRaceSwitchComplete(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnRead(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnRecoverFromBleedout(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnRelease(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnReset(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnScanned(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnSell(ObjectReference akSenderRef, Actor akSeller)
  ; Empty function
EndEvent

Event OnShipBought(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnShipDock(ObjectReference akSenderRef, Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  ; Empty function
EndEvent

Event OnShipFarTravel(ObjectReference akSenderRef, Location aDepartureLocation, Location aArrivalLocation, Int aState)
  ; Empty function
EndEvent

Event OnShipGravJump(ObjectReference akSenderRef, Location aDestination, Int aState)
  ; Empty function
EndEvent

Event OnShipLanding(ObjectReference akSenderRef, Bool abComplete)
  ; Empty function
EndEvent

Event OnShipRefueled(ObjectReference akSenderRef, Int aFuelAdded)
  ; Empty function
EndEvent

Event OnShipSold(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnShipSystemDamaged(ObjectReference akSenderRef, ActorValue akSystem, Int aBlocksLost, Bool aElectromagneticDamage, Bool aFullyDamaged)
  ; Empty function
EndEvent

Event OnShipSystemPowerChange(ObjectReference akSenderRef, ActorValue akSystem, Bool abAddPower, Bool abDamageRelated)
  ; Empty function
EndEvent

Event OnShipSystemRepaired(ObjectReference akSenderRef, ActorValue akSystem, Int aBlocksGained, Bool aElectromagneticDamage)
  ; Empty function
EndEvent

Event OnShipTakeOff(ObjectReference akSenderRef, Bool abComplete)
  ; Empty function
EndEvent

Event OnShipUndock(ObjectReference akSenderRef, Bool abComplete, spaceshipreference akUndocking, spaceshipreference akParent)
  ; Empty function
EndEvent

Event OnSit(ObjectReference akSenderRef, ObjectReference akFurniture)
  ; Empty function
EndEvent

Event OnSpeechChallengeAvailable(ObjectReference akSenderRef, ObjectReference akSpeaker)
  ; Empty function
EndEvent

Event OnSpellCast(ObjectReference akSenderRef, Form akSpell)
  ; Empty function
EndEvent

Event OnTerminalMenuItemRun(ObjectReference akSenderRef, Int auiMenuItemID, terminalmenu akTerminalBase, ObjectReference akTerminalRef)
  ; Empty function
EndEvent

Event OnTranslationAlmostComplete(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnTranslationComplete(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnTranslationFailed(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnTrapHitStart(ObjectReference akSenderRef, ObjectReference akTarget, Float afXVel, Float afYVel, Float afZVel, Float afXPos, Float afYPos, Float afZPos, Int aeMaterial, Bool abInitialHit, Int aeMotionType)
  ; Empty function
EndEvent

Event OnTrapHitStop(ObjectReference akSenderRef, ObjectReference akTarget)
  ; Empty function
EndEvent

Event OnTriggerEnter(ObjectReference akSenderRef, ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnTriggerLeave(ObjectReference akSenderRef, ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnUnequipped(ObjectReference akSenderRef, Actor akActor)
  ; Empty function
EndEvent

Event OnUnload(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnWorkshopCargoLinkChanged(ObjectReference akSenderRef, ObjectReference akOldTarget, ObjectReference akNewTarget)
  ; Empty function
EndEvent

Event OnWorkshopFlyCam(ObjectReference akSenderRef, Bool aStart)
  ; Empty function
EndEvent

Event OnWorkshopMode(ObjectReference akSenderRef, Bool aStart)
  ; Empty function
EndEvent

Event OnWorkshopNPCTransfer(ObjectReference akSenderRef, Location akNewWorkshop, Keyword akActionKW)
  ; Empty function
EndEvent

Event OnWorkshopObjectGrabbed(ObjectReference akSenderRef, ObjectReference akReference)
  ; Empty function
EndEvent

Event OnWorkshopObjectMoved(ObjectReference akSenderRef, ObjectReference akReference)
  ; Empty function
EndEvent

Event OnWorkshopObjectPlaced(ObjectReference akSenderRef, ObjectReference akReference)
  ; Empty function
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akSenderRef, ObjectReference akReference)
  ; Empty function
EndEvent

Event OnWorkshopOutputLink(ObjectReference akSenderRef, ObjectReference akSource, ObjectReference akTarget)
  ; Empty function
EndEvent

Function RemoveAll() Native

Function RemoveRef(ObjectReference akRemoveRef) Native

Function addRef(ObjectReference akNewRef) Native

Function AddToFaction(Faction akFaction)
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    Self.GetAt(I).TryToAddToFaction(akFaction)
    I += 1
  EndWhile
EndFunction

Function BlockActivation(Bool abBlocked, Bool abHideActivateText)
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    ObjectReference theRef = Self.GetAt(I)
    If theRef
      theRef.BlockActivation(abBlocked, abHideActivateText)
    EndIf
    I += 1
  EndWhile
EndFunction

Actor Function GetActorAt(Int aiIndex)
  Return Self.GetAt(aiIndex) as Actor
EndFunction

spaceshipreference Function GetShipAt(Int aiIndex)
  Return Self.GetAt(aiIndex) as spaceshipreference
EndFunction

ObjectReference Function GetRandom()
  Return Self.GetAt(Utility.RandomInt(0, Self.GetCount() - 1))
EndFunction

ObjectReference[] Function GetRandomObjects(Int aiNumberToGet)
  ObjectReference[] randomArray = new ObjectReference[aiNumberToGet]
  ObjectReference[] objectArray = Self.GetArray()
  Int index = 0
  While index < aiNumberToGet && objectArray.Length > 0
    Int randIndex = Utility.RandomInt(0, objectArray.Length - 1)
    randomArray[index] = objectArray[randIndex]
    objectArray.remove(randIndex, 1)
    index += 1
  EndWhile
  Return randomArray
EndFunction

ObjectReference Function GetFirstOwnedObject(Actor actorOwner)
  Int I = 0
  Int ownerIndex = -1
  Int count = Self.GetCount()
  While I < count && ownerIndex == -1
    If actorOwner.IsOwner(Self.GetAt(I))
      ownerIndex = I
    EndIf
    I += 1
  EndWhile
  If ownerIndex > -1
    Return Self.GetAt(ownerIndex)
  Else
    Return None
  EndIf
EndFunction

Function EnableAll(Bool bFadeIn)
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    ObjectReference theRef = Self.GetAt(I)
    If theRef
      theRef.EnableNoWait(bFadeIn)
    EndIf
    I += 1
  EndWhile
EndFunction

Function DisableAll(Bool bFadeOut)
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    ObjectReference theRef = Self.GetAt(I)
    If theRef
      theRef.DisableNoWait(bFadeOut)
    EndIf
    I += 1
  EndWhile
EndFunction

Function EvaluateAll()
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    Self.GetAt(I).TryToEvaluatePackage()
    I += 1
  EndWhile
EndFunction

Function MoveAllTo(ObjectReference akTarget)
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    ObjectReference theRef = Self.GetAt(I)
    If theRef
      theRef.MoveTo(akTarget, 0.0, 0.0, 0.0, True, False)
    EndIf
    I += 1
  EndWhile
EndFunction

Function MoveAllToPackageLocation()
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    ObjectReference current = Self.GetAt(I)
    Actor theActor = current as Actor
    If theActor
      theActor.MoveToPackageLocation()
    Else
      spaceshipreference theShip = current as spaceshipreference
      If theShip
        theShip.MoveToPackageLocation()
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

Bool Function IsOwnedObjectInList(Actor actorOwner)
  Int I = 0
  Bool foundOwner = False
  Int count = Self.GetCount()
  While I < count && !foundOwner
    If actorOwner.IsOwner(Self.GetAt(I))
      foundOwner = True
    EndIf
    I += 1
  EndWhile
  Return foundOwner
EndFunction

Bool Function IsDetectedBy(Actor detectionTarget)
  Int I = 0
  Bool isdetected = False
  Int count = Self.GetCount()
  While I < count && !isdetected
    Actor theActor = Self.GetAt(I) as Actor
    If theActor as Bool && detectionTarget.IsDetectedBy(theActor)
      isdetected = True
    EndIf
    I += 1
  EndWhile
  Return isdetected
EndFunction

Bool Function HasDetectionLOS(Actor actorTarget)
  Int I = 0
  Bool hasLOS = False
  Int count = Self.GetCount()
  While I < count && !hasLOS
    Actor theActor = Self.GetAt(I) as Actor
    If theActor as Bool && theActor.HasDetectionLOS(actorTarget as ObjectReference)
      hasLOS = True
    EndIf
    I += 1
  EndWhile
  Return hasLOS
EndFunction

Function SetOpen(Bool abOpen)
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    Self.GetAt(I).SetOpen(abOpen)
    I += 1
  EndWhile
EndFunction

Function Lock(Bool abLock, Bool abAsOwner, Bool abTraverseLinkedLockables)
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    Self.GetAt(I).Lock(abLock, abAsOwner, abTraverseLinkedLockables)
    I += 1
  EndWhile
EndFunction

Function KillAll(ObjectReference akKiller)
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    Self.GetAt(I).TryToKill(akKiller)
    I += 1
  EndWhile
EndFunction

Function StartCombatAll(ObjectReference akCombatTarget)
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    Self.GetAt(I).TryToStartCombat(akCombatTarget, False)
    I += 1
  EndWhile
EndFunction

Function RemoveFromFaction(Faction akFaction)
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    Self.GetAt(I).TryToRemoveFromFaction(akFaction)
    I += 1
  EndWhile
EndFunction

Function RemoveFromAllFactions()
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    Self.GetAt(I).TryToRemoveFromAllFactions()
    I += 1
  EndWhile
EndFunction

Function ResetAll()
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    ObjectReference theRef = Self.GetAt(I)
    If theRef
      theRef.Reset(None)
    EndIf
    I += 1
  EndWhile
EndFunction

Function SetGhost(Bool bSetGhost)
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    Self.GetAt(I).TryToSetGhost(bSetGhost)
    I += 1
  EndWhile
EndFunction

Function SetProtected(Bool bSetProtected)
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    Self.GetAt(I).TryToSetProtected(bSetProtected)
    I += 1
  EndWhile
EndFunction

Function SetEssential(Bool bSetEssential)
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    Self.GetAt(I).TryToSetEssential(bSetEssential)
    I += 1
  EndWhile
EndFunction

Function StopCombat()
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    Self.GetAt(I).TryToStopCombat()
    I += 1
  EndWhile
EndFunction

Function StopCombatAlarm()
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    Self.GetAt(I).TryToStopCombatAlarm()
    I += 1
  EndWhile
EndFunction

Function AddRefCollection(RefCollectionAlias refCollectionAliasToAdd)
  Int CollectionCount = refCollectionAliasToAdd.GetCount()
  Int index = 0
  While index < CollectionCount
    Self.addRef(refCollectionAliasToAdd.GetAt(index))
    index += 1
  EndWhile
EndFunction

Function RemoveRefCollection(RefCollectionAlias refCollectionAliasToRemove)
  Int CollectionCount = refCollectionAliasToRemove.GetCount()
  Int index = 0
  While index < CollectionCount
    Self.RemoveRef(refCollectionAliasToRemove.GetAt(index))
    index += 1
  EndWhile
EndFunction

Function AddArray(ObjectReference[] refArrayToAdd)
  Int index = 0
  While index < refArrayToAdd.Length
    Self.addRef(refArrayToAdd[index])
    index += 1
  EndWhile
EndFunction

Int Function GetCountDead()
  Int iReturnCount = 0
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    Actor actorRef = Self.GetActorAt(I)
    If actorRef as Bool && actorRef.IsDead()
      iReturnCount += 1
    Else
      spaceshipreference theShipRef = Self.GetShipAt(I)
      If theShipRef as Bool && theShipRef.IsDead()
        iReturnCount += 1
      EndIf
    EndIf
    I += 1
  EndWhile
  Return iReturnCount
EndFunction

Int Function GetCountDeadOr3DUnloaded()
  Int iReturnCount = 0
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    Actor actorRef = Self.GetAt(I) as Actor
    If Self.GetAt(I).Is3DLoaded() == False || (actorRef as Bool && actorRef.IsDead())
      iReturnCount += 1
    Else
      spaceshipreference theShipRef = Self.GetShipAt(I)
      If theShipRef as Bool && theShipRef.IsDead()
        iReturnCount += 1
      EndIf
    EndIf
    I += 1
  EndWhile
  Return iReturnCount
EndFunction

Int Function GetCountAliveAnd3DLoaded()
  Int iReturnCount = 0
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    Actor actorRef = Self.GetAt(I) as Actor
    spaceshipreference theShipRef = Self.GetShipAt(I)
    If Self.GetAt(I).Is3DLoaded()
      If actorRef == None && theShipRef == None || (actorRef as Bool && actorRef.IsDead() == False) || (theShipRef as Bool && theShipRef.IsDead() == False)
        iReturnCount += 1
      EndIf
    EndIf
    I += 1
  EndWhile
  Return iReturnCount
EndFunction

Int Function GetCountDisabled()
  Int iReturnCount = 0
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    If Self.GetAt(I).IsDisabled()
      iReturnCount += 1
    EndIf
    I += 1
  EndWhile
  Return iReturnCount
EndFunction

Int Function RemoveDisabled()
  Int iReturnCount = 0
  Int I = Self.GetCount() - 1
  While I > -1
    ObjectReference myRef = Self.GetAt(I)
    If myRef.IsDisabled()
      iReturnCount += 1
      Self.RemoveRef(myRef)
    EndIf
    I -= 1
  EndWhile
  Return iReturnCount
EndFunction

Function SetValue(ActorValue akActorValue, Float fValue)
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    Actor theActor = Self.GetActorAt(I)
    If theActor
      theActor.SetValue(akActorValue, fValue)
    Else
      spaceshipreference theShipRef = Self.GetShipAt(I)
      If theShipRef
        theShipRef.SetValue(akActorValue, fValue)
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

Bool Function LinkCollectionTo(RefCollectionAlias LinkedRefCollectionAlias, Keyword LinkKeyword, Bool WrapLinks)
  Int index = 0
  Int LinkTargetCount = LinkedRefCollectionAlias.GetCount()
  Int CollectionCount = Self.GetCount()
  While index < CollectionCount
    ObjectReference currentRef = Self.GetAt(index)
    If currentRef
      currentRef.SetLinkedRef(LinkedRefCollectionAlias.GetAt(index % LinkTargetCount), LinkKeyword, True)
    EndIf
    index += 1
    If !WrapLinks && index >= LinkTargetCount
      Return False
    EndIf
  EndWhile
  Return True
EndFunction

Function SetUnconscious(Bool abUnconscious)
  Int I = 0
  Int iReturnCount = Self.GetCount()
  While I < iReturnCount
    Actor theActor = Self.GetActorAt(I)
    If theActor
      theActor.SetUnconscious(abUnconscious)
    Else
      spaceshipreference theShipRef = Self.GetShipAt(I)
      If theShipRef
        theShipRef.SetUnconscious(abUnconscious)
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction
