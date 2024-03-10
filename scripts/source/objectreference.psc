ScriptName ObjectReference Extends Form Native hidden

;-- Properties --------------------------------------
Float Property X
  Float Function Get()
    Return Self.GetPositionX()
  EndFunction
EndProperty
Float Property Y
  Float Function Get()
    Return Self.GetPositionY()
  EndFunction
EndProperty
Float Property Z
  Float Function Get()
    Return Self.GetPositionZ()
  EndFunction
EndProperty
Int Property CONST_NearPosition_Min = 0 AutoReadOnly
Int Property CONST_NearPosition_Max = 6 AutoReadOnly
Int Property CONST_NearPosition_Random = -2 AutoReadOnly
Int Property CONST_NearPosition_DeadAhead = -1 AutoReadOnly
Int Property CONST_NearPosition_ForwardTight = 0 AutoReadOnly
Int Property CONST_NearPosition_ForwardWide = 1 AutoReadOnly
Int Property CONST_NearPosition_Behind = 2 AutoReadOnly
Int Property CONST_NearPosition_Above = 3 AutoReadOnly
Int Property CONST_NearPosition_Below = 4 AutoReadOnly
Int Property CONST_NearPosition_Left = 5 AutoReadOnly
Int Property CONST_NearPosition_Right = 6 AutoReadOnly
Float Property CONST_NearPosition_TightArc = 0.100000001 AutoReadOnly
Float Property CONST_NearPosition_WideArc = 0.200000003 AutoReadOnly
Int Property CONST_NearDistance_Min = 0 AutoReadOnly
Int Property CONST_NearDistance_Max = 4 AutoReadOnly
Int Property CONST_NearDistance_RandomFar = -3 AutoReadOnly
Int Property CONST_NearDistance_Random = -2 AutoReadOnly
Int Property CONST_NearDistance_VeryClose = -1 AutoReadOnly
Int Property CONST_NearDistance_Close = 0 AutoReadOnly
Int Property CONST_NearDistance_Short = 1 AutoReadOnly
Int Property CONST_NearDistance_Moderate = 2 AutoReadOnly
Int Property CONST_NearDistance_Long = 3 AutoReadOnly
Int Property CONST_NearDistance_VeryLong = 4 AutoReadOnly
Int Property CONST_NearDistance_Close_Min = 200 AutoReadOnly
Int Property CONST_NearDistance_Close_Max = 400 AutoReadOnly
Int Property CONST_NearDistance_Short_Min = 600 AutoReadOnly
Int Property CONST_NearDistance_Short_Max = 1000 AutoReadOnly
Int Property CONST_NearDistance_Moderate_Min = 1200 AutoReadOnly
Int Property CONST_NearDistance_Moderate_Max = 2000 AutoReadOnly
Int Property CONST_NearDistance_Long_Min = 2500 AutoReadOnly
Int Property CONST_NearDistance_Long_Max = 5000 AutoReadOnly
Int Property CONST_NearDistance_VeryLong_Min = 6000 AutoReadOnly
Int Property CONST_NearDistance_VeryLong_Max = 10000 AutoReadOnly
Int Property CONST_NearFacing_Min = 0 AutoReadOnly
Int Property CONST_NearFacing_Max = 7 AutoReadOnly
Int Property CONST_NearFacing_TotallyRandom = -3 AutoReadOnly
Int Property CONST_NearFacing_Random = -2 AutoReadOnly
Int Property CONST_NearFacing_Direct = -1 AutoReadOnly
Int Property CONST_NearFacing_TowardSmall = 0 AutoReadOnly
Int Property CONST_NearFacing_TowardLarge = 1 AutoReadOnly
Int Property CONST_NearFacing_AwaySmall = 2 AutoReadOnly
Int Property CONST_NearFacing_AwayLarge = 3 AutoReadOnly
Int Property CONST_NearFacing_LeftSideOn = 4 AutoReadOnly
Int Property CONST_NearFacing_RightSideOn = 5 AutoReadOnly
Int Property CONST_NearFacing_BottomSideOn = 6 AutoReadOnly
Int Property CONST_NearFacing_TopSideOn = 7 AutoReadOnly
Float Property CONST_NearFacing_HeadingCorrectionToDirectFacing = 90.0 AutoReadOnly
Float Property CONST_NearFacing_TightAngle = 15.0 AutoReadOnly
Float Property CONST_NearFacing_WideAngle = 30.0 AutoReadOnly
Int Property Motion_Fixed = 0 AutoReadOnly
Int Property Motion_Dynamic = 1 AutoReadOnly
Int Property Motion_Keyframed = 2 AutoReadOnly

;-- Functions ---------------------------------------

Bool Function Activate(ObjectReference akActivator, Bool abDefaultProcessingOnly) Native

Bool Function AddDependentAnimatedObjectReference(ObjectReference akDependent) Native

Function AddDynamicTerminalMenuItem(terminalmenu akTemplateSource, Int aiTemplateIndex, Int aiItemID, Form[] akTagReplacementForms) Native

Function AddItem(Form akItemToAdd, Int aiCount, Bool abSilent) Native

Function AddKeyIfNeeded(ObjectReference aLockedRef) Native

Function AddKeyword(Keyword apKeyword) Native

Bool Function AddSpell(Spell akSpell, Bool abVerbose) Native

Function AddTextReplacementData(String asTokenLabel, Form akForm) Native

Function AddTextReplacementValue(String asTokenLabel, Float aValue) Native

Function AddToMap(Bool abAllowFastTravel) Native

Bool Function AddTransferLink(ObjectReference akTarget) Native

Function ApplyConveyorBelt(String aTarget, Float aLinVelX, Float aLinVelY, Float aLinVelZ, Bool abOn, Bool abReverse) Native

Function ApplyFanMotor(String aTarget, Float aAxisX, Float aAxisY, Float aAxisZ, Float aForce, Bool abOn) Native

Function ApplyHavokImpulse(Float afX, Float afY, Float afZ, Float afMagnitude) Native

Bool Function AreAllInTrigger(ObjectReference[] refsToCheck) Native

