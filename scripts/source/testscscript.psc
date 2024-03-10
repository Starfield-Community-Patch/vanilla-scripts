ScriptName TestSCScript Extends Quest
{ Quest script for TestSC, the Test Space Combat quest. }

;-- Variables ---------------------------------------
Actor player
Int pridEnemyIndex
Bool waitingForPlayerToSit

;-- Properties --------------------------------------
Group QuestProperties
  Int Property TestDefaultPlayerLevel = 35 Auto Const
  { DEFAULT=35. When running test commands, if no level is specified, set the player to this level. }
  spaceshipbase[] Property TestPlayerShips Auto Const mandatory
  { Array of potential player test ships. }
  Int Property TestDefaultEnemyShipSpawnDistance = 700 Auto Const
  { Default=500. When running test commands, if spawning an enemy ship, and no distance is specified, spawn the ship(s) at this distance from the player. }
  Int Property TestDefaultEnemyShipLevelMod = 3 Auto Const
  { Default=3, Hard, player level. When running test commands, if spawning an enemy ship, and no level mod is specified, spawn the ship(s) with this level mod. }
  spaceshipbase[] Property TestEnemyShips Auto Const mandatory
  { Array of potential enemy test ships. }
  Cell[] Property TestEnemySpaceCells Auto Const mandatory
  { Array of potential enemy ship space cells. }
EndGroup

Group AutofillProperties
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property PlayerShipPilotSeat Auto Const mandatory
  ReferenceAlias Property TestSpaceCombatStartMarker Auto Const mandatory
  RefCollectionAlias Property EnemyShips Auto Const mandatory
  ActorValue Property Experience Auto Const mandatory
  ObjectReference Property CTestCOCMarkerRef Auto Const mandatory
  ObjectReference Property NewGameShipMarkerRef Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function TracePlayer()
  ; Empty function
EndFunction

Event OnQuestInit()
  player = Game.GetPlayer()
EndEvent

Event Actor.OnSit(Actor akSource, ObjectReference akFurniture)
  waitingForPlayerToSit = False
EndEvent

Function SetLevel(Int level)
  If level <= 0
    level = TestDefaultPlayerLevel
  EndIf
  Int currentLevel = Game.GetPlayerLevel()
  If currentLevel < level
    Float currentXP = Game.GetXPForLevel(currentLevel) as Float
    Float targetXP = Game.GetXPForLevel(level) as Float
    player.SetValue(Experience, targetXP - currentXP)
    Utility.Wait(1.0)
  ElseIf currentLevel > level
    
  EndIf
EndFunction

Function SetShipIfNeeded(Int shipID)
  If PlayerShip.GetShipRef() == None
    Self.SetShip(shipID)
  EndIf
EndFunction

Function SetShip(Int shipID)
  If shipID >= 0 && shipID < TestPlayerShips.Length
    Self.SetShipBase(TestPlayerShips[shipID])
  EndIf
EndFunction

