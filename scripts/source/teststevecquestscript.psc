ScriptName TestSteveCQuestScript Extends Quest

;-- Variables ---------------------------------------
Int CONST_TeleportOutVFXDelay = 2 Const
Int CONST_TestSwapTimerDelay = 5 Const
Int CONST_TestSwapTimerID = 2 Const
ObjectReference[] allTestActivators
Int currentActivatorCount
Actor temp
ObjectReference testDecal
spaceshipreference testShipN

;-- Properties --------------------------------------
ReferenceAlias Property TestSteveCHoldingContainer Auto Const mandatory
textureset Property Decal_JGVectera01 Auto Const mandatory
ReferenceAlias Property PlayerShip Auto Const mandatory
Cell Property TestSteveCSpaceCell Auto Const mandatory
RefCollectionAlias Property TestSpaceCellRefs Auto Const mandatory
RefCollectionAlias Property TestSpaceCellRefs_Ship01 Auto Const mandatory
ReferenceAlias Property TestSpaceCellRefs_Ship02 Auto Const mandatory
ReferenceAlias Property DebugText Auto Const mandatory
ReferenceAlias Property TestDoor Auto Const mandatory
spaceshipbase Property PirateShipModular01 Auto Const mandatory
spaceshipbase[] Property TestShips Auto Const mandatory
ReferenceAlias Property TestLinkedRefShip Auto Const mandatory
ReferenceAlias Property TestLinkedRefNonship Auto Const mandatory
ReferenceAlias Property TestLinkedRefNonship2 Auto Const mandatory
ReferenceAlias Property TestLever Auto Const mandatory
Keyword Property BEDisembarkerLink Auto Const mandatory
Message Property MQ206D_PowerInterlock_Disengage Auto Const mandatory
Message Property MQ206D_PowerInterlock_Engage Auto Const mandatory
ReferenceAlias Property SimonSaysMarker Auto Const mandatory
ReferenceAlias Property SimonSaysActor Auto Const mandatory
Spell Property LC088_DefensiveBatteryFireProjectileSpell Auto Const mandatory
Static Property XMarker Auto Const mandatory
ObjectReference Property TestSteveCSpaceTrigger1Ref Auto Const mandatory
spaceshipreference Property TestSteveCDockingParentShipRef Auto Const mandatory
spaceshipreference Property TestSteveCDockingChildShipRef Auto Const mandatory
ObjectReference Property TestSteveCAsteroidRef Auto Const mandatory
ObjectReference Property TestSteveCBossChest Auto Const mandatory
Message Property TestSteveCOnActivateEventMessage Auto Const mandatory
Message Property TestSteveCOnOpenEventMessage Auto Const mandatory
Message Property TestMessageBox01 Auto Const mandatory
ReferenceAlias Property TestAliasedItem01 Auto Const mandatory
ReferenceAlias Property TestAliasedItem02 Auto Const mandatory
ReferenceAlias Property TestSteveCUniqueShip Auto Const mandatory
ReferenceAlias Property TheKeyMapMarkerHeadingRef Auto Const mandatory
ReferenceAlias Property TheKeyAlternateMapMarkerHeadingRef Auto Const mandatory
ReferenceAlias Property TheKeyOriginMarkerRef Auto Const mandatory
ReferenceAlias Property SuvorovPlanetUniqueArrivalMarkerRef Auto Const mandatory
ReferenceAlias Property DefensiveBatteryLaphaMapMarkerHeadingRef Auto Const mandatory
ObjectReference Property TestSteveCTerminalRef Auto Const mandatory
Perk Property TestVorpalShipPerk Auto Const mandatory
ObjectReference Property TestSteveCAmbushLeverRef Auto Const mandatory
ObjectReference Property TestSteveCAmbushMarkerRef Auto Const mandatory
ObjectReference Property MQ206DLandingMarkerRef Auto Const mandatory
spaceshipbase Property TestLeveledShip Auto Const mandatory
ReferenceAlias Property LC165TestStarbornCaster Auto Const mandatory
ActorValue Property LC165_StarbornStateValue Auto Const mandatory
Spell Property LC165_Starborn_Bridge_GravityWell Auto Const mandatory
Keyword Property LinkCustom01 Auto Const mandatory
RefCollectionAlias Property PipeTraps Auto Const mandatory
spaceshipreference Property TestDisembarking02 Auto Const mandatory
ReferenceAlias Property TestDialogueBugs2Actor Auto Const mandatory
Faction Property LC165StarbornEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ActorValue Property Confidence Auto Const mandatory
Spell Property AIPower_VoidForm Auto Const mandatory
Spell Property LC165_Scripted_VoidFormAb Auto Const mandatory
Spell Property TestSteveCStarbornCasterScriptedSpell Auto Const mandatory
FormList Property FilterList_InventoryCategoryAidFood Auto Const mandatory
ObjectReference Property TestSteveCCloseDoorOnDetachRef Auto Const mandatory
ObjectReference Property TestSteveCProjectileSourceMarkerRef Auto Const mandatory
ObjectReference Property TestSteveCTrafficManagerSettingsRef Auto Const mandatory
ReferenceAlias Property TestSwapActor01 Auto Const mandatory
ReferenceAlias Property TestSwapActor02 Auto Const mandatory
Spell Property LC165_AbTeleportSwapIn Auto Const mandatory
Spell Property LC165_AbTeleportSwapOut Auto Const mandatory
Explosion Property LC165_StarbornTeleportSwapExplosion Auto Const mandatory
ReferenceAlias Property MentatsAlias1 Auto Const mandatory
ReferenceAlias Property MentatsAlias2 Auto Const mandatory
ReferenceAlias Property BerryMentatsAlias1 Auto Const mandatory
ReferenceAlias Property BerryMentatsAlias2 Auto Const mandatory
ReferenceAlias Property BourbonAlias Auto Const mandatory
RefCollectionAlias Property TestActivators Auto Const mandatory
GlobalVariable Property TestSteveCCurrentCountGlobal Auto Const mandatory
GlobalVariable Property TestSteveCTotalCountGlobal Auto Const mandatory
GlobalVariable Property TestSteveCQuestTargetsGlobal Auto Const mandatory
Spell Property TestSteveCPerkSpell Auto Const mandatory
ReferenceAlias Property TestTurret Auto Const mandatory
sq_parentscript Property SQ_Parent Auto Const mandatory
ObjectReference Property TestPlatformHelperRef Auto Const mandatory