Bool Function AreAnyInTrigger(ObjectReference[] refsToCheck) Native

Function AssignCrew(Actor aCrewMember) Native

Bool Function AttachMod(objectmod akMod, Int aiAttachIndex) Native

Bool Function AttachModToInventoryItem(Form akItem, objectmod akMod) Native

Function AttachTo(ObjectReference akParent) Native

Function BlockActivation(Bool abBlocked, Bool abHideActivateText) Native

Int Function CalculateEncounterLevel(Int aiDifficulty) Native

Bool Function CanFastTravelToMarker() Native

Bool Function CanProduceForWorkshop() Native

Function ClearDestruction() Native

Function ClearDynamicTerminalMenuItems() Native

Function ClearFromOldLocations() Native

Function ConveyorBeltOn(Bool abOn) Native

Int Function CountActorsLinkedToMe(Keyword apLinkKeyword, Keyword apExcludeKeyword) Native

Int Function CountLinkedRefChain(Keyword apKeyword, Int maxExpectedLinkedRefs) Native

Int Function CountRefsLinkedToMe(Keyword apLinkKeyword, Keyword apExcludeKeyword) Native

Function CreateDetectionEvent(Actor akOwner, Int aiSoundLevel) Native

Function DamageObject(Float afDamage) Native

Function DamageValue(ActorValue akAV, Float afDamage) Native

Function Delete() Native

Function Disable(Bool abFadeOut) Native

Function DisableLinkChain(Keyword apKeyword, Bool abFadeOut) Native

Function DisableNoWait(Bool abFadeOut) Native

Bool Function DispelSpell(Spell akSpell) Native

Function Drop(Bool abSilent) Native

ObjectReference Function DropFirstObject(Bool abInitiallyDisabled) Native

ObjectReference Function DropObject(Form akObject, Int aiCount) Native

Bool Function Enable(Bool abFadeIn) Native

Function EnableFastTravel(Bool abEnable) Native

Function EnableLinkChain(Keyword apKeyword, Bool abFadeIn) Native

Bool Function EnableNoWait(Bool abFadeIn) Native

Function FanMotorOn(Bool abOn) Native

ObjectReference[] Function FindAllReferencesOfType(Form akObjectOrList, Float afRadius) Native

ObjectReference[] Function FindAllReferencesWithKeyword(Form akKeywordOrList, Float afRadius) Native

Function ForceAddRagdollToWorld() Native

Function ForceRemoveRagdollFromWorld() Native

ActorBase Function GetActorBaseForResource(ActorValue akAV) Native

ActorBase Function GetActorOwner() Native

Actor Function GetActorRefOwner() Native

Actor[] Function GetActorsLinkedToMe(Keyword apLinkKeyword, Keyword apExcludeKeyword) Native

Actor[] Function GetAllCrewMembers() Native

ObjectReference[] Function GetAllRefsInTrigger() Native

Float Function GetAngleX() Native

Float Function GetAngleY() Native

Float Function GetAngleZ() Native

Bool Function GetAnimationVariableBool(String arVariableName) Native

Float Function GetAnimationVariableFloat(String arVariableName) Native

Int Function GetAnimationVariableInt(String arVariableName) Native

Form Function GetBaseObject() Native

Float Function GetBaseValue(ActorValue akAV) Native

ActorBase[] Function GetBiomeActors(Float afMaxPercentageKnown) Native

Flora[] Function GetBiomeFlora(Float afMaxPercentageKnown) Native

Int Function GetComponentCount(Form akItem) Native

ObjectReference Function GetContainer() Native

Int Function GetCurrentDestructionStage() Native

Location Function GetCurrentLocation() Native

planet Function GetCurrentPlanet() Native

Scene Function GetCurrentScene() Native

Int[] Function GetDebugTextColor() Native

Int Function GetDebugTextSize() Native

String Function GetDebugTextString() Native

ObjectReference[] Function GetDestructibleOutpostObjects() Native

Location Function GetEditorLocation() Native

Faction Function GetFactionOwner() Native

Flora Function GetFloraForResource(ActorValue akAV) Native

Float Function GetGravityScale() Native

Float Function GetHeadingAngle(ObjectReference akOther) Native

Float Function GetHeight() Native

Int Function GetHighestItemCountKeywords(FormList akKeywords, Bool abMustMatchAll) Native

Int Function GetInventoryValue() Native

Int Function GetItemCount(Form akItem) Native

Int Function GetItemCountKeywords(FormList akKeywords, Bool abMustMatchAll) Native

Float Function GetItemHealthPercent() Native

Key Function GetKey() Native

Float Function GetLength() Native

Cell Function GetLinkedCell(Keyword akKeyword) Native

ObjectReference Function GetLinkedRef(Keyword apKeyword) Native

ObjectReference[] Function GetLinkedRefChain(Keyword apKeyword, Int iMaxExpectedLinkedRefs) Native

LocationRefType[] Function GetLocRefTypes() Native

Int Function GetLockLevel() Native

Float Function GetMass() Native

ObjectReference Function GetNthLinkedRef(Int aiLinkedRef, Keyword apKeyword) Native

Int Function GetOpenState() Native

Cell Function GetParentCell() Native

Float Function GetPercentageKnown() Native

Float Function GetPositionX() Native

Float Function GetPositionY() Native

Float Function GetPositionZ() Native

Float Function GetRadioFrequency() Native

Float Function GetRadioVolume() Native

ObjectReference[] Function GetRefsLinkedToMe(Keyword apLinkKeyword, Keyword apExcludeKeyword) Native

Float Function GetResourceDamage(ActorValue akValue) Native

Float[] Function GetSafePosition(Float aSearchRadius, Float aSafeRadius) Native

Float Function GetScale() Native

Float[] Function GetSpacePosition() Native

Float[] Function GetSpaceTransform() Native

Actor Function GetSpaceshipAutopilotAI() Native

Cell Function GetTeleportCell() Native

Cell Function GetTransitionCell() Native

Float Function GetTransmitterDistance() Native

Int Function GetTriggerObjectCount() Native

Float Function GetValue(ActorValue akAV) Native