Function SetShipBase(spaceshipbase shipBase)
  spaceshipreference oldShip = PlayerShip.GetShipRef()
  If oldShip != None
    PlayerShipPilotSeat.GetRef().Activate(player as ObjectReference, False)
    Utility.Wait(1.0)
    player.MoveTo(CTestCOCMarkerRef, 0.0, 0.0, 0.0, True, False)
    oldShip.DisableNoWait(False)
    oldShip.Delete()
  EndIf
  spaceshipreference newShip = NewGameShipMarkerRef.PlaceShipAtMe(shipBase as Form, 4, True, False, False, True, None, None, None, True)
  SQ_PlayerShip.ResetPlayerShip(newShip)
  SQ_PlayerShip.ResetHomeShip(newShip)
  inputenablelayer myEnableLayer = inputenablelayer.Create()
  myEnableLayer.DisablePlayerControls(True, True, True, False, False, True, True, False, True, True, False)
  player.MoveTo(newShip as ObjectReference, 0.0, 0.0, 0.0, True, False)
  SQ_PlayerShip.HandleShipTakeOff(True, False)
  PlayerShipPilotSeat.GetRef().Activate(player as ObjectReference, False)
  myEnableLayer.Delete()
  waitingForPlayerToSit = True
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnSit")
  While waitingForPlayerToSit
    Utility.Wait(0.5)
  EndWhile
  newShip.MoveTo(TestSpaceCombatStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function SpawnEnemy(Int enemyID, Int count, Int distance, Int levelMod, Bool shouldNotDeleteEnemies)
  Self.SetLevel(-1)
  Self.SetShipIfNeeded(0)
  If enemyID < 0 || enemyID >= TestEnemyShips.Length
    
  Else
    If !shouldNotDeleteEnemies
      Self.DeleteEnemies()
    EndIf
    If count <= 0
      count = 1
    EndIf
    If distance <= 0
      distance = TestDefaultEnemyShipSpawnDistance
    EndIf
    If levelMod <= 0
      levelMod = TestDefaultEnemyShipLevelMod
    EndIf
    levelMod -= 1
    spaceshipreference playerShipRef = PlayerShip.GetShipRef()
    Float[] offsets = new Float[6]
    offsets[1] = distance as Float
    offsets[5] = 180.0
    Int I = 0
    While I < count
      offsets[0] = (I * 125) as Float
      spaceshipreference newEnemyShip = playerShipRef.PlaceShipAtMe(TestEnemyShips[enemyID] as Form, levelMod, False, False, False, True, offsets, None, None, True)
      EnemyShips.AddRef(newEnemyShip as ObjectReference)
      I += 1
    EndWhile
  EndIf
EndFunction

Function SpawnEnemyCell(Int cellID, Bool shouldNotDeleteEnemies)
  If cellID >= 0 && cellID < TestEnemySpaceCells.Length
    Self.SpawnEnemyCellName(TestEnemySpaceCells[cellID], shouldNotDeleteEnemies)
  EndIf
EndFunction

Function SpawnEnemyCellName(Cell cellToPlace, Bool shouldNotDeleteEnemies)
  Self.SetLevel(-1)
  Self.SetShipIfNeeded(0)
  If !shouldNotDeleteEnemies
    Self.DeleteEnemies()
  EndIf
  spaceshipreference playerShipRef = PlayerShip.GetShipRef()
  playerShipRef.PlaceCellAtMe(cellToPlace, EnemyShips, False, True, False, None)
  spaceshipreference[] enemyShipRefs = EnemyShips.GetArray() as spaceshipreference[]
  If enemyShipRefs != None
    Int I = 0
    While I < enemyShipRefs.Length
      I += 1
    EndWhile
  EndIf
EndFunction

Function DeleteEnemies()
  spaceshipreference[] enemyShipRefs = EnemyShips.GetArray() as spaceshipreference[]
  If enemyShipRefs != None
    Int I = 0
    While I < enemyShipRefs.Length
      spaceshipreference current = enemyShipRefs[I]
      EnemyShips.RemoveRef(enemyShipRefs[I] as ObjectReference)
      enemyShipRefs[I].DisableNoWait(False)
      enemyShipRefs[I].Delete()
      I += 1
    EndWhile
  EndIf
EndFunction

Function ResetPosition()
  PlayerShip.GetRef().MoveTo(TestSpaceCombatStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function ResetAll()
  Self.DeleteEnemies()
  Self.ResetPosition()
EndFunction

Function TraceEnemies()
  Int enemyShipCount = EnemyShips.GetCount()
  If enemyShipCount == 0
    
  Else
    spaceshipreference[] enemyShipRefs = EnemyShips.GetArray() as spaceshipreference[]
    Int I = 0
    While I < enemyShipRefs.Length
      I += 1
    EndWhile
  EndIf
EndFunction