;-- Functions ---------------------------------------

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
  ; Empty function
EndEvent

Event ObjectReference.OnTriggerLeave(ObjectReference akSource, ObjectReference akTriggerRef)
  ; Empty function
EndEvent

Event SQ_ParentScript.SQ_BEStarted(sq_parentscript source, Var[] akArgs)
  ; Empty function
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  ; Empty function
EndEvent

Function TraceGravity(ObjectReference testObject)
  ; Empty function
EndFunction

Function TraceHasSpell()
  ; Empty function
EndFunction

Function TraceObjectsInTrigger(ObjectReference obj)
  ; Empty function
EndFunction

Function TestSpawnLeveledShip(Int difficulty)
  If testShipN != None
    testShipN.Disable(False)
    testShipN.Delete()
  EndIf
  spaceshipreference ship = PlayerShip.GetShipRef()
  testShipN = ship.PlaceShipNearMe(TestLeveledShip as Form, ship.CONST_NearPosition_DeadAhead, ship.CONST_NearDistance_Close, ship.CONST_NearFacing_Direct, difficulty, True, False, False, True, None)
EndFunction

Event OnQuestStarted()
  Self.RegisterForRemoteEvent(TestSteveCSpaceTrigger1Ref as ScriptObject, "OnTriggerEnter")
  Self.RegisterForRemoteEvent(TestSteveCSpaceTrigger1Ref as ScriptObject, "OnTriggerLeave")
  Self.RegisterForRemoteEvent(TestSteveCBossChest as ScriptObject, "OnActivate")
  Self.RegisterForRemoteEvent(TestSteveCBossChest as ScriptObject, "OnOpen")
  Self.RegisterForRemoteEvent(TestSteveCAmbushLeverRef as ScriptObject, "OnActivate")
  Self.RegisterForRemoteEvent(TestSteveCCloseDoorOnDetachRef as ScriptObject, "OnCellDetach")
  Self.RegisterForRemoteEvent(TestSwapActor01 as ScriptObject, "OnLoad")