Float Function GetValuePercentage(ActorValue akAV) Native

resource[] Function GetValueResources() Native

VoiceType Function GetVoiceType() Native

Float Function GetWeight() Native

Float Function GetWeightInContainer() Native

Float Function GetWidth() Native

ObjectReference Function GetWorkshop() Native

ObjectReference[] Function GetWorkshopOwnedObjects(Actor akActor) Native

Float Function GetWorkshopResourceDamage(ActorValue akValue) Native

ObjectReference[] Function GetWorkshopResourceObjects(ActorValue akAV, Int aiOption) Native

WorldSpace Function GetWorldSpace() Native

Bool Function HasActorRefOwner() Native

Bool Function HasCrew() Native

Bool Function HasDirectLOS(ObjectReference akTarget, String asSourceNode, String asTargetNode) Native

Bool Function HasEffectKeyword(Keyword akKeyword) Native

Bool Function HasKeyword(Keyword apKeyword) Native

Bool Function HasKeywordInFormList(FormList akKeywordList) Native

Bool Function HasLocRefType(LocationRefType akRefType) Native

Bool Function HasMagicEffect(MagicEffect akMagicEffect) Native

Bool Function HasNode(String asNodeName) Native

Bool Function HasSharedPowerGrid(ObjectReference akCompare) Native

Function IgnoreFriendlyHits(Bool abIgnore) Native

Function InterruptCast() Native

Bool Function Is3DLoaded() Native

Bool Function IsActivateChild(ObjectReference akChild) Native

Bool Function IsActivationBlocked() Native

Bool Function IsConveyorBeltOn() Native

Bool Function IsCreated() Native

Bool Function IsDebugTextBillboard() Native

Bool Function IsDeleted() Native

Bool Function IsDestroyed() Native

Bool Function IsDisabled() Native

Bool Function IsDoorInaccessible() Native

Bool Function IsFanMotorOn() Native

Bool Function IsFurnitureInUse(Bool abIgnoreReserved) Native

Bool Function IsFurnitureMarkerInUse(Int aiMarker, Bool abIgnoreReserved) Native

Bool Function IsIgnoringFriendlyHits() Native

Bool Function IsInDialogueWithPlayer() Native

Bool Function IsInSpace() Native

Bool Function IsInTrigger(ObjectReference refToCheck) Native

Bool Function IsLockBroken() Native

Bool Function IsLocked() Native

Bool Function IsMapMarkerVisible() Native

Bool Function IsOwnedBy(Actor akOwner) Native

Bool Function IsPowered() Native

Bool Function IsQuestItem() Native

Bool Function IsRadioOn() Native

Bool Function IsRefInTransitionCell(ObjectReference akRef) Native

Bool Function IsScanned() Native

Bool Function IsSpellTarget(Form akMagicItemForm) Native

Bool Function IsTeleportAreaLoaded() Native

Bool Function IsWithinBuildableArea(ObjectReference akRef) Native

Function KnockAreaEffect(Float afMagnitude, Float afRadius) Native

Function Lock(Bool abLock, Bool abAsOwner, Bool abTraverseLinkedLockables) Native

ObjectReference Function MakeAliasedRefFromInventory(Form akObject, Alias akAlias) Native

Function MakeTransmitterRepeater(ObjectReference akTransmitterToRepeat, Float afInnerRadius, Float afOuterRadius, Bool abUnlimitedRange) Native

Function ModValue(ActorValue akAV, Float afAmount) Native

Function MoveContainerContentToUnfilledContainers() Native

Function MoveTo(ObjectReference akTarget, Float afXOffset, Float afYOffset, Float afZOffset, Bool abMatchRotation, Bool abRotateOffset) Native

Function MoveToMyEditorLocation() Native

Function MoveToNearestNavmeshLocation() Native

Function MoveToNode(ObjectReference akTarget, String asNodeName, String asMatchNodeName) Native

Event OnActivate(ObjectReference akActionRef)
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

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  ; Empty function
EndEvent

Event OnCrewAssigned(Actor akCrew, ObjectReference akAssignmentRef, ObjectReference akPreviousAssignmentRef)
  ; Empty function
EndEvent

Event OnCrewDismissed(Actor akCrew, ObjectReference akPreviousAssignmentRef)
  ; Empty function
EndEvent

Event OnDestroyed(ObjectReference akDestroyer)
  ; Empty function
EndEvent

Event OnDestructionStageChanged(Int aiOldStage, Int aiCurrentStage)
  ; Empty function
EndEvent

Event OnEnterFurniture(Actor akActionRef)
  ; Empty function
EndEvent

Event OnEquipped(Actor akActor)
  ; Empty function
EndEvent

