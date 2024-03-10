ScriptName SQ_GroupScript Extends Activator

;-- Structs -----------------------------------------
Struct OccupationDatum
  sq_groupoccupationscript Occupation
  { the occupation }
  ActorBase ActorBaseToSpawn_Female
  { which actorbase to spawn for the group's use of this occupation - with female specific voicetypes }
  ActorBase ActorBaseToSpawn_Male
  { which actorbase to spawn for the group's use of this occupation - with male specific voicetypes }
  ActorBase CorpseToSpawn_Female
  { which actorbase to spawn a corpse associated the this group's use of this occupation }
  ActorBase CorpseToSpawn_Male
  { which actorbase to spawn a corpse associated the this group's use of this occupation }
  Faction VendorFaction
  { OPTIONAL: Vendor Faction for vendors spawned for this occupation; defaults to data set on SQ_GroupOccupationScript for this occupation }
  LeveledItem VendorList
  { OPTIONAL: Leveled list for populating vendor container for this occupation; defaults to data set on SQ_GroupOccupationScript for this occupation }
  ActorBase ActorBaseToSpawn_Child_Female
  { OPTIONAL: which child actorbase to spawn for the group's use of this occupation - with female child specific voicetypes; defaults to data set on SQ_GroupOccupationScript for this occupation }
  ActorBase ActorBaseToSpawn_Child_Male
  { OPTIONAL: which child actorbase to spawn for the group's use of this occupation - with male child specific voicetypes; defaults to data set on SQ_GroupOccupationScript for this occupation }
  ActorBase ActorBaseToSpawn_Older_Female
  { OPTIONAL: which Older actorbase to spawn for the group's use of this occupation - with female old specific voicetypes; defaults to data set on SQ_GroupOccupationScript for this occupation }
  ActorBase ActorBaseToSpawn_Older_Male
  { OPTIONAL: which Older actorbase to spawn for the group's use of this occupation - with male old specific voicetypes; defaults to data set on SQ_GroupOccupationScript for this occupation }
  ActorBase ActorBaseToSpawn_Robot
  { OPTIONAL: which child actorbase to spawn for the group's use of this occupation - with female child specific voicetypes; defaults to data set on SQ_GroupOccupationScript for this occupation }
  spaceshipbase ShipToSpawn_Fighter
  { OPTIONAL: When spawning a fighter for this group, use this. (otherwise use the main faction ships) }
  spaceshipbase ShipToSpawn_Destroyer
  { OPTIONAL: When spawning a destroyer for this group, use this. }
  spaceshipbase ShipToSpawn_Cruiser
  { OPTIONAL: When spawning a cruiser for this group, use this. }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  GlobalVariable Property SQ_Group_Gender_Any Auto Const mandatory
  GlobalVariable Property SQ_Group_Gender_Female Auto Const mandatory
  GlobalVariable Property SQ_Group_Gender_Male Auto Const mandatory
  GlobalVariable Property SQ_Group_SpawnType_Actor Auto Const mandatory
  GlobalVariable Property SQ_Group_SpawnType_Corpse Auto Const mandatory
  GlobalVariable Property SQ_Group_SpawnType_Child Auto Const mandatory
  GlobalVariable Property SQ_Group_SpawnType_Robot Auto Const mandatory
  GlobalVariable Property SQ_Group_SpawnType_Older Auto Const mandatory
  GlobalVariable Property SQ_Group_SpawnType_Ship_0_Any Auto Const mandatory
  GlobalVariable Property SQ_Group_SpawnType_Ship_1_Fighter Auto Const mandatory
  GlobalVariable Property SQ_Group_SpawnType_Ship_2_Destroyer Auto Const mandatory
  GlobalVariable Property SQ_Group_SpawnType_Ship_3_Cruiser Auto Const mandatory
  Keyword Property SpaceshipLandingMarker Auto Const mandatory
  Faction Property SQ_Group_VendorFaction_Default Auto Const mandatory
  Container Property SQ_VendorContainerEmptyBase Auto Const mandatory
  Keyword Property VendorContainerKeyword01 Auto Const mandatory
  Keyword Property SpaceshipLandingPadMedium Auto Const mandatory
  Keyword Property SpaceshipLandingPadLarge Auto Const mandatory
EndGroup

Group GroupData
  GlobalVariable Property FactionID Auto Const mandatory
  { A global that holds an enum used to identify this group. Can be stored in AVs and variables for conditions on dialogue, etc.
	Filter for: SQ_Group_FactionID_ }
  Faction[] Property GroupFactions Auto Const mandatory
  { The main faction(s) members of this group are in. This is an identifying faction that should be closely tied with the factions identity. An actor in ANY of these factions is considered a member of this group. }
  Keyword[] Property LocEncKeywords Auto Const
  { NOT YET IMPLEMENTED -- optional: A keyword on locations where this group resides. This will be used to help determine what group is in an area }
  Faction Property FactionForLocationOwnership Auto Const
  { When a group is spawned from this faction, it will assign this faction to be the owner of the location they spawn into. }
  FormList Property FactionListForLocationOwnership Auto Const
  { When a group is spawned from this faction, it will randomly assign one of these factions to be the owner of the location they spawn into.
	(IGNORED IF FactionForLocationOwnership is not none.) }
  spaceshipbase Property ShipToSpawn_Fighter Auto Const mandatory
  { When spawning a fighter for this group, use this. }
  spaceshipbase Property ShipToSpawn_Destroyer Auto Const mandatory
  { When spawning a destroyer for this group, use this. }
  spaceshipbase Property ShipToSpawn_Cruiser Auto Const mandatory
  { When spawning a cruiser for this group, use this. }
  Float Property ActorLevelModChanceEasy = 0.400000006 Auto Const
  { Chance the actor's aiLevelMod will be 0, Easy. }
  Float Property ActorLevelModChanceMedium = 0.800000012 Auto Const
  { Chance the actor's aiLevelMod will be 1, Medium. If not Easy or Medium, the actor will be 2, Hard. }
EndGroup

Group Occupations
  sq_groupscript:occupationdatum[] Property OccupationData Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Int Function GetFactionIDValue()
  Return FactionID.GetValue() as Int
EndFunction

Bool Function ValidateActor(Actor ActorToValidate, sq_groupoccupationscript OccupationToValidate)
  Bool validated = OccupationToValidate == None || OccupationToValidate.ValidateActor(ActorToValidate)
  If validated
    validated = Self.CheckActorFactions(ActorToValidate)
  EndIf
  Return validated
EndFunction

Bool Function CheckActorFactions(Actor ActorToTest)
  Bool factionCheck = commonarrayfunctions.CheckActorAgainstFactionArray(ActorToTest, GroupFactions, False)
  Return factionCheck
EndFunction

sq_groupoccupationscript[] Function GetAllOccupations()
  sq_groupoccupationscript[] Occupations = new sq_groupoccupationscript[OccupationData.Length]
  Int I = 0
  While I < OccupationData.Length
    Occupations[I] = OccupationData[I].Occupation
    I += 1
  EndWhile
  Return Occupations
EndFunction

sq_groupoccupationscript Function GetRandomOccupation()
  sq_groupoccupationscript[] allOccupations = Self.GetAllOccupations()
  Int iRandom = Utility.RandomInt(0, allOccupations.Length - 1)
  sq_groupoccupationscript randomOccupation = allOccupations[iRandom]
  Return randomOccupation
EndFunction

Bool Function HasOccupation(sq_groupoccupationscript OccupationToFind)
  Return OccupationData.findstruct("Occupation", OccupationToFind, 0) > -1
EndFunction

sq_groupoccupationscript Function GetRandomMatchingOccupation(sq_groupoccupationscript[] OccupationsToCheck)
  sq_groupoccupationscript[] matchingOccupations = Self.GetMatchingOccupations(OccupationsToCheck)
  Int iRandom = Utility.RandomInt(0, matchingOccupations.Length - 1)
  sq_groupoccupationscript randomOccupation = matchingOccupations[iRandom]
  Return randomOccupation
EndFunction

sq_groupoccupationscript[] Function GetMatchingOccupations(sq_groupoccupationscript[] OccupationsToCheck)
  sq_groupoccupationscript[] matchingOccupations = new sq_groupoccupationscript[0]
  Int I = 0
  While I < OccupationData.Length
    sq_groupscript:occupationdatum currentOccupationDatum = OccupationData[I]
    If OccupationsToCheck.find(currentOccupationDatum.Occupation, 0) >= 0
      matchingOccupations.add(currentOccupationDatum.Occupation, 1)
    EndIf
    I += 1
  EndWhile
  Return matchingOccupations
EndFunction

Faction Function GetFactionForLocationOwnership()
  Faction owningFaction = FactionForLocationOwnership
  If owningFaction == None && FactionListForLocationOwnership as Bool
    Int iRandom = Utility.RandomInt(0, FactionListForLocationOwnership.GetSize() - 1)
    Faction randomFaction = FactionListForLocationOwnership.GetAt(iRandom) as Faction
    owningFaction = randomFaction
  EndIf
  Return owningFaction
EndFunction

ObjectReference Function SpawnGroupReference(ObjectReference SpawnAtRef, sq_groupoccupationscript OccupationToSpawn, Keyword LinkToSpawnAt, Bool LinkToSpawnAtWithNoKeyword, GlobalVariable SpawnType, GlobalVariable GenderToSpawn, Bool IsVendor, Faction crimeFaction, Bool InitiallyDisabled, Int Aggression)
  If SpawnAtRef == None
    Return None
  EndIf
  If OccupationToSpawn == None
    Return None
  EndIf
  If SpawnType == None
    SpawnType = SQ_Group_SpawnType_Actor
  EndIf
  Form formToSpawn = None
  Bool isShipSpawning = False
  Faction VendorFaction = None
  LeveledItem VendorList = None
  Int iFound = OccupationData.findstruct("Occupation", OccupationToSpawn, 0)
  sq_groupscript:occupationdatum foundOccupationDatum = None
  If iFound > -1
    foundOccupationDatum = OccupationData[iFound]
    Bool SpawnMale = False
    If GenderToSpawn == None || GenderToSpawn == SQ_Group_Gender_Any
      SpawnMale = Utility.RandomInt(1, 100) <= 50
    ElseIf GenderToSpawn == SQ_Group_Gender_Male
      SpawnMale = True
    ElseIf GenderToSpawn != SQ_Group_Gender_Female
      
    EndIf
    If SpawnType == SQ_Group_SpawnType_Actor
      If SpawnMale
        formToSpawn = foundOccupationDatum.ActorBaseToSpawn_Male as Form
      Else
        formToSpawn = foundOccupationDatum.ActorBaseToSpawn_Female as Form
      EndIf
    ElseIf SpawnType == SQ_Group_SpawnType_Child
      If SpawnMale
        formToSpawn = foundOccupationDatum.ActorBaseToSpawn_Child_Male as Form
        If formToSpawn == None
          formToSpawn = OccupationToSpawn.DefaultChild_Male as Form
        EndIf
      Else
        formToSpawn = foundOccupationDatum.ActorBaseToSpawn_Child_Female as Form
        If formToSpawn == None
          formToSpawn = OccupationToSpawn.DefaultChild_Female as Form
        EndIf
      EndIf
    ElseIf SpawnType == SQ_Group_SpawnType_Older
      If SpawnMale
        formToSpawn = foundOccupationDatum.ActorBaseToSpawn_Older_Male as Form
        If formToSpawn == None
          formToSpawn = OccupationToSpawn.DefaultOlder_Male as Form
        EndIf
      Else
        formToSpawn = foundOccupationDatum.ActorBaseToSpawn_Older_Female as Form
        If formToSpawn == None
          formToSpawn = OccupationToSpawn.DefaultOlder_Female as Form
        EndIf
      EndIf
    ElseIf SpawnType == SQ_Group_SpawnType_Robot
      formToSpawn = foundOccupationDatum.ActorBaseToSpawn_Robot as Form
      If formToSpawn == None
        formToSpawn = OccupationToSpawn.DefaultRobot as Form
      EndIf
    ElseIf SpawnType == SQ_Group_SpawnType_Corpse
      If SpawnMale
        formToSpawn = foundOccupationDatum.CorpseToSpawn_Male as Form
      Else
        formToSpawn = foundOccupationDatum.CorpseToSpawn_Female as Form
      EndIf
    ElseIf Self.IsSpawnTypeShip(SpawnType)
      isShipSpawning = True
      If SpawnAtRef.HasKeyword(SpaceshipLandingMarker)
        formToSpawn = Self.GetSpaceshipBaseToSpawn(SpawnAtRef, SpawnType, foundOccupationDatum.Occupation) as Form
      EndIf
    EndIf
    If IsVendor
      VendorList = foundOccupationDatum.VendorList
      If VendorList == None
        VendorList = foundOccupationDatum.Occupation.DefaultVendorList
      EndIf
      VendorFaction = foundOccupationDatum.VendorFaction
      If VendorFaction == None
        VendorFaction = foundOccupationDatum.Occupation.DefaultOccupationVendorFaction
      EndIf
      If VendorFaction == None
        VendorFaction = SQ_Group_VendorFaction_Default
      EndIf
    EndIf
  Else
    Return None
  EndIf
  If formToSpawn == None
    Return None
  EndIf
  ObjectReference spawnedRef = None
  If isShipSpawning
    spawnedRef = SpawnAtRef.PlaceShipAtMe((formToSpawn as spaceshipbase) as Form, 4, True, False, True, True, None, None, None, True) as ObjectReference
    spawnedRef.SetLinkedRef(SpawnAtRef, None, False)
    spawnedRef.Enable(False)
  Else
    ActorBase actorBaseToSpawn = formToSpawn as ActorBase
    If actorBaseToSpawn
      Int actorLevelMod = 0
      Float actorLevelModChance = Utility.RandomFloat(0.0, 1.0)
      If actorLevelModChance < ActorLevelModChanceEasy
        actorLevelMod = 0
      ElseIf actorLevelModChance < ActorLevelModChanceMedium
        actorLevelMod = 1
      Else
        actorLevelMod = 2
      EndIf
      spawnedRef = SpawnAtRef.PlaceActorAtMe(actorBaseToSpawn, actorLevelMod, SpawnAtRef.GetCurrentLocation(), False, InitiallyDisabled, True, None, True) as ObjectReference
    Else
      spawnedRef = SpawnAtRef.PlaceAtMe(formToSpawn, 1, False, InitiallyDisabled, True, None, None, True)
    EndIf
  EndIf
  Actor spawnedActor = spawnedRef as Actor
  spaceshipreference spawnedShip = spawnedRef as spaceshipreference
  If crimeFaction
    If spawnedActor
      spawnedActor.SetCrimeFaction(crimeFaction)
    ElseIf spawnedShip
      spawnedShip.SetCrimeFaction(crimeFaction)
    EndIf
  EndIf
  If Aggression > -1 && Aggression < 4
    If spawnedActor
      spawnedActor.SetValue(Game.GetAggressionAV(), Aggression as Float)
    ElseIf spawnedShip
      spawnedShip.SetValue(Game.GetAggressionAV(), Aggression as Float)
    EndIf
  EndIf
  If LinkToSpawnAt as Bool || LinkToSpawnAtWithNoKeyword
    spawnedRef.SetLinkedRef(SpawnAtRef, LinkToSpawnAt, False)
  EndIf
  If IsVendor
    spawnedActor.AddToFaction(VendorFaction)
    ObjectReference vendorContainerRef = spawnedActor.PlaceAtMe(SQ_VendorContainerEmptyBase as Form, 1, False, True, True, None, None, True)
    vendorContainerRef.AddItem(VendorList as Form, 1, False)
    spawnedRef.SetLinkedRef(vendorContainerRef, VendorContainerKeyword01, False)
  EndIf
  Return spawnedRef
EndFunction

Bool Function IsSpawnTypeShip(GlobalVariable SpawnTypeGlobal)
  Return SpawnTypeGlobal == SQ_Group_SpawnType_Ship_0_Any || SpawnTypeGlobal == SQ_Group_SpawnType_Ship_1_Fighter || SpawnTypeGlobal == SQ_Group_SpawnType_Ship_2_Destroyer || SpawnTypeGlobal == SQ_Group_SpawnType_Ship_3_Cruiser
EndFunction

spaceshipbase Function GetSpaceshipBaseToSpawn(ObjectReference landingMarkerRef, GlobalVariable RequestedShip_SpawnType, sq_groupoccupationscript Occupation)
  spaceshipbase shipbaseToReturn = None
  Int sizeMax = 1
  If RequestedShip_SpawnType == None || RequestedShip_SpawnType == SQ_Group_SpawnType_Ship_0_Any
    If landingMarkerRef.HasKeyword(SpaceshipLandingPadMedium)
      sizeMax = 2
    ElseIf landingMarkerRef.HasKeyword(SpaceshipLandingPadLarge)
      sizeMax = 3
    EndIf
    Int RandomInt = Utility.RandomInt(1, sizeMax)
    If RandomInt == 1
      RequestedShip_SpawnType = SQ_Group_SpawnType_Ship_1_Fighter
    ElseIf RandomInt == 2
      RequestedShip_SpawnType = SQ_Group_SpawnType_Ship_2_Destroyer
    ElseIf RandomInt == 3
      RequestedShip_SpawnType = SQ_Group_SpawnType_Ship_3_Cruiser
    EndIf
  EndIf
  sq_groupscript:occupationdatum shipOccupation = None
  If Occupation
    Int occupationIndex = OccupationData.findstruct("Occupation", Occupation, 0)
    If occupationIndex > -1
      shipOccupation = OccupationData[occupationIndex]
    EndIf
  EndIf
  If RequestedShip_SpawnType == SQ_Group_SpawnType_Ship_3_Cruiser && sizeMax == 3
    If shipOccupation as Bool && shipOccupation.ShipToSpawn_Cruiser as Bool
      shipbaseToReturn = shipOccupation.ShipToSpawn_Cruiser
    Else
      shipbaseToReturn = ShipToSpawn_Cruiser
    EndIf
  ElseIf RequestedShip_SpawnType == SQ_Group_SpawnType_Ship_2_Destroyer && sizeMax >= 2
    If shipOccupation as Bool && shipOccupation.ShipToSpawn_Destroyer as Bool
      shipbaseToReturn = shipOccupation.ShipToSpawn_Destroyer
    Else
      shipbaseToReturn = ShipToSpawn_Destroyer
    EndIf
  ElseIf shipOccupation as Bool && shipOccupation.ShipToSpawn_Fighter as Bool
    shipbaseToReturn = shipOccupation.ShipToSpawn_Fighter
  Else
    shipbaseToReturn = ShipToSpawn_Fighter
  EndIf
  Return shipbaseToReturn
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
