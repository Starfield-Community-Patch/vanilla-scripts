ScriptName BEDebugScript Extends Quest
{ Quest script for BEDebug, the Boarding Encounter Debug quest. }

;-- Variables ---------------------------------------
Bool skipInstantBoardingAfterDocking
spaceshipreference testShip
bescript testShipQuest
spaceshipreference testShipWaitingForBE

;-- Properties --------------------------------------
Group QuestProperties collapsedonbase
  sq_parentscript Property SQ_Parent Auto Const mandatory
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  LocationAlias Property PlayerShipInteriorLocation Auto Const mandatory
  ReferenceAlias Property PlayerShipPilotSeat Auto Const mandatory
  ReferenceAlias Property Companion Auto Const mandatory
  GlobalVariable Property BEChanceMainGlobal Auto Const mandatory
  GlobalVariable Property BEChanceDerelictGlobal Auto Const mandatory
  ObjectReference Property NewAtlantisShipLandingMarker Auto Const mandatory
  ActorValue Property ShipSystemEngineHealth Auto Const mandatory
  Keyword Property CurrentInteractionLinkedRefKeyword Auto Const mandatory
  ReferenceAlias Property TestCreatedShip Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function TestBE(String testBEQuestName, spaceshipbase testBEShip, Bool skipInstantBoarding)
  Self.Start()
  If testBEQuestName == ""
    Return 
  EndIf
  SQ_Parent.SendBEForceStopEvent()
  While testShipQuest != None && testShipQuest.IsRunning()
    Utility.Wait(0.100000001)
  EndWhile
  BEChanceMainGlobal.SetValue(100.0)
  BEChanceDerelictGlobal.SetValue(100.0)
  Actor player = Game.GetPlayer()
  ObjectReference playerShipPilotSeatRef = PlayerShipPilotSeat.GetRef()
  Location playerShipInteriorLoc = PlayerShipInteriorLocation.GetLocation()
  If playerShipInteriorLoc == None || playerShipPilotSeatRef == None
    
  Else
    If player.GetCurrentLocation() == playerShipInteriorLoc
      
    Else
      player.MoveTo(playerShipPilotSeatRef, 0.0, 0.0, 0.0, True, False)
    EndIf
    testShipWaitingForBE = Self.TestBESpawn(testBEShip)
    If testShipWaitingForBE == None
      
    Else
      Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_BEStarted")
      skipInstantBoardingAfterDocking = skipInstantBoarding
      PlayerShip.GetShipRef().InstantDock(testShipWaitingForBE as ObjectReference)
    EndIf
  EndIf
EndFunction

spaceshipreference Function TestBESpawn(spaceshipbase testBEShip)
  If testBEShip == None
    
  Else
    spaceshipreference playerShipRef = PlayerShip.GetShipRef()
    If playerShipRef == None
      
    Else
      If playerShipRef.IsDocked()
        playerShipRef.InstantUndock()
      EndIf
      If testShip != None
        testShip.Disable(False)
        testShip.Delete()
      EndIf
      If testShipWaitingForBE != None
        testShipWaitingForBE.Disable(False)
        testShipWaitingForBE.Delete()
      EndIf
      Float[] offsets = new Float[6]
      offsets[1] = 250.0
      testShip = PlayerShip.GetRef().PlaceShipAtMe(testBEShip as Form, 4, False, False, False, True, offsets, None, None, True)
      testShip.EnablePartRepair(ShipSystemEngineHealth, False)
      testShip.DamageValue(ShipSystemEngineHealth, 100000.0)
      testShip.WaitFor3DLoad()
      Return testShip
    EndIf
  EndIf
EndFunction

Event SQ_ParentScript.SQ_BEStarted(sq_parentscript akSender, Var[] akArgs)
  spaceshipreference enemyShip = akArgs[0] as spaceshipreference
  bescript enemyShipBEQuest = akArgs[1] as bescript
  If enemyShip == testShipWaitingForBE
    testShipQuest = enemyShipBEQuest
    testShipWaitingForBE = None
    If skipInstantBoardingAfterDocking
      
    Else
      Self.TestBEInstantBoard(enemyShip, enemyShipBEQuest)
    EndIf
  EndIf
EndEvent

Function TestBEInstantBoard(spaceshipreference enemyShip, bescript enemyShipBEQuest)
  ObjectReference loadMarker = enemyShipBEQuest.GetEnemyShipLoadDoorMarker()
  Actor player = Game.GetPlayer()
  player.MoveTo(loadMarker, 0.0, 0.0, 0.0, True, False)
  Actor companionRef = Companion.GetActorRef()
  If companionRef != None
    companionRef.MoveTo(player as ObjectReference, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function TestBEUndock()
  PlayerShip.GetShipRef().InstantUndock()
EndFunction

ObjectReference Function TestSpawnShip(Form testObject)
  If testObject == None
    
  Else
    spaceshipreference playerShipRef = PlayerShip.GetShipRef()
    If playerShipRef == None
      
    Else
      Float[] offsets = new Float[6]
      offsets[1] = 250.0
      testShip = PlayerShip.GetRef().PlaceShipAtMe(testObject, 4, True, False, False, True, offsets, None, None, True)
      TestCreatedShip.ForceRefTo(testShip as ObjectReference)
    EndIf
  EndIf
EndFunction

Function SetHomeShip(Form newShipBase)
  spaceshipreference oldPlayerShipRef = PlayerShip.GetShipRef()
  oldPlayerShipRef.Disable(False)
  spaceshipreference newPlayerShipRef = NewAtlantisShipLandingMarker.PlaceShipAtMe(newShipBase, 4, False, False, True, True, None, None, None, True)
  SQ_PlayerShip.ResetHomeShip(newPlayerShipRef)
  newPlayerShipRef.SetLinkedRef(NewAtlantisShipLandingMarker, CurrentInteractionLinkedRefKeyword, True)
  newPlayerShipRef.Enable(False)
EndFunction