EndEvent

Function TestSpaceCell()
  PlayerShip.GetRef().PlaceCellAtMe(TestSteveCSpaceCell, TestSpaceCellRefs, False, True, False, None)
  TestSpaceCellRefs_Ship01.RefillAlias()
  TestSpaceCellRefs_Ship02.RefillAlias()
EndFunction

Function SetDebugTextColor(Int r, Int g, Int b, Int a)
  DebugText.GetRef()
EndFunction

Function SetDebugTextSize(Int S)
  DebugText.GetRef()
EndFunction

Function SetDebugTextString(String t)
  DebugText.GetRef()
EndFunction

Function SetDebugTextBillboard(Bool b)
  DebugText.GetRef()
EndFunction

Function SetLockedWithDelay(Bool shouldUnlock)
  Utility.Wait(2.0)
  If shouldUnlock
    TestDoor.GetRef().Unlock(False)
  Else
    TestDoor.GetRef().Lock(True, False, True)
  EndIf
EndFunction

Function SpawnTestShip(Int I)
  Float[] offsets = new Float[6]
  offsets[1] = 1000.0
  ObjectReference marker = PlayerShip.GetRef().PlaceShipAtMe(TestShips[I] as Form, 4, True, False, False, True, offsets, None, None, True) as ObjectReference
EndFunction

Function MoveShip1(spaceshipreference ship)
  ship.MoveTo(ship as ObjectReference, 0.0, 0.0, 0.0, True, False)
EndFunction

