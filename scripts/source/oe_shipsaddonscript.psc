ScriptName OE_ShipsAddonScript Extends Quest
{ Must be used with OEScript. }

;-- Structs -----------------------------------------
Struct LandingMarkerDatum
  ReferenceAlias LandingMarkerAlias hidden
  { Filled by script. TODO: GEN-341055 Hidden Struct Members Remain Visible. }
  ObjectReference LandingMarkerREF hidden
  { Filled by script. TODO: GEN-341055 Hidden Struct Members Remain Visible. }
  ReferenceAlias LandedShipAlias hidden
  { Filled by script. TODO: GEN-341055 Hidden Struct Members Remain Visible. }
  Int ShipDatumIndex = -1 hidden
  { Filled by script. TODO: GEN-341055 Hidden Struct Members Remain Visible. }
EndStruct

Struct ShipDatum
  spaceshipbase ShipToSpawn
  { SpaceshipBase may be templated to a leveled list of ships. If blank, will attempt to get ship from DefaultGroupSpawnQuestScript. }
  Int SpawnGroupID = 0
  { if ShipToSpawn is blank, use this groupID to get a ship from DefaultGroupSpawnQuestScript. }
  GlobalVariable SpawnGroupShipType
  { can be used to specify a specific type of ship from DefaultGroupSpawnQuestScript.
        Filter on SQ_Group_SpawnType_Ship* }
  conditionform SpawnConditions
  { Conditions must be True at the time of spawning for the ship to spawn. }
  conditionform LaunchConditions
  { If blank, ship will launch when LaunchShip() is called. If filled, when LaunchShip() is called, the ship's LaunchConditions must also be met. }
  Int ShipLevelMod = 1
  { Default=1 (Medium). The aiLevelMod of the spawned spaceship; 0=Easy, 1=Medium, 2=Hard, 3=Boss. }
  Bool TryToStartLanded = False
  { DEFAULT=False. 
        Spaceship starts the quest while landed, if a marker exists. 
        When markers are exhausted, ships may still spawn and land later, if it works out.
        These are considered in order of top to bottom, so the last Ship with this set to True gets whatever marker is left, if any. }
  GlobalVariable LockLevel
  { Filter for: LockLevel_* }
  ReferenceAlias ShipOwner
  { if ShipOwner will be used to set ownership on the ship and doors }
  Faction ShipFaction
  { if ShipOwner is not set, ShipFaction will be used to set ownership on the ship and doors }
  Bool hasLanded = False hidden
  { Set by the Script, do not alter. TODO: GEN-341055 Hidden Struct Members Remain Visible. }
  spaceshipreference SpaceshipREF hidden
  { Set by the Script, do not alter. TODO: GEN-341055 Hidden Struct Members Remain Visible. }
  ObjectReference LandingMarkerREF hidden
  { Set by the Script, do not alter. TODO: GEN-341055 Hidden Struct Members Remain Visible. }
  Int StageToSetOnLanding = -1
  { set this stage when this ship lands }
  Int StageToSetOnTakeoff = -1
  { set this stage when this ship takes off }
  Int StageToSetOnPlayerBoarding = -1
  { set this stage when this ship is boarded by the player }
  Bool StopQuestIfPlayerHomeShip = True
  { if true, stop my quest if this ship becomes the player's home ship (meaning they stole it) }
EndStruct


;-- Variables ---------------------------------------
oe_shipsaddonscript:landingmarkerdatum[] LandingMarkerData
Actor PlayerREF
spaceshipreference[] gLandedShipRefsArray
Int[] gLandingShipsArray
Int[] gStartLandedShipsArray
Bool gbEnableShips = False
Bool gbStartLandedMode = True
Bool initialized = False

;-- Properties --------------------------------------
Group Ships
  oe_shipsaddonscript:shipdatum[] Property ShipData Auto
  { These ships are eligible to start landed or land during the encounter. }
  Bool Property TryToUseAllStartLandedShips = True Auto Const
  { DEFAULT=True. If there are more ships with TryToStartLanded=True than Landing Markers, the ships not selected to Start Landed will be available to 
        land later unless this is marked as False. Ships will still need to pass the conditions to land later. }
  Bool Property RandomizeStartLandedShips = True Auto Const
  { DEFAULT=True. If multiple ships are set to TryToStartLanded=True then pick from the TryToStartLanded ships with true conditions randomly until there
        are no more Landing Markers. 
        FALSE=Picks in the order that they are entered into the array, if conditions are met. }
  Bool Property RandomizeLandingShips = True Auto Const
  { DEFAULT=TRUE. When ships land after the start of the quest, any available ship that hasn't already landed is eligible to land.
        FALSE=Selects the next landing ship in order in the array, if conditions are met. }
  Int Property minShipsStartLanded = 1 Auto
  { Minimum number of ships to Start Landed. Ships must exist with the TryToStartLanded flag set to True to be eligible.
    If 2 ships are desired, set min and max to 2. }
  Int Property maxShipsStartLanded = 3 Auto
  { This is how many ships will start landed, at max. Ships must exist with the TryToStartLanded flag set to True to be eligible. }
EndGroup

Group AutofillProperties
  ReferenceAlias Property Marker_ShipLandingA Auto Const mandatory
  ReferenceAlias Property Marker_ShipLandingB Auto Const
  ReferenceAlias Property Marker_ShipLandingC Auto Const
  ReferenceAlias Property ShipA Auto Const
  ReferenceAlias Property ShipB Auto Const
  ReferenceAlias Property ShipC Auto Const
  Keyword Property LandingZoneTriggerKeyword Auto Const mandatory
  Keyword Property OEShipStartsLandedKeyword Auto Const mandatory
  Keyword Property OELinkLandingMarkerKeyword Auto Const mandatory
  Keyword Property SpaceshipLinkedInterior Auto Const mandatory
  GlobalVariable Property LockLevel_Inaccessible Auto Const mandatory
  GlobalVariable Property LockLevel_Master Auto Const mandatory
  GlobalVariable Property LockLevel_Expert Auto Const mandatory
  GlobalVariable Property LockLevel_Advanced Auto Const mandatory
  GlobalVariable Property LockLevel_Novice Auto Const mandatory
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
EndGroup

String Property LocalScriptName = "OE_ShipsAddonScript" Auto Const
{ Name of the local script. Don't modify. }
String Property MainLogName = "OE" Auto Const hidden
{ OPTIONAL: Modify with your specific OE Name, if desired. This is the name of your log in Genesis\Build\PC\Logs\Script\User }
String Property SubLogName = "Ships" Auto Const hidden
{ OPTIONAL: Leave as Warnings -- this appends to the MainLogName with its own file for serious issues. }

;-- Functions ---------------------------------------

Event OnQuestStarted()
  String FunctionName = "OnQuestStarted()"
  PlayerREF = Game.GetPlayer()
  gStartLandedShipsArray = new Int[0]
  gLandingShipsArray = new Int[0]
  gLandedShipRefsArray = new spaceshipreference[ShipData.Length]
  gbStartLandedMode = True
  gbEnableShips = False
  LandingMarkerData = new oe_shipsaddonscript:landingmarkerdatum[0]
  gbEnableShips = Self.ErrorCheck()
  Self.SetupLandingMarkers()
  Self.SetupStartLandedShips()
  Self.SetupLandingShips()
  Self.SpawnStartLandedShips()
  initialized = True
EndEvent

Bool Function ErrorCheck()
  String FunctionName = "ErrorCheck()"
  Int ShipDataIndex = 0
  Int enabledMarkers = 0
  Int numShips = 0
  Int index = 0
  If ShipData.Length <= 0
    Return False
  Else
    If ShipA != None
      ShipA.Clear()
    EndIf
    If ShipB != None
      ShipB.Clear()
    EndIf
    If ShipC != None
      ShipC.Clear()
    EndIf
    If Marker_ShipLandingA != None && Marker_ShipLandingA.GetRef() != None
      enabledMarkers += 1
    EndIf
    If Marker_ShipLandingB != None && Marker_ShipLandingB.GetRef() != None
      enabledMarkers += 1
    EndIf
    If Marker_ShipLandingC != None && Marker_ShipLandingC.GetRef() != None
      enabledMarkers += 1
    EndIf
    If enabledMarkers == 0
      Return False
    EndIf
    numShips = ShipData.Length
    If numShips < 1
      Return False
    EndIf
    defaultgroupspawnquestscript myGroupSpawnQuest = (Self as Quest) as defaultgroupspawnquestscript
    While ShipDataIndex < numShips
      oe_shipsaddonscript:shipdatum theShipDatum = ShipData[ShipDataIndex]
      If theShipDatum.hasLanded
        theShipDatum.hasLanded = False
      EndIf
      If (myGroupSpawnQuest as Bool && theShipDatum.ShipFaction == None) && theShipDatum.ShipOwner == None
        theShipDatum.ShipFaction = myGroupSpawnQuest.GetGroupOwnershipFaction(theShipDatum.SpawnGroupID)
      EndIf
      ShipDataIndex += 1
    EndWhile
    Self._ResetLandingMarkers()
  EndIf
  Return True
EndFunction

Function SetupLandingMarkers()
  String FunctionName = "SetupLandingMarkers()"
  Bool MarkerStatus = False
  If !gbEnableShips
    Return 
  EndIf
  Self._SetupLandingMarker(Marker_ShipLandingA, ShipA)
  Self._SetupLandingMarker(Marker_ShipLandingB, ShipB)
  Self._SetupLandingMarker(Marker_ShipLandingC, ShipC)
  If LandingMarkerData.Length > 0
    MarkerStatus = True
    minShipsStartLanded = Math.Clamp(minShipsStartLanded as Float, 0.0, LandingMarkerData.Length as Float) as Int
    maxShipsStartLanded = Math.Clamp(maxShipsStartLanded as Float, 0.0, LandingMarkerData.Length as Float) as Int
  EndIf
  If MarkerStatus
    
  EndIf
  gbEnableShips = MarkerStatus
EndFunction

Function _SetupLandingMarker(ReferenceAlias akRefAlias, ReferenceAlias akShipAlias)
  If akRefAlias as Bool && akRefAlias.GetRef() as Bool
    oe_shipsaddonscript:landingmarkerdatum temp = new oe_shipsaddonscript:landingmarkerdatum
    temp.LandingMarkerAlias = akRefAlias
    temp.LandedShipAlias = akShipAlias
    LandingMarkerData.add(temp, 1)
  EndIf
EndFunction

Function SetupStartLandedShips()
  String FunctionName = "SetupStartLandedShips()"
  Int[] allStartLandedShips = new Int[0]
  Bool enableStartLandedMode = True
  Int allowedLandingMarkers = 0
  Int StartLandedShipsIndex = 0
  Int ShipDataIndex = 0
  Int index = 0
  If !gbEnableShips
    Return 
  EndIf
  allStartLandedShips = Self._GetAllStartLandedShips()
  allowedLandingMarkers = Utility.RandomInt(minShipsStartLanded, maxShipsStartLanded)
  If !gbStartLandedMode
    Return 
  EndIf
  If allStartLandedShips.Length < 1
    
  ElseIf allowedLandingMarkers < 1
    While index < ShipData.Length
      If TryToUseAllStartLandedShips
        ShipData[index].TryToStartLanded = False
      EndIf
      index += 1
    EndWhile
  Else
    If allowedLandingMarkers < allStartLandedShips.Length
      While index < allStartLandedShips.Length && allowedLandingMarkers > 0
        If RandomizeStartLandedShips
          StartLandedShipsIndex = Utility.RandomInt(0, allStartLandedShips.Length - 1)
        Else
          StartLandedShipsIndex = index
        EndIf
        ShipDataIndex = allStartLandedShips[StartLandedShipsIndex]
        gStartLandedShipsArray.add(ShipDataIndex, 1)
        allStartLandedShips.remove(index, 1)
        allowedLandingMarkers -= 1
      EndWhile
    Else
      gStartLandedShipsArray = Self.CopyIntArray(allStartLandedShips, "gStartLandedShipsArray", "allStartLandedShips", FunctionName)
      allStartLandedShips.clear()
    EndIf
    If TryToUseAllStartLandedShips && allStartLandedShips.Length > 0
      While allStartLandedShips.Length > 0
        index = allStartLandedShips[0]
        ShipData[index].TryToStartLanded = False
        allStartLandedShips.remove(0, 1)
      EndWhile
    EndIf
    allStartLandedShips.clear()
  EndIf
EndFunction

Int[] Function _GetAllStartLandedShips()
  String FunctionName = "GetAllStartLandedShips()"
  Int[] potentialShips = new Int[0]
  Int index = 0
  While index < ShipData.Length
    If ShipData[index].TryToStartLanded
      If Self._CanShipLand(index)
        potentialShips.add(index, 1)
      ElseIf TryToUseAllStartLandedShips
        ShipData[index].TryToStartLanded = False
      EndIf
    EndIf
    index += 1
  EndWhile
  Return potentialShips
EndFunction

Function SetupLandingShips()
  String FunctionName = "SetupLandingShips()"
  Int ShipDataIndex = 0
  If !gbEnableShips
    Return 
  EndIf
  While ShipDataIndex < ShipData.Length
    Bool hasLanded = ShipData[ShipDataIndex].hasLanded
    Bool startsLanded = ShipData[ShipDataIndex].TryToStartLanded
    If !hasLanded && !startsLanded
      gLandingShipsArray.add(ShipDataIndex, 1)
    EndIf
    ShipDataIndex += 1
  EndWhile
EndFunction

spaceshipreference Function _LandSpecificShip(Int aiShipDataIndex)
  String FunctionName = "_LandSpecificShip()"
  landingzonetriggerscript TriggerREF = None
  ObjectReference LandingMarkerREF = None
  spaceshipreference SpaceshipREF = None
  Int ShipDataIndex = aiShipDataIndex
  spaceshipbase Spaceship = None
  Package RunningPackage = None
  ReferenceAlias ShipAlias = None
  Int LandingMarkerIndex = -1
  Int ShipLevelMod = 0
  LandingMarkerIndex = Self._GetLandingMarkerIndex(ShipDataIndex)
  If LandingMarkerIndex > -1
    LandingMarkerREF = LandingMarkerData[LandingMarkerIndex].LandingMarkerAlias.GetRef()
    TriggerREF = LandingMarkerREF.GetLinkedRef(LandingZoneTriggerKeyword) as landingzonetriggerscript
  Else
    Return None
  EndIf
  If LandingMarkerREF == None
    Return None
  EndIf
  If aiShipDataIndex > -1 && aiShipDataIndex < ShipData.Length
    oe_shipsaddonscript:shipdatum theShipDatum = ShipData[ShipDataIndex]
    If theShipDatum.ShipToSpawn == None
      defaultgroupspawnquestscript myGroupSpawnQuest = (Self as Quest) as defaultgroupspawnquestscript
      If myGroupSpawnQuest
        theShipDatum.ShipToSpawn = myGroupSpawnQuest.GetShipToSpawnForGroup(theShipDatum.SpawnGroupID, LandingMarkerREF, theShipDatum.SpawnGroupShipType)
      EndIf
    EndIf
    If theShipDatum.ShipToSpawn == None
      Return None
    EndIf
    Spaceship = theShipDatum.ShipToSpawn
    ShipLevelMod = theShipDatum.ShipLevelMod
    ShipAlias = LandingMarkerData[LandingMarkerIndex].LandedShipAlias
    If gbStartLandedMode
      SpaceshipREF = LandingMarkerREF.PlaceShipAtMe(Spaceship as Form, ShipLevelMod, False, False, True, True, None, ShipAlias as Alias, None, True)
      If SpaceshipREF
        SpaceshipREF.AddKeyword(OEShipStartsLandedKeyword)
      EndIf
    Else
      SpaceshipREF = LandingMarkerREF.PlaceShipAtMe(Spaceship as Form, ShipLevelMod, False, False, True, True, None, ShipAlias as Alias, None, True)
      If SpaceshipREF
        SpaceshipREF.RemoveKeyword(OEShipStartsLandedKeyword)
      EndIf
    EndIf
    If !SpaceshipREF
      Return None
    EndIf
    ShipAlias.RefillDependentAliases()
    LandingMarkerData[LandingMarkerIndex].LandingMarkerREF = LandingMarkerREF
    theShipDatum.SpaceshipREF = SpaceshipREF
    LandingMarkerREF.SetLinkedRef(SpaceshipREF as ObjectReference, OELinkLandingMarkerKeyword, False)
    SpaceshipREF.SetLinkedRef(LandingMarkerREF, OELinkLandingMarkerKeyword, False)
    If theShipDatum.StageToSetOnLanding > -1
      Self.RegisterForRemoteEvent(SpaceshipREF as ScriptObject, "OnShipLanding")
    EndIf
    If TriggerREF
      TriggerREF.BeginLanding(SpaceshipREF, LandingMarkerREF)
    EndIf
    If gbStartLandedMode
      SpaceshipREF.Enable(False)
      SpaceshipREF.EvaluatePackage(False)
      If theShipDatum.StageToSetOnLanding > -1
        Self.SetStage(theShipDatum.StageToSetOnLanding)
      EndIf
    Else
      SpaceshipREF.EnableWithLanding()
    EndIf
    RunningPackage = SpaceshipREF.GetCurrentPackage()
    If theShipDatum.StageToSetOnPlayerBoarding > -1
      Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnEnterShipInterior")
    EndIf
    If theShipDatum.StopQuestIfPlayerHomeShip
      Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnHomeShipSet")
    EndIf
    theShipDatum.hasLanded = True
    gLandedShipRefsArray[ShipDataIndex] = SpaceshipREF
    If gLandingShipsArray != None
      gLandingShipsArray.remove(aiShipDataIndex, 1)
    EndIf
    GlobalVariable gLockLevel = theShipDatum.LockLevel
    Actor ShipOwner = None
    Faction ShipFaction = None
    If theShipDatum.ShipOwner
      ShipOwner = theShipDatum.ShipOwner.GetActorRef()
    EndIf
    If ShipOwner == None
      ShipFaction = theShipDatum.ShipFaction
    EndIf
    SpaceshipREF.SetExteriorLoadDoorInaccessible(False)
    If gLockLevel == None
      SpaceshipREF.Unlock(True)
      SpaceshipREF.Lock(False, True, True)
    Else
      SpaceshipREF.Lock(True, True, True)
      Self.LockShipDoors(SpaceshipREF, gLockLevel, ShipOwner, ShipFaction)
    EndIf
    If ShipOwner as Bool || ShipFaction as Bool
      Cell shipInterior = SpaceshipREF.GetLinkedCell(SpaceshipLinkedInterior)
      If shipInterior
        If ShipOwner
          shipInterior.SetActorOwner(ShipOwner.GetLeveledActorBase())
        Else
          shipInterior.SetFactionOwner(ShipFaction)
        EndIf
        shipInterior.SetPublic(True)
      EndIf
    EndIf
  EndIf
  Return SpaceshipREF
EndFunction

Event SpaceshipReference.OnShipLanding(spaceshipreference akSource, Bool abComplete)
  If abComplete
    Int shipIndex = ShipData.findstruct("SpaceshipREF", akSource, 0)
    If shipIndex > -1
      oe_shipsaddonscript:shipdatum theShipDatum = ShipData[shipIndex]
      If theShipDatum.StageToSetOnLanding > -1
        Self.SetStage(theShipDatum.StageToSetOnLanding)
      EndIf
    EndIf
  EndIf
EndEvent

Event Actor.OnEnterShipInterior(Actor akSource, ObjectReference akShip)
  Int shipIndex = ShipData.findstruct("SpaceshipREF", akShip as spaceshipreference, 0)
  If shipIndex > -1
    If ShipData[shipIndex].StageToSetOnPlayerBoarding > -1
      Self.SetStage(ShipData[shipIndex].StageToSetOnPlayerBoarding)
    EndIf
  EndIf
EndEvent

Event Actor.OnHomeShipSet(Actor akSource, spaceshipreference akShip, spaceshipreference akPrevious)
  Int shipIndex = ShipData.findstruct("SpaceshipREF", akShip, 0)
  If shipIndex > -1
    If ShipData[shipIndex].StopQuestIfPlayerHomeShip
      Self.Stop()
    EndIf
  EndIf
EndEvent

Function SpawnStartLandedShips()
  String FunctionName = "SpawnStartLandedShips()"
  spaceshipreference SpaceshipREF = None
  Int ShipDataIndex = -1
  Int index = 0
  If !gbStartLandedMode
    Return 
  EndIf
  While index < gStartLandedShipsArray.Length
    ShipDataIndex = gStartLandedShipsArray[index]
    SpaceshipREF = Self._LandSpecificShip(ShipDataIndex)
    gLandedShipRefsArray[ShipDataIndex] = SpaceshipREF
    oe_shipsaddonscript:shipdatum theShipDatum = ShipData[ShipDataIndex]
    index += 1
  EndWhile
  gStartLandedShipsArray.clear()
  gbStartLandedMode = False
EndFunction

Function LockShipDoors(spaceshipreference akSpaceship, GlobalVariable gLockLevel, Actor akShipOwner, Faction akShipFaction)
  ObjectReference[] ShipDoors = akSpaceship.GetExteriorLoadDoors()
  Bool LockDoor = True
  Int iLockLevel = 0
  Int I = 0
  If gLockLevel != None
    iLockLevel = gLockLevel.GetValueInt()
  EndIf
  While I < ShipDoors.Length
    ObjectReference doorRef = ShipDoors[I]
    doorRef.SetLockLevel(iLockLevel)
    If akShipOwner
      doorRef.SetActorRefOwner(akShipOwner, False)
    ElseIf akShipFaction
      doorRef.SetFactionOwner(akShipFaction, False)
    EndIf
    If iLockLevel == 0
      doorRef.Unlock(False)
    Else
      doorRef.Lock(True, False, True)
    EndIf
    I += 1
  EndWhile
EndFunction

spaceshipreference Function _LandShip(Int aiShipDataIndex)
  String FunctionName = "LandShip()"
  Int ShipDataIndex = aiShipDataIndex
  Int index = 0
  If ShipDataIndex > ShipData.Length
    Return None
  ElseIf ShipDataIndex < 0
    ShipDataIndex = Utility.RandomInt(0, gLandingShipsArray.Length)
  EndIf
  Return Self._LandSpecificShip(ShipDataIndex)
EndFunction

Int Function _GetLandingMarkerIndex(Int aiShipDataIndex)
  String FunctionName = "GetLandingMarkerIndex()"
  Int index = 0
  While index < LandingMarkerData.Length
    If LandingMarkerData[index].ShipDatumIndex < 0
      LandingMarkerData[index].ShipDatumIndex = aiShipDataIndex
      Return index
    EndIf
    index += 1
  EndWhile
  Return -1
EndFunction

Bool Function _CanShipLand(Int aiShipDataIndex)
  String FunctionName = "CanShipLand()"
  Bool LandingConditions = False
  If ShipData[aiShipDataIndex].hasLanded
    Return False
  ElseIf ShipData[aiShipDataIndex].SpawnConditions
    LandingConditions = ShipData[aiShipDataIndex].SpawnConditions.IsTrue(None, None)
    If !LandingConditions
      Return False
    EndIf
  EndIf
  Return True
EndFunction

Bool Function _LaunchShip(Int aiShipDataIndex, spaceshipreference akSpaceship, Bool bForceLaunch)
  String FunctionName = "LaunchShip()"
  Bool SuccessfullyLaunched = False
  If aiShipDataIndex >= 0 && aiShipDataIndex < ShipData.Length
    If gLandedShipRefsArray[aiShipDataIndex] != None
      If !bForceLaunch && !Self._CanShipLaunch(aiShipDataIndex)
        
      ElseIf SQ_PlayerShip.IsPlayerShip(gLandedShipRefsArray[aiShipDataIndex]) == False
        gLandedShipRefsArray[aiShipDataIndex].TakeOff()
        SuccessfullyLaunched = True
        gLandedShipRefsArray[aiShipDataIndex] = None
        Self._ReleaseLandingMarker(aiShipDataIndex)
        If ShipData[aiShipDataIndex].StageToSetOnTakeoff > -1
          Self.SetStage(ShipData[aiShipDataIndex].StageToSetOnTakeoff)
        EndIf
      EndIf
    EndIf
  ElseIf akSpaceship != None
    
  EndIf
  Return SuccessfullyLaunched
EndFunction

Bool Function _CanShipLaunch(Int aiShipDataIndex)
  String FunctionName = "CanShipLaunch()"
  Bool LaunchShip = False
  oe_shipsaddonscript:shipdatum theShipDatum = ShipData[aiShipDataIndex]
  spaceshipreference currentPlayerShip = Game.GetPlayer().GetCurrentShipRef()
  If theShipDatum.hasLanded && (theShipDatum.LaunchConditions.IsTrue(None, None) || theShipDatum.LaunchConditions == None)
    LaunchShip = True
  EndIf
  Return LaunchShip
EndFunction

Function _ResetLandingMarkers()
  Int index = 0
  If ShipData.Length > 0 && LandingMarkerData.Length > 0
    While index < LandingMarkerData.Length
      LandingMarkerData[index].ShipDatumIndex = -1
      index += 1
    EndWhile
  EndIf
EndFunction

Int Function _ReleaseLandingMarker(Int aiShipDataIndex)
  Int iFound = LandingMarkerData.findstruct("ShipDatumIndex", aiShipDataIndex, 0)
  If iFound > -1
    
  EndIf
  Return iFound
EndFunction

ObjectReference Function _GetMarkerFromArray(ObjectReference[] akMarkerArray, ObjectReference akSpecificMarkerRef, Bool bAllowRandomIfSpecificFails, Bool bRemoveElementFromArray)
  String FunctionName = "GetMarkerFromArray()"
  ObjectReference MarkerREF = None
  Int RandomIndex = 0
  Int index = 0
  If akSpecificMarkerRef != None
    
  EndIf
  If akMarkerArray.Length <= 0
    Return None
  EndIf
  If akSpecificMarkerRef != None
    While index < akMarkerArray.Length && MarkerREF == None
      If akMarkerArray[index] == akSpecificMarkerRef
        If bRemoveElementFromArray
          akMarkerArray.remove(index, 1)
        EndIf
        MarkerREF = akSpecificMarkerRef
      EndIf
      index += 1
    EndWhile
  EndIf
  If MarkerREF == None && (akSpecificMarkerRef == None || akSpecificMarkerRef != None && bAllowRandomIfSpecificFails)
    RandomIndex = Utility.RandomInt(0, akMarkerArray.Length - 1)
    MarkerREF = akMarkerArray[RandomIndex]
    If MarkerREF != None
      If akSpecificMarkerRef != None
        
      EndIf
    EndIf
    If bRemoveElementFromArray
      akMarkerArray.remove(RandomIndex, 1)
    EndIf
  EndIf
  Return MarkerREF
EndFunction

ObjectReference[] Function CopyArray(ObjectReference[] akInputArray, String akOutputArrayName, String akInputArrayName)
  String FunctionName = "CopyArray()"
  ObjectReference[] outputArray = new ObjectReference[akInputArray.Length]
  Int I = 0
  While I < akInputArray.Length
    outputArray[I] = akInputArray[I]
    I += 1
  EndWhile
  If akInputArray.Length == outputArray.Length
    
  EndIf
  Return outputArray
EndFunction

Int[] Function CopyIntArray(Int[] akInputArray, String akOutputArrayName, String akInputArrayName, String akFunctionName)
  Int[] outputArray = new Int[akInputArray.Length]
  Int I = 0
  While I < akInputArray.Length
    outputArray[I] = akInputArray[I]
    I += 1
  EndWhile
  If akInputArray.Length == outputArray.Length
    
  EndIf
  Return outputArray
EndFunction

Bool Function LandShip(Int aiShipDataIndex)
  String FunctionName = "kmyQuest.LandShip()"
  Int failsafe = 100
  Int index = 0
  Bool bSuccess = False
  While Self._IsReadyToLandShip() == False && failsafe > 0
    Utility.Wait(1.0)
    failsafe -= 1
  EndWhile
  If gbEnableShips
    If aiShipDataIndex >= 0 && aiShipDataIndex < ShipData.Length
      Self._LandShip(aiShipDataIndex)
      bSuccess = True
    Else
      While index < gLandingShipsArray.Length
        If Self._CanShipLand(gLandingShipsArray[index])
          Self._LandShip(gLandingShipsArray[index])
          bSuccess = True
        EndIf
        index += 1
      EndWhile
    EndIf
  EndIf
  Return bSuccess
EndFunction

Bool Function _IsReadyToLandShip()
  Return initialized && gbEnableShips == False || initialized && gbEnableShips && gbStartLandedMode == False
EndFunction

Bool Function LaunchShip(Int aiShipDataIndex, spaceshipreference akSpaceship, Bool abForceLaunch)
  Return Self._LaunchShip(aiShipDataIndex, akSpaceship, abForceLaunch)
EndFunction

Int Function LaunchAllShips(Bool bForceLaunch)
  String FunctionName = "kmyQuest.LaunchAllShips()"
  Int LaunchedShips = 0
  Int index = 0
  While index < gLandedShipRefsArray.Length
    If gLandedShipRefsArray[index] != None
      If Self._LaunchShip(index, gLandedShipRefsArray[index], bForceLaunch)
        LaunchedShips += 1
      EndIf
    EndIf
    index += 1
  EndWhile
  Return LaunchedShips
EndFunction

Int Function getLandingQueueCount()
  Return gLandingShipsArray.Length
EndFunction

spaceshipreference[] Function GetShipRefs()
  Return gLandedShipRefsArray
EndFunction

Key[] Function ToggleShipDoors(GlobalVariable gLockLevel, spaceshipreference akSpaceshipREF, Bool bGetKey, Bool abSetAccessible)
  spaceshipreference ShipREF = akSpaceshipREF
  Key[] ShipKeys = None
  Int iLockLevel = 0
  Int I = 0
  If akSpaceshipREF == None
    While I < gLandedShipRefsArray.Length
      ShipREF = gLandedShipRefsArray[I]
      If ShipREF != None
        Self.LockShipDoors(ShipREF, gLockLevel, None, None)
        If bGetKey
          ShipKeys.add(ShipREF.GetKey(), 1)
        EndIf
      EndIf
      I += 1
    EndWhile
  Else
    Self.LockShipDoors(akSpaceshipREF, gLockLevel, None, None)
    If bGetKey
      ShipKeys.add(ShipREF.GetKey(), 1)
    EndIf
  EndIf
  Return ShipKeys
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String LogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
