ScriptName UCR03QuestScript Extends Quest conditional

;-- Structs -----------------------------------------
Struct EnemyShipDatum
  spaceshipbase ShipToSpawn
  { Leveled list we want to spawn }
  GlobalVariable MinEnemies
  { Minimum number of enemy ships to spawn }
  GlobalVariable MaxEnemies
  { Maximum number of enemy ships to spawn }
  Int DialogueIndex = -1
  { This enemy type's dialogue index (if we end up writing custom dialogue per enemy type) }
  Faction BlockingFaction
  { If the player has this faction, don't chose this group }
EndStruct


;-- Variables ---------------------------------------
Int iFailSafeLoops = 20 Const

;-- Properties --------------------------------------
ucr03questscript:enemyshipdatum[] Property EnemyShipData Auto mandatory
{ Collection of data to determine which enemy ships we're spawning }
GlobalVariable Property UCR03_MostRecentEnemyType Auto Const mandatory
{ Global used to prevent the player from getting the same enemy type over and over }
GlobalVariable Property UCR03_SpawnDistanceOffset Auto Const mandatory
{ Global containing the standard offset for spawning in the enemies for this quest }
ReferenceAlias Property GeneralMarker Auto Const mandatory
{ Alias of the general marker in the space (around which all the NPCs will be spawned) }
RefCollectionAlias Property Enemies Auto Const mandatory
{ Holding collection for spawned opponents }
ReferenceAlias Property PatrolingEnemy Auto Const mandatory
{ Alias to give at least one of the ship a patrol }
ReferenceAlias Property PlayerShip Auto Const mandatory
{ Ref alias to the player's current ship }
ActorValue Property Aggression Auto Const mandatory
{ Aggression actor value (to ensure all these enemies are always out for blood) }
Float Property DebugShipSpawnOffset = 250.0 Auto Const
{ Offset used to make sure the spawned enemy ships don't spawn right on the player }
Int Property EnemyIndex Auto
{ Index to know which enemy type we've gotten }
Int Property EnemyDialogueIndex = -1 Auto conditional
{ Index used to keep track of Tuala's custom lines }
Int Property OffsetDistanceZ = 300 Auto Const
{ How much we want to offset each ship from its peers as we spawn them in on the Z axis }
Int Property OffsetDistanceY = 100 Auto Const
{ How much we want to offset each ship from its peers as we spawn them in on the Y axis }
Int Property OffsetRandomizer = 30 Auto Const
{ Rnadomizer number added to the offsets so they don't all look so uniform }

;-- Functions ---------------------------------------

Function SelectEnemySeed()
  Int iMostRecentEnemy = UCR03_MostRecentEnemyType.GetValueInt()
  Int iRandomSeed = 0
  Int I = 0
  Bool bFoundEnemy = False
  While !bFoundEnemy && I < iFailSafeLoops
    Int iRandMax = EnemyShipData.Length - 1
    iRandomSeed = Utility.RandomInt(0, iRandMax)
    ucr03questscript:enemyshipdatum currDatum = EnemyShipData[iRandomSeed]
    If currDatum.BlockingFaction != None && Game.GetPlayer().IsInFaction(currDatum.BlockingFaction)
      EnemyShipData.remove(iRandomSeed, 1)
    ElseIf iRandomSeed != iMostRecentEnemy
      bFoundEnemy = True
      EnemyDialogueIndex = currDatum.DialogueIndex
      EnemyIndex = iRandomSeed
    EndIf
    I += 1
  EndWhile
EndFunction

Function SpawnEnemies(Bool bSpawnAtPlayer)
  Int iDatumIndex = EnemyIndex
  If iDatumIndex < 0 || iDatumIndex >= EnemyShipData.Length
    iDatumIndex = 0
  EndIf
  ucr03questscript:enemyshipdatum currEnemy = EnemyShipData[iDatumIndex]
  Int iNumEnemiesToSpawn = Utility.RandomInt(currEnemy.MinEnemies.GetValueInt(), currEnemy.MaxEnemies.GetValueInt())
  Int I = 0
  While I < iNumEnemiesToSpawn
    ObjectReference currSpawn = GeneralMarker.GetRef()
    Float[] offsets = new Float[6]
    If !bSpawnAtPlayer
      Int iRandY = Utility.RandomInt(0, 2)
      Int iRandomizer = Utility.RandomInt(0, 2)
      Int iRandomizerValue = 0
      If iRandomizer < 1
        iRandomizerValue = OffsetRandomizer
      ElseIf iRandomizer == 1
        iRandomizerValue = OffsetRandomizer * -1
      Else
        iRandomizerValue = 0
      EndIf
      If iRandY < 1
        offsets[0] = (OffsetDistanceY + iRandomizerValue) as Float
      ElseIf iRandY == 1
        offsets[0] = (OffsetDistanceY * -1 + iRandomizerValue) as Float
      Else
        offsets[0] = (OffsetDistanceY * (I + iNumEnemiesToSpawn) + iRandomizerValue) as Float
      EndIf
      offsets[1] = (UCR03_SpawnDistanceOffset.GetValueInt() + iRandomizer) as Float
    Else
      offsets[1] = DebugShipSpawnOffset
      currSpawn = PlayerShip.GetRef()
    EndIf
    spaceshipreference newShip = currSpawn.PlaceShipAtMe(currEnemy.ShipToSpawn as Form, 4, True, False, False, True, offsets, None, None, True)
    Enemies.AddRef(newShip as ObjectReference)
    newShip.SetValue(Aggression, 2.0)
    If PatrolingEnemy.GetRef() == None
      PatrolingEnemy.ForceRefTo(newShip as ObjectReference)
    EndIf
    I += 1
  EndWhile
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