Function MoveShip2(spaceshipreference ship)
  Float[] offsets = new Float[6]
  offsets[1] = 1000.0
  ObjectReference marker = ship.PlaceAtMe(XMarker as Form, 1, False, False, True, offsets, None, True)
  ship.MoveTo(marker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function MoveShip3(spaceshipreference ship)
  ship.Disable(False)
  Float[] offsets = new Float[6]
  offsets[1] = 1000.0
  ObjectReference marker = ship.PlaceAtMe(XMarker as Form, 1, False, False, True, offsets, None, True)
  ship.MoveTo(marker, 0.0, 0.0, 0.0, True, False)
  ship.Enable(False)
EndFunction

Function MoveShip4()
  ObjectReference newShip = PlayerShip.GetRef().PlaceShipAtMe(PirateShipModular01 as Form, 4, True, False, False, True, None, None, None, True) as ObjectReference
  Float[] offsets = new Float[6]
  offsets[1] = 1000.0
  ObjectReference marker = PlayerShip.GetRef().PlaceAtMe(XMarker as Form, 1, False, False, True, offsets, None, True)
  newShip.MoveTo(marker, 0.0, 0.0, 0.0, True, False)
  newShip.Enable(False)
EndFunction

Function TestShipOpen(spaceshipreference S, Bool shouldBeOpen)
  S.SetOpen(shouldBeOpen)
EndFunction

Function TestGravJumpVFX(spaceshipreference ship, Bool shouldEnable)
  If shouldEnable
    ship.EnableWithGravJump()
  Else
    ship.DisableWithGravJump()
  EndIf
EndFunction

Function TraceLinkedRefs()
  ObjectReference testNonShip = TestLinkedRefNonship.GetRef()
  ObjectReference[] refsLinkedToMe3 = testNonShip.GetRefsLinkedToMe(None, None)
  Actor[] actorsLinkedToMe3 = testNonShip.GetActorsLinkedToMe(None, None)
  ObjectReference[] refsLinkedToMe4 = testNonShip.GetRefsLinkedToMe(BEDisembarkerLink, None)
  Actor[] actorsLinkedToMe4 = testNonShip.GetActorsLinkedToMe(BEDisembarkerLink, None)
EndFunction

Function AddBourbonByRef()
  ObjectReference aliasedBourbonRef = BourbonAlias.GetRef()
  Game.GetPlayer().AddItem(aliasedBourbonRef as Form, 1, False)
EndFunction

Function AddBerryMentatsByRef()
  ObjectReference aliasedBerryMentats = BerryMentatsAlias1.GetRef()
  Game.GetPlayer().AddItem(aliasedBerryMentats as Form, 1, False)
EndFunction

Function TestActivatorCounting()
  currentActivatorCount = 0
  TestSteveCCurrentCountGlobal.SetValue(currentActivatorCount as Float)
  If allTestActivators == None
    Int totalActivatorCount = TestActivators.GetCount()
    TestSteveCTotalCountGlobal.SetValue(totalActivatorCount as Float)
    Self.UpdateCurrentInstanceGlobal(TestSteveCTotalCountGlobal)
    allTestActivators = new ObjectReference[totalActivatorCount]
    Int I = 0
    While I < allTestActivators.Length
      allTestActivators[I] = TestActivators.GetAt(I)
      Self.RegisterForRemoteEvent(allTestActivators[I] as ScriptObject, "OnActivate")
      I += 1
    EndWhile
  EndIf
  Self.UpdateActivatorCount()
EndFunction

Function TestActivatorsBlockActivation(Bool abBlocked, Bool abHideActivateText)
  Int I = 0
  While I < allTestActivators.Length
    allTestActivators[I].BlockActivation(abBlocked, abHideActivateText)
    I += 1
  EndWhile
EndFunction

Function UpdateActivatorCount()
  TestSteveCCurrentCountGlobal.SetValue(currentActivatorCount as Float)
  Self.UpdateCurrentInstanceGlobal(TestSteveCCurrentCountGlobal)
  Self.UpdateCurrentInstanceGlobal(TestSteveCTotalCountGlobal)
  Self.SetObjectiveDisplayed(300, True, False)
  If currentActivatorCount % 2 > 0
    Self.SetObjectiveDisplayed(302, False, False)
    Self.SetObjectiveDisplayed(301, True, False)
  Else
    Self.SetObjectiveDisplayed(301, False, False)
    Self.SetObjectiveDisplayed(302, True, False)
  EndIf
EndFunction

Function SetActivatorCount(Int newCount, Bool redisplay)
  TestSteveCCurrentCountGlobal.SetValue(newCount as Float)
  Self.UpdateCurrentInstanceGlobal(TestSteveCCurrentCountGlobal)
  If redisplay
    Self.SetObjectiveDisplayed(300, True, True)
  EndIf
EndFunction

Event ObjectReference.OnOpen(ObjectReference akSource, ObjectReference akActionRef)
  If akSource == TestSteveCBossChest
    TestSteveCOnOpenEventMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndEvent

Function SetActivateTextOverride(Int index)
  If index == 0
    TestLever.GetRef().SetActivateTextOverride(MQ206D_PowerInterlock_Engage)
  Else
    TestLever.GetRef().SetActivateTextOverride(MQ206D_PowerInterlock_Disengage)
  EndIf
EndFunction

Function TestPlayBink(Bool shouldWait)
  If shouldWait
    Game.PlayBink("artifactvision.bk2", False, True, True, True, False)
  Else
    Game.PlayBinkNoWait("artifactvision.bk2", False, True, True, True, False, False)
  EndIf
  Utility.Wait(3.0)
  Utility.Wait(3.0)
  Utility.Wait(3.0)
  Utility.Wait(3.0)
EndFunction

Function TestCast(ObjectReference source, ObjectReference target)
  LC088_DefensiveBatteryFireProjectileSpell.Cast(source, target)
  Utility.Wait(2.0)
  LC088_DefensiveBatteryFireProjectileSpell.Cast(source, target)
  Utility.Wait(2.0)
  LC088_DefensiveBatteryFireProjectileSpell.Cast(source, target)
  Utility.Wait(2.0)
  LC088_DefensiveBatteryFireProjectileSpell.Cast(source, target)
EndFunction

Function TestCastFromProjectileSource()
  LC088_DefensiveBatteryFireProjectileSpell.Cast(TestSteveCProjectileSourceMarkerRef, PlayerShip.GetRef())
EndFunction

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akTriggerRef)
  Self.StartTimer(0.0, 1)
EndEvent

Event OnTimer(Int timerID)
  If timerID == 1
    If TestSteveCSpaceTrigger1Ref.IsInTrigger(PlayerShip.GetRef())
      Self.StartTimer(1.0, 1)
    EndIf
  ElseIf timerID == CONST_TestSwapTimerID
    Self.TestSwap()
    Self.StartTimer(CONST_TestSwapTimerDelay as Float, CONST_TestSwapTimerID)
  EndIf