Event OnExitFurniture(ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnGrab()
  ; Empty function
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  ; Empty function
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  ; Empty function
EndEvent

Event OnLoad()
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

Event OnPipboyRadioDetection(Bool abDetected)
  ; Empty function
EndEvent

Event OnPlayerDialogueTarget()
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

Event OnRead()
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

Function OpenOneWayTransferMenu(Bool aIsGiveOnly, FormList aFilterList) Native

Function PauseAudio() Native

Actor Function PlaceActorAtMe(ActorBase akActorToPlace, Int aiLevelMod, Location akEncLoc, Bool abForcePersist, Bool abInitiallyDisabled, Bool abDeleteWhenAble, Float[] akOffsetValues, Bool abSnapOffsetToNavmesh) Native

ObjectReference Function PlaceAtMe(Form akFormToPlace, Int aiCount, Bool abForcePersist, Bool abInitiallyDisabled, Bool abDeleteWhenAble, Float[] akOffsetValues, Alias akAliasToFill, Bool abSnapOffsetToNavmesh) Native

ObjectReference Function PlaceAtNode(String asNodeName, Form akFormToPlace, Int aiCount, Bool abForcePersist, Bool abInitiallyDisabled, Bool abDeleteWhenAble, Bool abAttach) Native

Cell Function PlaceCellAtMe(Cell akCellToCopy, RefCollectionAlias akRefCollection, Bool abForcePersist, Bool abDeleteWhenAble, Bool abInitiallyDisabled, Float[] akOffsetValues) Native

Actor Function PlaceDuplicateActorAtMe(Actor akActorToDuplicate, Bool abForcePersist, Bool abInitiallyDisabled, Bool abDeleteWhenAble, Float[] akOffsetValues, Alias akAliasToFill, Bool abSnapOffsetToNavmesh) Native

ObjectReference Function PlaceLockedRefKeyAtMe(ObjectReference aLockedRef, Int aiCount, Bool abForcePersist, Bool abInitiallyDisabled, Bool abDeleteWhenAble) Native

spaceshipreference Function PlaceShipAtMe(Form akFormToPlace, Int aiLevelMod, Bool abPlayFx, Bool abForcePersist, Bool abInitiallyDisabled, Bool abDeleteWhenAble, Float[] akOffsetValues, Alias akAliasToFill, Location akEncLoc, Bool abSnapOffsetToNavmesh) Native

Bool Function PlayAnimation(String asAnimation) Native

Bool Function PlayAnimationAndWait(String asAnimation, String asEventName) Native

Bool Function PlayGamebryoAnimation(String asAnimation, Bool abStartOver, Float afEaseInTime) Native

Bool Function PlayImpactEffect(ImpactDataSet akImpactEffect, String asNodeName, Float afPickDirX, Float afPickDirY, Float afPickDirZ, Float afPickLength, Bool abApplyNodeRotation, Bool abUseNodeLocalRotation) Native

Bool Function PlaySyncedAnimationAndWaitSS(String asAnimation1, String asEvent1, ObjectReference akObj2, String asAnimation2, String asEvent2) Native

Bool Function PlaySyncedAnimationSS(String asAnimation1, ObjectReference akObj2, String asAnimation2) Native

Function PlayTerrainEffect(String asEffectModelName, String asAttachBoneName) Native

Function PreloadExteriorCell() Native

Function PreloadTargetArea() Native

Function ProcessTrapHit(ObjectReference akTrap, Float afDamage, Float afPushback, Float afXVel, Float afYVel, Float afZVel, Float afXPos, Float afYPos, Float afZPos, Int aeMaterial, Float afStagger) Native

Function PromoteToLegendary(Int aiRank, legendaryitem akItemDefinition) Native

Function PushActorAway(Actor akActorToPush, Float aiKnockbackForce) Native

Function RemoveAllItems(ObjectReference akTransferTo, Bool abKeepOwnership, Bool abRespectTargetCapacity) Native

Function RemoveAllMods() Native

Function RemoveAllModsFromInventoryItem(Form akItem) Native

Bool Function RemoveDependentAnimatedObjectReference(ObjectReference akDependent) Native

Int Function RemoveItem(Form akItemToRemove, Int aiCount, Bool abSilent, ObjectReference akOtherContainer) Native

Int Function RemoveItemByComponent(Form akComponentToRemove, Int aiCount, Bool abSilent, ObjectReference akOtherContainer) Native

Function RemoveKeyword(Keyword apKeyword) Native

Function RemoveMod(objectmod akMod) Native

Function RemoveModFromInventoryItem(Form akItem, objectmod akMod) Native

Int Function RemoveResources(resource akResource, Int aiCount, Bool abSilent) Native

Function RemoveTransferLink(ObjectReference akTarget) Native

Function Repair() Native

Function Reset(ObjectReference akTarget) Native

Function ResetKeyword(Keyword apKeyword) Native

Function RestoreValue(ActorValue akAV, Float afAmount) Native

Function ResumeAudio() Native

Function ReverseConveyorBelt(Bool abReverse) Native

Function Say(Topic akTopicToSay, Actor akActorToSpeakAs, Bool abSpeakInPlayersHead, ObjectReference akTarget) Native

Function SayCustom(Keyword akKeywordToSay, Actor akActorToSpeakAs, Bool abSpeakInPlayersHead, ObjectReference akTarget) Native

Function SendStealAlarm(Actor akThief) Native

Function SetActivateTextOverride(Message akText) Native

Function SetActorCause(Actor akActor) Native

Function SetActorOwner(ActorBase akActorBase, Bool abNoCrime) Native

Function SetActorRefOwner(Actor akActor, Bool abNoCrime) Native

Function SetAngle(Float afXAngle, Float afYAngle, Float afZAngle) Native

Function SetAnimationVariableBool(String arVariableName, Bool abNewValue) Native

Function SetAnimationVariableFloat(String arVariableName, Float afNewValue) Native

Function SetAnimationVariableInt(String arVariableName, Int aiNewValue) Native

Function SetAttractionActive(Keyword apKeyword, Bool abActive) Native

Function SetConveyorBeltVelocity(Float afLinVelX, Float afLinVelY, Float afLinVelZ) Native

Function SetDebugTextBillboard(Bool abBillboard) Native

Function SetDebugTextColor(Int aiRed, Int aiGreen, Int aiBlue, Int aiAlpha) Native

Function SetDebugTextSize(Int aiFontSize) Native

Function SetDebugTextString(String asText) Native

Function SetDestroyed(Bool abDestroyed) Native

Function SetDirectAtTarget(ObjectReference akTarget) Native

Function SetDoorInaccessible(Bool abInaccessible) Native

Function SetFactionOwner(Faction akFaction, Bool abNoCrime) Native

Function SetHarvested(Bool abHarvested) Native

Function SetLinkedRef(ObjectReference akLinkedRef, Keyword apKeyword, Bool abPromoteParentRefr) Native

Function SetLocRefType(Location akLoc, LocationRefType akRefType) Native

Function SetLockLevel(Int aiLockLevel) Native

Function SetMapMarkerCategory(Int iCategory) Native

Function SetMapMarkerType(Int iType) Native

Function SetMapMarkerUnexploredName(Message aName) Native

Function SetMarkerAllowGravJump(Bool aAllowGravJump) Native

Function SetMarkerDiscovered() Native

Function SetMarkerUndiscoveredVisibility(Int iVisibilityEnum) Native

Function SetMarkerVisibleOnStarMap(Bool aVisible) Native

Function SetMotionType(Int aeMotionType, Bool abImmediatelySimulate) Native

Function SetNoFavorAllowed(Bool abNoFavor) Native

Function SetOpen(Bool abOpen) Native

Function SetOverrideName(Message akText) Native

Function SetPersistLoc(Location akLoc) Native

Function SetPlayerHasTaken(Bool abTaken) Native

Function SetPosition(Float afX, Float afY, Float afZ) Native

Function SetRadioFrequency(Float afFrequency) Native

Function SetRadioOn(Bool abOn) Native

Function SetRadioVolume(Float afVolume) Native

Function SetRequiresScanning(Bool abRequiresScanning) Native

Function SetScale(Float afScale) Native

Function SetScanned(Bool abValue) Native

Function SetValue(ActorValue akAV, Float afValue) Native

Bool Function SetWorkshopState(Int aState) Native

Function ShowHangarMenu(Int aiMode, Actor akVendor, spaceshipreference akMenuTarget, Bool abOpenToAvailableTab) Native

Function ShowWorkshopBuilderMenu() Native

Function ShowWorkshopTargetMenu(Bool abIncludeSameSystem, Keyword akSameSystemRequiredKeyword, Bool abIncludeIntersystem, Keyword akIntersystemRequiredKeyword) Native

Function SplineTranslateTo(Float afX, Float afY, Float afZ, Float afXAngle, Float afYAngle, Float afZAngle, Float afTangentMagnitude, Float afSpeed, Float afMaxRotationSpeed) Native

Function SplineTranslateToRefNode(ObjectReference arTarget, String arNodeName, Float afTangentMagnitude, Float afSpeed, Float afMaxRotationSpeed) Native

Function StartSequence(String aSequenceName, Bool aAttach, Float afWeight) Native

Function StartSequenceOnReferences(String aSequenceName, ObjectReference[] aRefs, Bool aAttach) Global Native

Function StartWorkshop(Bool abStart) Native

Function StopAllSequences() Native

Function StopAllSequencesOnReferences(ObjectReference[] aRefs) Global Native

Function StopSequence(String aSequenceName) Native

Function StopTranslation() Native

Function StoreInWorkshop(Form akBaseItem, Int aiCount) Native

Function TetherToHorse(ObjectReference akHorse) Native

Function TranslateTo(Float afX, Float afY, Float afZ, Float afXAngle, Float afYAngle, Float afZAngle, Float afSpeed, Float afMaxRotationSpeed) Native

Function UnassignCrew(Actor aCrewMember) Native

Bool Function WaitFor3DLoad() Native

Bool Function WaitForAnimationEvent(String asEventName) Native

Float Function getDistance(ObjectReference akOther) Native

spaceshipreference Function GetCurrentShipRef()
  ObjectReference myShip = Self.GetParentCell().GetParentRef()
  Return myShip as spaceshipreference
EndFunction

Function Unlock(Bool abAsOwner)
  Self.Lock(False, abAsOwner, True)
EndFunction

Bool Function rampRumble(Float power, Float duration, Float falloff)
  If power > 1.0 || power <= 0.0
    
  EndIf
  Float playerDist = Game.getplayer().getDistance(Self)
  If playerDist < falloff
    Float intensity = 1.0 - playerDist / falloff
    intensity *= power
    If intensity > 1.0
      intensity = 1.0
    ElseIf intensity <= 0.0
      intensity = 0.0
      Return False
    EndIf
    Game.shakeCamera(Game.getplayer() as ObjectReference, intensity, 0.0)
    Game.shakeController(intensity, intensity, duration)
    Return True
  Else
    Return False
  EndIf
EndFunction

Bool Function IsNearPlayer()
  Actor player = Game.getplayer()
  Cell targetCell = Self.GetParentCell()
  Cell playerCell = player.GetParentCell()
  If targetCell != playerCell
    If (targetCell as Bool && targetCell.IsInterior()) || (playerCell as Bool && playerCell.IsInterior())
      Return False
    ElseIf player.getDistance(Self) > 3000.0
      Return False
    Else
      Return True
    EndIf
  Else
    Return True
  EndIf
EndFunction

Bool Function IsInInterior()
{ Returns !IsInExterior() }
  Cell parentCell = Self.GetParentCell()
  Return parentCell as Bool && parentCell.IsInterior()
EndFunction

Bool Function MoveToIfUnloaded(ObjectReference akTarget, Float afXOffset, Float afYOffset, Float afZOffset)
{ Calls MoveTo if the calling ObjectReference is currently unloaded. Doesn't do anything if it IS loaded. No waiting or while loops. Returns true if it does the moveto }
  If !Self.Is3DLoaded()
    Self.MoveTo(akTarget, afXOffset, afYOffset, afZOffset, True, False)
    Return True
  Else
    Return False
  EndIf
EndFunction

Bool Function HasRefType(LocationRefType akRefType)
  Return Self.HasLocRefType(akRefType)
EndFunction

Function MoveToWhenUnloaded(ObjectReference akTarget, Float afXOffset, Float afYOffset, Float afZOffset)
{ DEPRECATED: DO NOT USE. Calls MoveTo if both the calling ObjectReference and the akTarget ObjectReference have current locations that are not loaded. }
  While Self.GetCurrentLocation().IsLoaded() || akTarget.GetCurrentLocation().IsLoaded()
    Utility.Wait(5.0)
  EndWhile
  Self.MoveTo(akTarget, afXOffset, afYOffset, afZOffset, True, False)
EndFunction

Function AddAliasedItem(Form akItemToAdd, Alias akAlias, Int aiCount, Bool abSilent)
  Self.AddAliasedItemWithKeywords(akItemToAdd, akAlias, aiCount, abSilent, None)
EndFunction

ObjectReference Function AddAliasedItemSingle(Form akItemToAdd, Alias akAlias, Bool abSilent)
  Return Self.AddAliasedItemWithKeywordsSingle(akItemToAdd, akAlias, abSilent, None)
EndFunction

Function AddAliasedItemWithKeywords(Form akItemToAdd, Alias akAlias, Int aiCount, Bool abSilent, Keyword[] keywords)
  Int added = 0
  While added < aiCount
    Self.AddAliasedItemWithKeywordsSingle(akItemToAdd, akAlias, abSilent, keywords)
    added += 1
  EndWhile
EndFunction

ObjectReference Function AddAliasedItemWithKeywordsSingle(Form akItemToAdd, Alias akAlias, Bool abSilent, Keyword[] keywords)
  ObjectReference itemRef = Self.PlaceAtMe(akItemToAdd, 1, False, True, True, None, akAlias, True)
  If itemRef != None
    If keywords != None && keywords.Length > 0
      Int I = 0
      While I < keywords.Length
        itemRef.AddKeyword(keywords[I])
        I += 1
      EndWhile
    EndIf
    Self.AddItem(itemRef as Form, 1, abSilent)
  EndIf
  Return itemRef
EndFunction

Function AddToMapScanned(Bool abAllowFastTravel)
  Self.SetScanned(True)
  Self.AddToMap(abAllowFastTravel)
EndFunction

Float Function GetDayLength()
  Float dayLength = 24.0
  planet myPlanet = Self.GetCurrentPlanet()
  If myPlanet
    dayLength = myPlanet.GetDayLength()
  EndIf
  Return dayLength
EndFunction

Int Function GetValueInt(ActorValue akAV)
  Return Self.GetValue(akAV) as Int
EndFunction

GlobalVariable Function GetValueEnumGlobal(ActorValue akAV, GlobalVariable[] akEnumGlobals)
  Float val = Self.GetValue(akAV)
  GlobalVariable returnVal = None
  Int I = 0
  While returnVal == None && I < akEnumGlobals.Length
    If akEnumGlobals[I].GetValue() == val
      returnVal = akEnumGlobals[I]
    EndIf
    I += 1
  EndWhile
  Return returnVal
EndFunction

Actor Function GetSelfAsActor()
  Return Self as Actor
EndFunction

ObjectReference[] Function GetSingleRefArray()
  ObjectReference[] singleArray = new ObjectReference[1]
  singleArray[0] = Self
  Return singleArray
EndFunction

Bool Function HasOwner()
  Bool returnVal = False
  If (Self.HasActorRefOwner() || Self.GetActorOwner() as Bool) || Self.GetFactionOwner() as Bool
    returnVal = True
  EndIf
  Return returnVal
EndFunction

Bool Function IsCrew(Actor akActor)
  Actor[] crewMembers = Self.GetAllCrewMembers()
  Return crewMembers.find(akActor, 0) > -1
EndFunction

Bool Function IsEnabled()
  Return !Self.IsDisabled()
EndFunction

Function ModValueTo(ActorValue akAV, Float afValue)
  Float currentValue = Self.GetValue(akAV)
  Float modAmount = afValue - currentValue
  Self.ModValue(akAV, modAmount)
EndFunction

spaceshipreference Function PlaceShipAtMeOffset(Form akFormToPlace, Float xOffset, Float yOffset, Float zOffset, Int aiLevelMod, Bool abPlayFx, Bool abForcePersist, Bool abInitiallyDisabled, Bool abDeleteWhenAble, Alias akAliasToFill, Location akEncLoc, Bool abSnapOffsetToNavmesh)
  Float[] offset = new Float[6]
  offset[0] = xOffset
  offset[1] = yOffset
  offset[2] = zOffset
  Return Self.PlaceShipAtMe(akFormToPlace, aiLevelMod, abPlayFx, abForcePersist, abInitiallyDisabled, abDeleteWhenAble, offset, akAliasToFill, akEncLoc, abSnapOffsetToNavmesh)
EndFunction

Int Function IncrementLoopingValue(ActorValue akAV, Int aiMaxValue, Int aiIncrementAmount)
  Int loopedValue = (Self.GetValueInt(akAV) + aiIncrementAmount) % (aiMaxValue + 1)
  Self.SetValue(akAV, loopedValue as Float)
  Return loopedValue
EndFunction

Function SplineTranslateToRef(ObjectReference arTarget, Float afTangentMagnitude, Float afSpeed, Float afMaxRotationSpeed)
  Self.SplineTranslateTo(arTarget.X, arTarget.Y, arTarget.Z, arTarget.GetAngleX(), arTarget.GetAngleY(), arTarget.GetAngleZ(), afTangentMagnitude, afSpeed, afMaxRotationSpeed)
EndFunction

Function TranslateToRef(ObjectReference arTarget, Float afSpeed, Float afMaxRotationSpeed)
  Self.TranslateTo(arTarget.X, arTarget.Y, arTarget.Z, arTarget.GetAngleX(), arTarget.GetAngleY(), arTarget.GetAngleZ(), afSpeed, afMaxRotationSpeed)
EndFunction

Bool Function IsInLocation(Location akLocation)
  Location currLoc = Self.GetCurrentLocation()
  If currLoc == None
    Return False
  Else
    Return akLocation != None && (akLocation.IsChild(currLoc) || currLoc == akLocation)
  EndIf
EndFunction

Bool Function TryToStartCombat(ObjectReference akTarget, Bool abPreferredTarget)
  Bool bSuccess = False
  Actor targetActor = akTarget as Actor
  If targetActor
    Actor selfActor = Self as Actor
    If selfActor
      bSuccess = True
      selfActor.StartCombat(targetActor as ObjectReference, abPreferredTarget)
    EndIf
  Else
    spaceshipreference targetShip = akTarget as spaceshipreference
    If targetShip
      spaceshipreference selfShip = Self as spaceshipreference
      If selfShip
        bSuccess = True
        selfShip.StartCombat(targetShip, abPreferredTarget)
      EndIf
    EndIf
  EndIf
  Return bSuccess
EndFunction

Bool Function TryToStopCombat()
  Bool bSuccess = False
  Actor selfActor = Self as Actor
  If selfActor
    bSuccess = True
    selfActor.StopCombat()
  Else
    spaceshipreference selfShip = Self as spaceshipreference
    If selfShip
      bSuccess = True
      selfShip.StopCombat()
    EndIf
  EndIf
  Return bSuccess
EndFunction

Bool Function TryToStopCombatAlarm()
  Bool bSuccess = False
  Actor selfActor = Self as Actor
  If selfActor
    bSuccess = True
    selfActor.StopCombatAlarm()
  Else
    spaceshipreference selfShip = Self as spaceshipreference
    If selfShip
      bSuccess = True
      selfShip.StopCombatAlarm()
    EndIf
  EndIf
  Return bSuccess
EndFunction

Bool Function TryToAddToFaction(Faction akFaction)
  Bool bSuccess = False
  Actor selfActor = Self as Actor
  If selfActor
    bSuccess = True
    selfActor.AddToFaction(akFaction)
  Else
    spaceshipreference selfShip = Self as spaceshipreference
    If selfShip
      bSuccess = True
      selfShip.AddToFaction(akFaction)
    EndIf
  EndIf
  Return bSuccess
EndFunction

Bool Function TryToRemoveFromFaction(Faction akFaction)
  Bool bSuccess = False
  Actor selfActor = Self as Actor
  If selfActor
    bSuccess = True
    selfActor.RemoveFromFaction(akFaction)
  Else
    spaceshipreference selfShip = Self as spaceshipreference
    If selfShip
      bSuccess = True
      selfShip.RemoveFromFaction(akFaction)
    EndIf
  EndIf
  Return bSuccess
EndFunction

Bool Function TryToRemoveFromAllFactions()
  Bool bSuccess = False
  Actor selfActor = Self as Actor
  If selfActor
    bSuccess = True
    selfActor.RemoveFromAllFactions()
  Else
    spaceshipreference selfShip = Self as spaceshipreference
    If selfShip
      bSuccess = True
      selfShip.RemoveFromAllFactions()
    EndIf
  EndIf
  Return bSuccess
EndFunction

Bool Function TryToEvaluatePackage()
  Bool bSuccess = False
  Actor selfActor = Self as Actor
  If selfActor
    bSuccess = True
    selfActor.EvaluatePackage(False)
  Else
    spaceshipreference selfShip = Self as spaceshipreference
    If selfShip
      bSuccess = True
      selfShip.EvaluatePackage(False)
    EndIf
  EndIf
  Return bSuccess
EndFunction

Bool Function TryToKill(ObjectReference akKiller)
  Bool bSuccess = False
  Actor selfActor = Self as Actor
  If selfActor
    bSuccess = True
    Actor targetActor = akKiller as Actor
    selfActor.Kill(targetActor)
  Else
    spaceshipreference selfShip = Self as spaceshipreference
    If selfShip
      bSuccess = True
      spaceshipreference targetShip = akKiller as spaceshipreference
      selfShip.Kill(targetShip)
    EndIf
  EndIf
  Return bSuccess
EndFunction

Bool Function TryToSetGhost(Bool bSetGhost)
  Bool bSuccess = False
  Actor selfActor = Self as Actor
  If selfActor
    bSuccess = True
    selfActor.SetGhost(bSetGhost)
  Else
    spaceshipreference selfShip = Self as spaceshipreference
    If selfShip
      bSuccess = True
      selfShip.SetGhost(bSetGhost)
    EndIf
  EndIf
  Return bSuccess
EndFunction

Bool Function TryToSetProtected(Bool bSetProtected)
  Bool bSuccess = False
  Actor selfActor = Self as Actor
  If selfActor
    bSuccess = True
    selfActor.SetProtected(bSetProtected)
  Else
    spaceshipreference selfShip = Self as spaceshipreference
    If selfShip
      bSuccess = True
      selfShip.SetProtected(bSetProtected)
    EndIf
  EndIf
  Return bSuccess
EndFunction

Bool Function TryToSetEssential(Bool bSetEssential)
  Bool bSuccess = False
  Actor selfActor = Self as Actor
  If selfActor
    bSuccess = True
    selfActor.SetEssential(bSetEssential)
  Else
    spaceshipreference selfShip = Self as spaceshipreference
    If selfShip
      bSuccess = True
      selfShip.SetEssential(bSetEssential)
    EndIf
  EndIf
  Return bSuccess
EndFunction

spaceshipreference Function PlaceShipNearMe(Form akFormToPlace, Int positionVal, Int distanceVal, Int facingVal, Int aiLevelMod, Bool abPlayFx, Bool abForcePersist, Bool abInitiallyDisabled, Bool abDeleteWhenAble, Alias akAliasToFill)
  spaceshipreference ship = Self.PlaceShipAtMe(akFormToPlace, aiLevelMod, False, abForcePersist, True, abDeleteWhenAble, None, akAliasToFill, None, True)
  ship.MoveNear(Self, positionVal, distanceVal, facingVal)
  If !abInitiallyDisabled
    If abPlayFx
      ship.EnableWithGravJump()
    Else
      ship.EnableNoWait(False)
    EndIf
  EndIf
  Return ship
EndFunction

Function MoveNear(ObjectReference akTarget, Int positionVal, Int distanceVal, Int facingVal)
  Float[] offsets = new Float[6]
  Float targetMaxBound = Math.Max(Self.GetWidth(), Math.Max(Self.GetHeight(), Self.GetLength()))
  Float nearRefMaxBound = Math.Max(akTarget.GetWidth(), Math.Max(akTarget.GetHeight(), akTarget.GetLength()))
  Float distance = targetMaxBound + nearRefMaxBound
  If distanceVal == Self.CONST_NearDistance_Random
    distanceVal = Utility.RandomInt(Self.CONST_NearDistance_Min, Self.CONST_NearDistance_Max)
  ElseIf distanceVal == Self.CONST_NearDistance_RandomFar
    distanceVal = Utility.RandomInt(Self.CONST_NearDistance_Moderate, Self.CONST_NearDistance_Long)
  EndIf
  If distanceVal == Self.CONST_NearDistance_VeryClose
    
  ElseIf distanceVal == Self.CONST_NearDistance_Close
    distance += Utility.RandomFloat(Self.CONST_NearDistance_Close_Min as Float, Self.CONST_NearDistance_Close_Max as Float)
  ElseIf distanceVal == Self.CONST_NearDistance_Short
    distance += Utility.RandomFloat(Self.CONST_NearDistance_Short_Min as Float, Self.CONST_NearDistance_Short_Max as Float)
  ElseIf distanceVal == Self.CONST_NearDistance_Moderate
    distance += Utility.RandomFloat(Self.CONST_NearDistance_Moderate_Min as Float, Self.CONST_NearDistance_Moderate_Max as Float)
  ElseIf distanceVal == Self.CONST_NearDistance_Long
    distance += Utility.RandomFloat(Self.CONST_NearDistance_Long_Min as Float, Self.CONST_NearDistance_Long_Max as Float)
  ElseIf distanceVal == Self.CONST_NearDistance_VeryLong
    distance += Utility.RandomFloat(Self.CONST_NearDistance_VeryLong_Min as Float, Self.CONST_NearDistance_VeryLong_Max as Float)
  EndIf
  If positionVal == Self.CONST_NearPosition_Random
    positionVal = Utility.RandomInt(Self.CONST_NearPosition_Min, Self.CONST_NearPosition_Max)
  EndIf
  If positionVal == Self.CONST_NearPosition_DeadAhead
    offsets[1] = distance
  Else
    Float randomOffsetCoordinate1 = Utility.RandomFloat(-1.0, 1.0)
    Float randomOffsetCoordinate2 = Utility.RandomFloat(-1.0, 1.0)
    If positionVal == Self.CONST_NearPosition_ForwardTight
      offsets[0] = distance * Self.CONST_NearPosition_TightArc * randomOffsetCoordinate1
      offsets[1] = distance
      offsets[2] = distance * Self.CONST_NearPosition_TightArc * randomOffsetCoordinate2
    ElseIf positionVal == Self.CONST_NearPosition_ForwardWide
      offsets[0] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate1
      offsets[1] = distance
      offsets[2] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate2
    ElseIf positionVal == Self.CONST_NearPosition_Behind
      offsets[0] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate1
      offsets[1] = -1.0 * distance
      offsets[2] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate2
    ElseIf positionVal == Self.CONST_NearPosition_Above
      offsets[0] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate1
      offsets[1] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate2
      offsets[2] = distance
    ElseIf positionVal == Self.CONST_NearPosition_Below
      offsets[0] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate1
      offsets[1] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate2
      offsets[2] = -1.0 * distance
    ElseIf positionVal == Self.CONST_NearPosition_Left
      offsets[0] = -1.0 * distance
      offsets[1] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate1
      offsets[2] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate2
    ElseIf positionVal == Self.CONST_NearPosition_Right
      offsets[0] = distance
      offsets[1] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate1
      offsets[2] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate2
    EndIf
  EndIf
  If facingVal == Self.CONST_NearFacing_Random
    facingVal = Utility.RandomInt(Self.CONST_NearFacing_Min, Self.CONST_NearFacing_Max)
  EndIf
  If facingVal == Self.CONST_NearFacing_TotallyRandom
    offsets[3] = Utility.RandomFloat(0.0, 360.0)
    offsets[4] = Utility.RandomFloat(0.0, 360.0)
    offsets[5] = Utility.RandomFloat(0.0, 360.0)
  ElseIf facingVal == Self.CONST_NearFacing_Direct
    offsets[3] = 0.0
    offsets[4] = 0.0
    offsets[5] = Self.CONST_NearFacing_HeadingCorrectionToDirectFacing
  Else
    offsets[3] = Self.CONST_NearFacing_TightAngle * Utility.RandomFloat(-1.0, 1.0)
    offsets[4] = Self.CONST_NearFacing_TightAngle * Utility.RandomFloat(-1.0, 1.0)
    offsets[5] = Self.CONST_NearFacing_TightAngle * Utility.RandomFloat(-1.0, 1.0)
    Float randomOffset = Utility.RandomFloat(-1.0, 1.0)
    If facingVal == Self.CONST_NearFacing_TowardSmall
      offsets[5] = Self.CONST_NearFacing_HeadingCorrectionToDirectFacing + Self.CONST_NearFacing_TightAngle * randomOffset
    ElseIf facingVal == Self.CONST_NearFacing_TowardLarge
      offsets[5] = Self.CONST_NearFacing_HeadingCorrectionToDirectFacing + Self.CONST_NearFacing_WideAngle * randomOffset
    ElseIf facingVal == Self.CONST_NearFacing_AwaySmall
      offsets[5] = -1.0 * Self.CONST_NearFacing_HeadingCorrectionToDirectFacing + Self.CONST_NearFacing_TightAngle * randomOffset
    ElseIf facingVal == Self.CONST_NearFacing_AwayLarge
      offsets[5] = -1.0 * Self.CONST_NearFacing_HeadingCorrectionToDirectFacing + Self.CONST_NearFacing_WideAngle * randomOffset
    ElseIf facingVal == Self.CONST_NearFacing_LeftSideOn
      offsets[5] = Self.CONST_NearFacing_HeadingCorrectionToDirectFacing + 90.0 + Self.CONST_NearFacing_WideAngle * randomOffset
    ElseIf facingVal == Self.CONST_NearFacing_RightSideOn
      offsets[5] = Self.CONST_NearFacing_HeadingCorrectionToDirectFacing - 90.0 + Self.CONST_NearFacing_WideAngle * randomOffset
    ElseIf facingVal == Self.CONST_NearFacing_TopSideOn
      offsets[3] = 90.0 + Self.CONST_NearFacing_WideAngle * randomOffset
    ElseIf facingVal == Self.CONST_NearFacing_BottomSideOn
      offsets[3] = -90.0 + Self.CONST_NearFacing_WideAngle * randomOffset
    EndIf
  EndIf
  Form XMarker = Game.GetFormFromFile(59, "Starfield.esm")
  ObjectReference targetMarker = akTarget.PlaceAtMe(XMarker, 1, False, False, True, offsets, None, True)
  Self.MoveTo(targetMarker, 0.0, 0.0, 0.0, True, False)
  targetMarker.Delete()
EndFunction