EndEvent

Function MoveDockingParent()
  TestSteveCDockingParentShipRef.MoveTo(TestSteveCDockingParentShipRef as ObjectReference, 200.0, 200.0, 200.0, True, False)
EndFunction

Function TraceLinkedRefChildren()
  ObjectReference[] refsLinkedToParent = TestSteveCDockingParentShipRef.GetRefsLinkedToMe(None, None)
  Int I = 0
  While I < refsLinkedToParent.Length
    I += 1
  EndWhile
EndFunction

Function AddPerkSpell(spaceshipreference myShip)
  myShip.AddSpell(TestSteveCPerkSpell, True)
EndFunction

Function DispelPerkSpell(spaceshipreference myShip)
  myShip.DispelSpell(TestSteveCPerkSpell)
EndFunction

Function DisplayMessageBox()
  TestMessageBox01.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function MoveAliasedItemToContainer01()
  TestSteveCHoldingContainer.GetRef().AddItem(TestAliasedItem01.GetRef() as Form, 1, False)
EndFunction

Function MoveAliasedItemToPlayer01()
  Game.GetPlayer().AddItem(TestAliasedItem01.GetRef() as Form, 1, False)
EndFunction

Function MoveAliasedItemToContainer02()
  Game.GetPlayer().RemoveItem(TestAliasedItem02.GetRef() as Form, 1, False, TestSteveCHoldingContainer.GetRef())
EndFunction

Function MoveAliasedItemToPlayer02()
  Game.GetPlayer().AddItem(TestAliasedItem02.GetRef() as Form, 1, False)
EndFunction

Function TraceMyLinkedRefs(ObjectReference obj)
  ObjectReference[] refsLinkedToMe = obj.GetRefsLinkedToMe(None, None)
  Int I = 0
  While I < refsLinkedToMe.Length
    I += 1
  EndWhile
EndFunction

Function MoveKeyMapMarkerHeading(Bool returnToOriginalPosition)
  If returnToOriginalPosition
    TheKeyMapMarkerHeadingRef.GetRef().MoveTo(TheKeyOriginMarkerRef.GetRef(), 0.0, 0.0, 0.0, True, False)
  Else
    TheKeyMapMarkerHeadingRef.GetRef().MoveTo(TheKeyAlternateMapMarkerHeadingRef.GetRef(), 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function MoveSuvorovArrivalMarker(Bool returnToOriginalPosition)
  If returnToOriginalPosition
    SuvorovPlanetUniqueArrivalMarkerRef.GetRef().MoveTo(TheKeyOriginMarkerRef.GetRef(), 0.0, 0.0, 0.0, True, False)
  Else
    SuvorovPlanetUniqueArrivalMarkerRef.GetRef().MoveTo(DefensiveBatteryLaphaMapMarkerHeadingRef.GetRef(), 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function TestValues(Int value1, Int value2)
  TestSteveCTerminalRef.AddTextReplacementValue("value1", value1 as Float)
  TestSteveCTerminalRef.AddTextReplacementValue("value2", value2 as Float)
EndFunction

Function TraceTurretLOS()
  Actor turretRef = TestTurret.GetActorRef()
  Actor playerRef = Game.GetPlayer()
EndFunction

Function SetIgnoreFriendlyHits(Bool shouldIgnoreFriendlyHits)
  ObjectReference shipRef = TestSteveCUniqueShip.GetRef()
  shipRef.IgnoreFriendlyHits(shouldIgnoreFriendlyHits)
EndFunction

Function AddVorpalShipPerk()
  PlayerShip.GetShipRef().AddPerk(TestVorpalShipPerk, False)
EndFunction

Function RegisterForShipHit()
  Self.RegisterForHitEvent(TestSteveCDockingParentShipRef as ScriptObject, None, None, None, -1, -1, -1, -1, True)
EndFunction

Function RegisterForTestBE(spaceshipreference testBEShipRef)
  Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_BEStarted")
EndFunction

Function TestCastSpell(Int spellID)
  Actor caster = LC165TestStarbornCaster.GetActorRef()
  Self.RegisterForRemoteEvent(caster as ScriptObject, "OnSpellCast")
  caster.SetValue(LC165_StarbornStateValue, spellID as Float)
  caster.EvaluatePackage(False)
EndFunction

Event ObjectReference.OnSpellCast(ObjectReference akSource, Form akSpell)
  Int spellID = akSource.GetValue(LC165_StarbornStateValue) as Int
  If spellID == 1
    LC165_Starborn_Bridge_GravityWell.Cast(akSource, akSource.GetLinkedRef(LinkCustom01))
  ElseIf spellID == 2
    AIPower_VoidForm.Cast(akSource, akSource)
  ElseIf spellID == 3
    akSource.AddSpell(LC165_Scripted_VoidFormAb, True)
  EndIf
  akSource.SetValue(LC165_StarbornStateValue, 0.0)
  (akSource as Actor).EvaluatePackage(False)
EndEvent

Function SetVariable(String name, Float value)
  TestPlatformHelperRef.SetAnimationVariableFloat(name, value)
EndFunction

Function PlayAnimation(String name)
  TestPlatformHelperRef.PlayAnimation(name)
EndFunction

Function BreakPipes()
  ObjectReference[] pipes = PipeTraps.GetArray()
  Int I = 0
  While I < pipes.Length
    trappipespray pipe = pipes[I] as trappipespray
    If pipe != None
      pipe.BreakPipe()
    EndIf
    I += 1
  EndWhile
EndFunction

Function SetTestDisembarking02Inaccessible(Bool shouldBeInaccessible)
  TestDisembarking02.SetExteriorLoadDoorInaccessible(shouldBeInaccessible)
EndFunction

Function DuplicatePlayer()
  temp = Game.GetPlayer().PlaceDuplicateActorAtMe(Game.GetPlayer(), False, False, True, None, None, True)
  temp.RemoveFromAllFactions()
  temp.AddToFaction(LC165StarbornEnemyFaction)
  temp.SetValue(Aggression, 2.0)
  temp.SetValue(Confidence, 4.0)
  temp.SetGroupFaction(None)
  temp.StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function ForceAddSpell()
  LC165TestStarbornCaster.GetActorRef().AddSpell(TestSteveCStarbornCasterScriptedSpell, True)
EndFunction

Function TestGivingFood()
  Actor testActor = TestDialogueBugs2Actor.GetActorRef()
  Self.RegisterForRemoteEvent(testActor as ScriptObject, "OnItemAdded")
  testActor.OpenOneWayTransferMenu(True, FilterList_InventoryCategoryAidFood)
EndFunction

Event ObjectReference.OnItemAdded(ObjectReference akSource, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  Self.SetStage(600)
EndEvent

Event ObjectReference.OnCellDetach(ObjectReference akSource)
  akSource.SetOpen(False)
EndEvent

Function ClearDialogueBugsActorAlias()
  TestDialogueBugs2Actor.Clear()
EndFunction

Function TestLOSToPlayer(Actor source)
  Int I = 0
  While I < 500
    Utility.Wait(0.5)
    I += 1
  EndWhile
EndFunction

Function TestArrays()
  Int[] testArray = new Int[1]
  testArray[0] = 591
  Int[] test2 = testArray
  testArray[0] = 592
  Int[] test3 = testArray
EndFunction

Function TestSnap(ObjectReference target)
  Game.GetPlayer().SnapIntoInteraction(target)
EndFunction

Function TestActivate(ObjectReference target)
  Game.GetPlayer().Activate(target, False)
EndFunction

Function TestOpen(ObjectReference target)
  target.SetOpen(True)
EndFunction

Function TestSnap2(ObjectReference target)
  target.Disable(False)
  target.Enable(False)
  Game.GetPlayer().SnapIntoInteraction(target)
EndFunction

Event ReferenceAlias.OnLoad(ReferenceAlias source)
  If source == TestSwapActor01
    Self.StartTimer(CONST_TestSwapTimerDelay as Float, CONST_TestSwapTimerID)
  EndIf
EndEvent

Function TestSwap()
  Actor testSwapActor01Ref = TestSwapActor01.GetActorRef()
  Actor testSwapActor02Ref = TestSwapActor02.GetActorRef()
  testSwapActor01Ref.RemoveSpell(LC165_AbTeleportSwapIn)
  testSwapActor02Ref.RemoveSpell(LC165_AbTeleportSwapIn)
  ObjectReference swapMarker1 = testSwapActor01Ref.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True)
  ObjectReference swapMarker2 = testSwapActor02Ref.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True)
  swapMarker1.PlaceAtMe(LC165_StarbornTeleportSwapExplosion as Form, 1, False, False, True, None, None, True)
  Self.TeleportIn(testSwapActor01Ref, LC165_AbTeleportSwapIn, None, None)
  Self.TeleportIn(testSwapActor02Ref, LC165_AbTeleportSwapIn, None, None)
  testSwapActor01Ref.MoveTo(swapMarker2, 0.0, 0.0, 0.0, True, False)
  testSwapActor02Ref.MoveTo(swapMarker1, 0.0, 0.0, 0.0, True, False)
  swapMarker1.Delete()
  swapMarker2.Delete()
EndFunction

Function TeleportIn(Actor target, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell)
  If target != None
    If teleportInSpell == None
      teleportInSpell = LC165_AbTeleportSwapIn
    EndIf
    If teleportOutSpell == None
      teleportOutSpell = LC165_AbTeleportSwapOut
    EndIf
    If teleportInExplosion != None
      target.PlaceAtMe(teleportInExplosion as Form, 1, False, False, True, None, None, True)
    EndIf
    target.RemoveSpell(teleportOutSpell)
    target.AddSpell(teleportInSpell, True)
  EndIf
EndFunction

Function TeleportOut(Actor target, Spell teleportInSpell, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay, Bool shouldDisable)
  If target != None
    If teleportInSpell == None
      teleportInSpell = LC165_AbTeleportSwapIn
    EndIf
    If teleportOutSpell == None
      teleportOutSpell = LC165_AbTeleportSwapOut
    EndIf
    If teleportOutExplosion != None
      target.PlaceAtMe(teleportOutExplosion as Form, 1, False, False, True, None, None, True)
    EndIf
    target.RemoveSpell(teleportInSpell)
    target.AddSpell(teleportOutSpell, True)
    Utility.Wait(teleportOutSpellDelay)
    If shouldDisable
      target.Disable(False)
    EndIf
  EndIf
EndFunction

Function CombatTeleportNearRef(Actor actorToTeleport, ObjectReference sourceRef, Float minDistance, Float maxDistance, Bool allowZOffset, Bool alwaysInFront, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  If !actorToTeleport.IsDead()
    Float[] akOffsets = new Float[3]
    ObjectReference target = sourceRef.PlaceAtMe(XMarker as Form, 1, False, False, True, akOffsets, None, True)
    If minDistance > 0.0 || maxDistance > 0.0
      target.MoveToNearestNavmeshLocation()
    EndIf
    Self.CombatTeleport(actorToTeleport, target, False, teleportInSpell, teleportInExplosion, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay)
    target.Delete()
  EndIf
EndFunction

Function CombatTeleport(Actor actorToTeleport, ObjectReference target, Bool shouldBeInvisibleAfterTeleport, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  Self.TeleportOut(actorToTeleport, teleportInSpell, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay, False)
  actorToTeleport.MoveTo(target, 0.0, 0.0, 0.0, True, False)
  Self.TeleportIn(actorToTeleport, teleportInSpell, teleportInExplosion, teleportOutSpell)
EndFunction

;-- State -------------------------------------------
State Busy

  Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
    ; Empty function
  EndEvent

  Event OnBeginState(String oldState)
    ; Empty function
  EndEvent

  Event OnEndState(String newState)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
    Self.GoToState("Busy")
    If akSource == TestSteveCBossChest
      TestSteveCOnActivateEventMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    ElseIf akSource == TestSteveCAmbushLeverRef
      If TestSteveCAmbushMarkerRef.IsDisabled()
        TestSteveCAmbushMarkerRef.Enable(False)
      Else
        TestSteveCAmbushMarkerRef.Disable(False)
      EndIf
    Else
      If TestActivators.Find(akSource) >= 0
        TestActivators.RemoveRef(akSource)
        currentActivatorCount += 1
      Else
        TestActivators.AddRef(akSource)
        currentActivatorCount -= 1
      EndIf
      Self.UpdateActivatorCount()
    EndIf
    Utility.Wait(5.0)
    Self.GoToState("Waiting")
  EndEvent
EndState
