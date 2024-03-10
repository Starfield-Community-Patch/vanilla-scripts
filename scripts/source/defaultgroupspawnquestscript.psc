ScriptName DefaultGroupSpawnQuestScript Extends Quest default
{ Used to spawn groups defined in SQ_GroupsScript attached to SQ_Groups quest

You can register for the custom event "SpawnEvent" defined on this script to know when when something has spawned.
You can cast the event's akArgs[0] as DefaultGroupSpawnQuestScript:SpawnEventArgs to access various data about what was spawned. }

;-- Structs -----------------------------------------
Struct SpawnEventArgs
  Int SpawnGroupNumber
  Int SpawnDataIndex
  sq_groupscript SpawnedGroup
  sq_groupoccupationscript SpawnedOccupation
  Alias SpawnAlias
  Alias SpawnAtAlias
EndStruct

Struct SpawnGroupDoneEventArgs
  Int SpawnGroupNumber
  sq_groupscript SpawnedGroup
  sq_groupoccupationscript SpawnedOccupation
EndStruct

Struct SpawnGroup_DefinitionDatum
  String Name = ""
  { Optional. For organizational/debug purposes. Printed to logs. }
  LocationAlias LocationAliasToSetOwnershipOn
  { Optional: if not none, will set owner data on this alias's location for faction defined in SQ_GroupScript }
  GlobalVariable Role
  { if the actor(s) being spawned are part of a group, this is their role (ie enemy, victim, etc) 
        Filter for: SQ_GroupRole_* }
  conditionform Conditions
  { default none; if set, these conditions must be true for ANY of this groups SpawnData to spawn. }
  ReferenceAlias ConditionAlias
  { default none; if set, the reference in this alias is used as the subject for the Conditions above }
  sq_groupscript ChosenGroup hidden
  { Set by script system }
  sq_groupoccupationscript ChosenOccupation hidden
  { Set by script system }
  Faction crimeFaction hidden
  { set during spawning }
  Int SpawnStage = -1
  { if this is > -1, wait for this stage to spawn anything in this group }
  Bool AllowSpawningIntoNonEmptyAliases = True
  { if this is false, don't spawn into an alias that already has something in it - useful if you have multiple mutually-exclusive spawn groups }
  Int Aggression = -1
  { if this is 0-3, this aggression value will be set on all spawned actors in this group
				0: Unaggressive - Will not initiate combat. Standard aggression for actors with reaction radius.
				1: Aggressive - Will attack Enemies on sight.
				2: Very Aggressive - Will attack Enemies and Neutrals on sight.
				3: Frenzied - Will attack anyone on sight.
		  Any other value means don't change aggression. }
EndStruct

Struct SpawnGroup_SpawnDatum
  Alias SpawnAlias
  { Alias to force ref(s) into after spawning }
  Alias SpawnAt
  { Reference(s) to spawn at.

		Note: If this a RefCollectionAlias and if SpawnAlias is also a RefCollection alias, it will iterate over the references in SpawnAt when spawning things.
		If you have multiple things you want to spawn at similar markers, make sure you have collected those makers into seperate RefCollectionAliases.
		Example: if you have two types of corpses to spawn, make sure you have two different corpse marker RefCollectionAliases for them to spawn at.

		*** If SpawnType is a SHIP this should be a landing marker 
			And you should consider using OE_ShipAddonScript instead of this script to spawn and manage the ship.
		*** }
  GlobalVariable Gender
  { This gender should match that of the voicetype you are forcing for this alias.
		NONE (default) == Any
		Filter for: SQ_Group_Gender_* }
  GlobalVariable SpawnType
  { This is the type of object to spawn
		NONE (Default) = Actor
		Filter for: SQ_Group_SpawnType

		*** If this is a ship:
			*SpawnAt* should be a landing marker
			And you should consider using OE_ShipAddonScript to spawn and manage its functionality INSTEAD of using this script to spawn the ship. (All this script will do is spawn the ship, OE_ShipAddonScript is more fully featured.)
		*** }
  Bool SetOverrideNameLeader
  { if true, will override the actor's name with the LeaderName message defined in SQ_GroupOccupationScript }
  Bool IsVendor
  { if true, will set up this actor to be a vendor as defined in SQ_GroupOccupationScript and SQ_GroupScript. }
  Bool SetOverrideNameVendor
  { if true, will override the actor's name with the VendorName message defined in SQ_GroupOccupationScript }
  Bool Register_With_REScript = True
  { If true (default), will call RegisterAlias on REScript if it is also attached to this quest. }
  Int MinToSpawn = 2
  { OPTIONAL: only used if SpawnAlias is a RefCollection }
  Int MaxToSpawn = 5
  { OPTIONAL: only used if SpawnAlias is a RefCollection }
  Bool SpawnAllAtEach = False
  { OPTIONAL: only used if SpawnAlias is a RefCollection; if true, at each reference in SpawnAlias, it will spawn a number of refs between MinToSpawn and MaxToSpawn }
  Keyword LinkToSpawnAt
  { OPTIONAL: will link the spawned reference to the reference in it's SpawnAt alias }
  Bool LinkToSpawnAtWithNoKeyword = False
  { OPTIONAL: if true, will link to SpawnAt without a keyword (ignore if LinkToSpawnAt isn't none) }
  Int StageToSpawn = -1
  { OPTIONAL: -1 (default) spawns at startup. }
  conditionform SpawnConditions
  { OPTIONAL: Default: none; If set and conditions are not true when the Group's Stage is called, it will not spawn. Subject of conditions is the SpawnAt reference (or first of in case of ref collection) }
  Bool InitiallyDisabled = False
  { if true, will spawn initially disabled (quest will have to handle enabling them)
		 NOTE: this does NOT apply to ships - ships are always spawned initially disabled, regardless of this flag }
EndStruct


;-- Variables ---------------------------------------
oescript Self_As_OEScript
rescript Self_As_REScript
customlogs:logdatum[] logs

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard ProcessGroupsGuard

;-- Properties --------------------------------------
Group Autofill
  sq_groups_questscript Property SQ_Groups Auto Const mandatory
EndGroup

Group SpawnGroupA
  defaultgroupspawnquestscript:spawngroup_definitiondatum Property SpawnGroupA_Definition Auto
  FormList[] Property SpawnGroupA_AllowedGroups Auto Const
  { formlist of Activators with SQ_GroupScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Faction_ }
  FormList[] Property SpawnGroupA_AllowedOccupations Auto Const
  { formlist of Activators with SQ_GroupOccupationScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Occupation_ }
  defaultgroupspawnquestscript:spawngroup_spawndatum[] Property SpawnGroupA_SpawnData Auto Const mandatory
EndGroup

Group SpawnGroupB
  defaultgroupspawnquestscript:spawngroup_definitiondatum Property SpawnGroupB_Definition Auto
  FormList[] Property SpawnGroupB_AllowedGroups Auto Const
  { formlist of Activators with SQ_GroupScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Faction_ }
  FormList[] Property SpawnGroupB_AllowedOccupations Auto Const
  { formlist of Activators with SQ_GroupOccupationScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Occupation_ }
  defaultgroupspawnquestscript:spawngroup_spawndatum[] Property SpawnGroupB_SpawnData Auto Const
EndGroup

Group SpawnGroupC
  defaultgroupspawnquestscript:spawngroup_definitiondatum Property SpawnGroupC_Definition Auto
  FormList[] Property SpawnGroupC_AllowedGroups Auto Const
  { formlist of Activators with SQ_GroupScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Faction_ }
  FormList[] Property SpawnGroupC_AllowedOccupations Auto Const
  { formlist of Activators with SQ_GroupOccupationScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Occupation_ }
  defaultgroupspawnquestscript:spawngroup_spawndatum[] Property SpawnGroupC_SpawnData Auto Const
EndGroup

Group SpawnGroupD
  defaultgroupspawnquestscript:spawngroup_definitiondatum Property SpawnGroupD_Definition Auto
  FormList[] Property SpawnGroupD_AllowedGroups Auto Const
  { formlist of Activators with SQ_GroupScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Faction_ }
  FormList[] Property SpawnGroupD_AllowedOccupations Auto Const
  { formlist of Activators with SQ_GroupOccupationScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Occupation_ }
  defaultgroupspawnquestscript:spawngroup_spawndatum[] Property SpawnGroupD_SpawnData Auto Const
EndGroup

Group SpawnGroupE
  defaultgroupspawnquestscript:spawngroup_definitiondatum Property SpawnGroupE_Definition Auto
  FormList[] Property SpawnGroupE_AllowedGroups Auto Const
  { formlist of Activators with SQ_GroupScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Faction_ }
  FormList[] Property SpawnGroupE_AllowedOccupations Auto Const
  { formlist of Activators with SQ_GroupOccupationScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Occupation_ }
  defaultgroupspawnquestscript:spawngroup_spawndatum[] Property SpawnGroupE_SpawnData Auto Const
EndGroup

Group Debug
  String Property LocalScriptName = "DefaultGroupSpawnQuestScript" Auto
  { Inherits the LocalScriptName from OEScript, if used. Otherwise, the value set here is used. }
  GlobalVariable Property SQ_Group_RandomOccupationIndexOverride Auto Const
  { Global that overrides the random occupation selection behavior. Set at runtime to force spawning NPCs from the Spawn Group's allowed occupations array. }
EndGroup

Bool Property GroupSetupCompleted = False Auto hidden

;-- Functions ---------------------------------------

Function SendSpawnEvent(defaultgroupspawnquestscript:spawneventargs Args)
  Var[] akArgs = new Var[1]
  akArgs[0] = Args as Var
  Self.SendCustomEvent("defaultgroupspawnquestscript_SpawnEvent", akArgs)
EndFunction

Function SendSpawnGroupDoneEvent(defaultgroupspawnquestscript:spawngroupdoneeventargs Args)
  Var[] akArgs = new Var[1]
  akArgs[0] = Args as Var
  Self.SendCustomEvent("defaultgroupspawnquestscript_SpawnGroupDoneEvent", akArgs)
EndFunction

Event OnQuestInit()
  Self_As_OEScript = (Self as Quest) as oescript
  Self.DefineCustomLogs()
  Self.SetUpGroups()
  If Self_As_OEScript
    LocalScriptName = Self_As_OEScript.LocalScriptName
  ElseIf Self_As_OEScript == None
    Self.InitialGroupSpawn(LocalScriptName)
  EndIf
EndEvent

Event OnStageSet(Int iStageID, Int iItemID)
  If Self.WaitForInitialGroupSetup() == False
    Return 
  EndIf
  Self.ProcessGroups(iStageID)
EndEvent

Function InitialGroupSpawn(String LocalScriptName)
  If Self.WaitForInitialGroupSetup() == False
    Return 
  EndIf
  Self.ProcessGroups(-1)
EndFunction

Function SetUpGroups()
  If SpawnGroupA_SpawnData as Bool && !SpawnGroupA_Definition
    SpawnGroupA_Definition = new defaultgroupspawnquestscript:spawngroup_definitiondatum
  EndIf
  If SpawnGroupB_SpawnData as Bool && !SpawnGroupB_Definition
    SpawnGroupB_Definition = new defaultgroupspawnquestscript:spawngroup_definitiondatum
  EndIf
  If SpawnGroupC_SpawnData as Bool && !SpawnGroupC_Definition
    SpawnGroupC_Definition = new defaultgroupspawnquestscript:spawngroup_definitiondatum
  EndIf
  If SpawnGroupD_SpawnData as Bool && !SpawnGroupD_Definition
    SpawnGroupD_Definition = new defaultgroupspawnquestscript:spawngroup_definitiondatum
  EndIf
  If SpawnGroupE_SpawnData as Bool && !SpawnGroupE_Definition
    SpawnGroupE_Definition = new defaultgroupspawnquestscript:spawngroup_definitiondatum
  EndIf
  Self.SetUpGroup("SpawnGroupA", SpawnGroupA_Definition, SpawnGroupA_AllowedGroups, SpawnGroupA_AllowedOccupations)
  Self.SetUpGroup("SpawnGroupB", SpawnGroupB_Definition, SpawnGroupB_AllowedGroups, SpawnGroupB_AllowedOccupations)
  Self.SetUpGroup("SpawnGroupC", SpawnGroupC_Definition, SpawnGroupC_AllowedGroups, SpawnGroupC_AllowedOccupations)
  Self.SetUpGroup("SpawnGroupD", SpawnGroupD_Definition, SpawnGroupD_AllowedGroups, SpawnGroupD_AllowedOccupations)
  Self.SetUpGroup("SpawnGroupE", SpawnGroupE_Definition, SpawnGroupE_AllowedGroups, SpawnGroupE_AllowedOccupations)
  GroupSetupCompleted = True
EndFunction

Function SetUpGroup(String DefaultName, defaultgroupspawnquestscript:spawngroup_definitiondatum Definition, FormList[] AllowedGroups, FormList[] AllowedOccupations)
  If Definition == None && AllowedGroups == None && AllowedOccupations == None
    Return 
  EndIf
  Self.SetDefaultName(Definition, DefaultName)
  sq_groupscript[] AllowedGroupsArray = Self.ConvertAllowedGroupsToArray(AllowedGroups)
  sq_groupoccupationscript[] AllowedOccupationsArray = Self.ConvertAllowedOccupationsToArray(AllowedOccupations)
  Bool haveAllowedGroups = AllowedGroupsArray as Bool && AllowedGroupsArray.Length >= 0
  Bool haveAllowedOccupations = AllowedOccupationsArray as Bool && AllowedOccupationsArray.Length >= 0
  If haveAllowedGroups == False && haveAllowedOccupations == False
    Return 
  EndIf
  sq_groupoccupationscript[] validOccupationsToChooseFrom = new sq_groupoccupationscript[0]
  If haveAllowedOccupations == False
    AllowedOccupationsArray = SQ_Groups.GetAllPossibleOccupations()
  EndIf
  If haveAllowedGroups == False
    validOccupationsToChooseFrom = AllowedOccupationsArray
  Else
    Int I = 0
    While I < AllowedOccupationsArray.Length
      sq_groupoccupationscript currentOccupation = AllowedOccupationsArray[I]
      If SQ_Groups.CheckGroupsForOccupation(AllowedGroupsArray, currentOccupation)
        validOccupationsToChooseFrom.add(currentOccupation, 1)
      EndIf
      I += 1
    EndWhile
  EndIf
  If validOccupationsToChooseFrom.Length == 0
    
  Else
    Int randomOccupationIndexOverride = -1
    If SQ_Group_RandomOccupationIndexOverride
      randomOccupationIndexOverride = SQ_Group_RandomOccupationIndexOverride.GetValueInt()
    EndIf
    If randomOccupationIndexOverride >= 0 && randomOccupationIndexOverride < validOccupationsToChooseFrom.Length
      Definition.ChosenOccupation = validOccupationsToChooseFrom[randomOccupationIndexOverride]
      If !Definition.ChosenOccupation
        
      EndIf
    Else
      Int iRandom = Utility.RandomInt(0, validOccupationsToChooseFrom.Length - 1)
      Definition.ChosenOccupation = validOccupationsToChooseFrom[iRandom]
    EndIf
    If haveAllowedGroups
      Definition.ChosenGroup = SQ_Groups.GetRandomGroupWithOccupation(Definition.ChosenOccupation, AllowedGroupsArray)
    Else
      Definition.ChosenGroup = SQ_Groups.GetRandomGroupWithOccupation(Definition.ChosenOccupation, None)
    EndIf
  EndIf
  If Definition.ChosenGroup == None || Definition.ChosenOccupation == None
    
  EndIf
EndFunction

Function SetDefaultName(defaultgroupspawnquestscript:spawngroup_definitiondatum GroupDefinitionToSetName, String DefaultName)
  If GroupDefinitionToSetName.Name == ""
    GroupDefinitionToSetName.Name = DefaultName
  EndIf
EndFunction

sq_groupscript[] Function ConvertAllowedGroupsToArray(FormList[] ArrayOfFormlistsToBuildFrom)
  sq_groupscript[] arrayToReturn = new sq_groupscript[0]
  If ArrayOfFormlistsToBuildFrom == None || ArrayOfFormlistsToBuildFrom.Length == 0
    Return arrayToReturn
  EndIf
  Int I = 0
  While I < ArrayOfFormlistsToBuildFrom.Length
    Form[] formArray = ArrayOfFormlistsToBuildFrom[I].GetArray(False)
    Int j = 0
    While j < formArray.Length
      sq_groupscript currentGroup = formArray[j] as sq_groupscript
      If currentGroup
        arrayToReturn.add(currentGroup, 1)
      EndIf
      j += 1
    EndWhile
    I += 1
  EndWhile
  Return arrayToReturn
EndFunction

sq_groupoccupationscript[] Function ConvertAllowedOccupationsToArray(FormList[] ArrayOfFormlistsToBuildFrom)
  sq_groupoccupationscript[] arrayToReturn = new sq_groupoccupationscript[0]
  If ArrayOfFormlistsToBuildFrom == None || ArrayOfFormlistsToBuildFrom.Length == 0
    Return arrayToReturn
  EndIf
  Int I = 0
  While I < ArrayOfFormlistsToBuildFrom.Length
    Form[] formArray = ArrayOfFormlistsToBuildFrom[I].GetArray(False)
    Int j = 0
    While j < formArray.Length
      sq_groupoccupationscript currentGroupOccupation = formArray[j] as sq_groupoccupationscript
      If currentGroupOccupation
        arrayToReturn.add(currentGroupOccupation, 1)
      EndIf
      j += 1
    EndWhile
    I += 1
  EndWhile
  Return arrayToReturn
EndFunction

Function ProcessGroups(Int iStageID)
  Guard ProcessGroupsGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Self.ProcessGroupData(SpawnGroupA_Definition, SpawnGroupA_SpawnData, iStageID)
    Self.ProcessGroupData(SpawnGroupB_Definition, SpawnGroupB_SpawnData, iStageID)
    Self.ProcessGroupData(SpawnGroupC_Definition, SpawnGroupC_SpawnData, iStageID)
    Self.ProcessGroupData(SpawnGroupD_Definition, SpawnGroupD_SpawnData, iStageID)
    Self.ProcessGroupData(SpawnGroupE_Definition, SpawnGroupE_SpawnData, iStageID)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function ProcessGroupData(defaultgroupspawnquestscript:spawngroup_definitiondatum Definition, defaultgroupspawnquestscript:spawngroup_spawndatum[] SpawnData, Int StageToCheck)
  If Definition == None || Definition.ChosenGroup == None || Definition.ChosenOccupation == None || SpawnData == None || SpawnData.Length == 0
    Return 
  EndIf
  If Definition.SpawnStage > -1 && Definition.SpawnStage != StageToCheck
    Return 
  EndIf
  If Definition.Conditions as Bool && Definition.Conditions.IsTrue(Definition.ConditionAlias.GetReference(), None) == False
    Return 
  EndIf
  Int spawnGroupID = 0
  If Definition == SpawnGroupA_Definition
    spawnGroupID = 1
  ElseIf Definition == SpawnGroupB_Definition
    spawnGroupID = 2
  ElseIf Definition == SpawnGroupC_Definition
    spawnGroupID = 3
  ElseIf Definition == SpawnGroupD_Definition
    spawnGroupID = 4
  ElseIf Definition == SpawnGroupE_Definition
    spawnGroupID = 5
  EndIf
  If Definition.SpawnStage > -1 && Definition.SpawnStage == StageToCheck
    StageToCheck = -1
  EndIf
  defaultgroupspawnquestscript:spawngroup_spawndatum[] validSpawnData = Self.GetValidSpawnData(SpawnData, StageToCheck)
  If validSpawnData.Length > 0
    Bool spawnedSomething = False
    Int I = 0
    While I < validSpawnData.Length
      defaultgroupspawnquestscript:spawngroup_spawndatum SpawnDatum = validSpawnData[I]
      If Self.Spawn(Definition, SpawnData, SpawnDatum)
        spawnedSomething = True
      EndIf
      I += 1
    EndWhile
    If spawnedSomething
      defaultgroupspawnquestscript:spawngroupdoneeventargs spawnArgs = new defaultgroupspawnquestscript:spawngroupdoneeventargs
      spawnArgs.SpawnGroupNumber = spawnGroupID
      spawnArgs.SpawnedGroup = Definition.ChosenGroup
      spawnArgs.SpawnedOccupation = Definition.ChosenOccupation
      If Definition.LocationAliasToSetOwnershipOn
        Location locToSetOwnerOn = Definition.LocationAliasToSetOwnershipOn.GetLocation()
        If locToSetOwnerOn
          Faction owningFaction = Definition.ChosenGroup.GetFactionForLocationOwnership()
          locToSetOwnerOn.SetFactionOwner(owningFaction)
          If Self_As_OEScript as Bool && Self_As_OEScript.owningFaction == None
            Self_As_OEScript.owningFaction = owningFaction
          EndIf
        EndIf
      EndIf
      Self.SendSpawnGroupDoneEvent(spawnArgs)
    EndIf
  EndIf
EndFunction

defaultgroupspawnquestscript:spawngroup_spawndatum[] Function GetValidSpawnData(defaultgroupspawnquestscript:spawngroup_spawndatum[] SpawnData, Int iStageID)
  defaultgroupspawnquestscript:spawngroup_spawndatum[] validData = new defaultgroupspawnquestscript:spawngroup_spawndatum[0]
  defaultgroupspawnquestscript:spawngroup_spawndatum[] spawnDataWithMatchingStage = SpawnData.GetMatchingStructs("StageToSpawn", iStageID, 0, -1) ;*** WARNING: Experimental syntax, may be incorrect: GetMatchingStructs 
  Int index = 0
  While index < spawnDataWithMatchingStage.Length
    defaultgroupspawnquestscript:spawngroup_spawndatum currentSpawnData = spawnDataWithMatchingStage[index]
    ObjectReference spawnAtRef = None
    If currentSpawnData.SpawnAt is ReferenceAlias
      spawnAtRef = (currentSpawnData.SpawnAt as ReferenceAlias).GetRef()
    ElseIf currentSpawnData.SpawnAt is RefCollectionAlias
      spawnAtRef = (currentSpawnData.SpawnAt as RefCollectionAlias).GetAt(0)
    EndIf
    If spawnAtRef == None
      
    Else
      conditionform spawnConditionsToCheck = currentSpawnData.SpawnConditions
      If spawnConditionsToCheck == None || spawnConditionsToCheck.IsTrue(spawnAtRef, None)
        validData.add(currentSpawnData, 1)
      EndIf
    EndIf
    index += 1
  EndWhile
  Return validData
EndFunction

Bool Function Spawn(defaultgroupspawnquestscript:spawngroup_definitiondatum Definition, defaultgroupspawnquestscript:spawngroup_spawndatum[] SpawnData, defaultgroupspawnquestscript:spawngroup_spawndatum SpawnDatum)
  If Definition == None || SpawnDatum == None
    Return False
  EndIf
  If Definition.ChosenGroup == None || Definition.ChosenOccupation == None
    Return False
  EndIf
  ObjectReference spawnAtRef = None
  ReferenceAlias spawnAtRefAlias = SpawnDatum.SpawnAt as ReferenceAlias
  RefCollectionAlias spawnAtRefCol = None
  If spawnAtRefAlias
    spawnAtRef = spawnAtRefAlias.GetReference()
  Else
    spawnAtRefCol = SpawnDatum.SpawnAt as RefCollectionAlias
    If spawnAtRefCol == None
      Return False
    EndIf
    spawnAtRef = spawnAtRefCol.GetAt(0)
  EndIf
  If spawnAtRef == None
    Return False
  EndIf
  Faction crimeFaction = Definition.crimeFaction
  If crimeFaction == None
    Definition.crimeFaction = Definition.ChosenGroup.GetFactionForLocationOwnership()
    crimeFaction = Definition.crimeFaction
  EndIf
  RefCollectionAlias currentRefCol = SpawnDatum.SpawnAlias as RefCollectionAlias
  If currentRefCol
    If Definition.AllowSpawningIntoNonEmptyAliases == True || currentRefCol.GetCount() == 0
      Bool spawningCorpses = SpawnDatum.SpawnType == SQ_Groups.SQ_Group_SpawnType_Corpse
      If SpawnDatum.SpawnAllAtEach && spawningCorpses == False
        Int I = 0
        While I < spawnAtRefCol.GetCount()
          spawnAtRef = spawnAtRefCol.GetAt(I)
          Int numToSpawn = Utility.RandomInt(SpawnDatum.MinToSpawn, SpawnDatum.MaxToSpawn)
          Int countSpawned = 0
          While countSpawned < numToSpawn
            ObjectReference refToAdd = Definition.ChosenGroup.SpawnGroupReference(spawnAtRef, Definition.ChosenOccupation, SpawnDatum.LinkToSpawnAt, SpawnDatum.LinkToSpawnAtWithNoKeyword, SpawnDatum.SpawnType, SpawnDatum.Gender, SpawnDatum.IsVendor, crimeFaction, SpawnDatum.InitiallyDisabled, Definition.Aggression)
            currentRefCol.AddRef(refToAdd)
            countSpawned += 1
          EndWhile
          I += 1
        EndWhile
      Else
        Int numtospawn = Utility.RandomInt(SpawnDatum.MinToSpawn, SpawnDatum.MaxToSpawn)
        Int CountOfSpawnAtRefCol = 1
        If spawnAtRefCol
          CountOfSpawnAtRefCol = spawnAtRefCol.GetCount()
        EndIf
        If spawningCorpses
          numtospawn = Math.Min(CountOfSpawnAtRefCol as Float, numtospawn as Float) as Int
        EndIf
        Int countspawned = 0
        While countspawned < numtospawn
          If spawnAtRefCol
            spawnAtRef = spawnAtRefCol.GetAt(countspawned % CountOfSpawnAtRefCol)
          EndIf
          ObjectReference reftoadd = Definition.ChosenGroup.SpawnGroupReference(spawnAtRef, Definition.ChosenOccupation, SpawnDatum.LinkToSpawnAt, SpawnDatum.LinkToSpawnAtWithNoKeyword, SpawnDatum.SpawnType, SpawnDatum.Gender, SpawnDatum.IsVendor, crimeFaction, SpawnDatum.InitiallyDisabled, Definition.Aggression)
          currentRefCol.AddRef(reftoadd)
          countspawned += 1
        EndWhile
      EndIf
      If SpawnDatum.SetOverrideNameLeader || SpawnDatum.SetOverrideNameVendor
        Int i = 0
        While i < currentRefCol.GetCount()
          ObjectReference refToName = currentRefCol.GetAt(i)
          If SpawnDatum.SetOverrideNameLeader
            Definition.ChosenOccupation.SetOverrideNameLeader(refToName as Actor)
          EndIf
          If SpawnDatum.SetOverrideNameVendor
            Definition.ChosenOccupation.SetOverrideNameVendor(refToName as Actor)
          EndIf
          i += 1
        EndWhile
      EndIf
      If SpawnDatum.Register_With_REScript && Self_As_REScript as Bool
        Self_As_REScript.RegisterCollectionAlias(currentRefCol)
      EndIf
    Else
      Return False
    EndIf
  Else
    ReferenceAlias currentRefAlias = SpawnDatum.SpawnAlias as ReferenceAlias
    If currentRefAlias
      If Definition.AllowSpawningIntoNonEmptyAliases == True || currentRefAlias.GetRef() == None
        ObjectReference spawnedRef = Definition.ChosenGroup.SpawnGroupReference(spawnAtRef, Definition.ChosenOccupation, SpawnDatum.LinkToSpawnAt, SpawnDatum.LinkToSpawnAtWithNoKeyword, SpawnDatum.SpawnType, SpawnDatum.Gender, SpawnDatum.IsVendor, crimeFaction, SpawnDatum.InitiallyDisabled, Definition.Aggression)
        currentRefAlias.ForceRefTo(spawnedRef)
        If SpawnDatum.SetOverrideNameLeader
          Definition.ChosenOccupation.SetOverrideNameLeader(spawnedRef as Actor)
        EndIf
        If SpawnDatum.SetOverrideNameVendor
          Definition.ChosenOccupation.SetOverrideNameVendor(spawnedRef as Actor)
        EndIf
      Else
        Return False
      EndIf
    Else
      Return False
    EndIf
    If SpawnDatum.Register_With_REScript && Self_As_REScript as Bool
      Self_As_REScript.RegisterAlias(currentRefAlias)
    EndIf
  EndIf
  defaultgroupspawnquestscript:spawneventargs spawnArgs = new defaultgroupspawnquestscript:spawneventargs
  If Definition == SpawnGroupA_Definition
    spawnArgs.SpawnGroupNumber = 1
  ElseIf Definition == SpawnGroupB_Definition
    spawnArgs.SpawnGroupNumber = 2
  ElseIf Definition == SpawnGroupC_Definition
    spawnArgs.SpawnGroupNumber = 3
  ElseIf Definition == SpawnGroupD_Definition
    spawnArgs.SpawnGroupNumber = 4
  ElseIf Definition == SpawnGroupE_Definition
    spawnArgs.SpawnGroupNumber = 5
  EndIf
  spawnArgs.SpawnDataIndex = SpawnData.find(SpawnDatum, 0)
  spawnArgs.SpawnAlias = SpawnDatum.SpawnAlias
  spawnArgs.SpawnAtAlias = SpawnDatum.SpawnAt
  spawnArgs.SpawnedGroup = Definition.ChosenGroup
  spawnArgs.SpawnedOccupation = Definition.ChosenOccupation
  Self.SendSpawnEvent(spawnArgs)
  Return True
EndFunction

Bool Function WaitForInitialGroupSetup()
  Float maxWait = 30.0
  Float waitTime = 0.200000003
  Float waitingFor = 0.0
  While GroupSetupCompleted == False && waitingFor < maxWait
    Utility.Wait(waitTime)
    waitingFor += waitTime
  EndWhile
  If waitingFor >= maxWait
    Return False
  EndIf
  Return True
EndFunction

spaceshipbase Function GetShipToSpawnForGroup(Int GroupToGetShipFor, ObjectReference landingMarkerRef, GlobalVariable SpawnType)
  If Self.WaitForInitialGroupSetup() == False
    Return None
  EndIf
  defaultgroupspawnquestscript:spawngroup_definitiondatum definitionToSpawnWith = Self.GetSpawnGroupDefinitionDatum(GroupToGetShipFor)
  If definitionToSpawnWith == None
    Return None
  EndIf
  spaceshipbase spaceshipBaseToReturn = definitionToSpawnWith.ChosenGroup.GetSpaceshipBaseToSpawn(landingMarkerRef, SpawnType, definitionToSpawnWith.ChosenOccupation)
  Return spaceshipBaseToReturn
EndFunction

Faction Function GetGroupOwnershipFaction(Int groupID)
  If Self.WaitForInitialGroupSetup() == False
    Return None
  EndIf
  defaultgroupspawnquestscript:spawngroup_definitiondatum groupDefinition = Self.GetSpawnGroupDefinitionDatum(groupID)
  Faction owningFaction = groupDefinition.ChosenGroup.GetFactionForLocationOwnership()
  Return owningFaction
EndFunction

defaultgroupspawnquestscript:spawngroup_definitiondatum Function GetSpawnGroupDefinitionDatum(Int groupID)
  defaultgroupspawnquestscript:spawngroup_definitiondatum definitionToSpawnWith = None
  If groupID == 0
    definitionToSpawnWith = SpawnGroupA_Definition
  ElseIf groupID == 1
    definitionToSpawnWith = SpawnGroupB_Definition
  ElseIf groupID == 2
    definitionToSpawnWith = SpawnGroupC_Definition
  ElseIf groupID == 3
    definitionToSpawnWith = SpawnGroupD_Definition
  ElseIf groupID == 4
    definitionToSpawnWith = SpawnGroupE_Definition
  EndIf
  Return definitionToSpawnWith
EndFunction

Function DefineCustomLogs()
  logs = new customlogs:logdatum[0]
  customlogs.AddCustomLog(logs, "SQ_Groups", "DefaultGroupSpawnQuestScript", True, True, "", True)
  If Self_As_OEScript
    customlogs.AddCustomLog(logs, Self_As_OEScript.MainLogName, "", !Self_As_OEScript.TerseLog, True, LocalScriptName, Self_As_OEScript.DebugMode)
  EndIf
EndFunction

Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity)
  customlogs.Trace(logs, CallingObject, asTextToPrint, aiSeverity)
EndFunction

Function warning(ScriptObject CallingObject, String asTextToPrint, Bool DebugTrace, Int aiSeverity, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  customlogs.warning(logs, CallingObject, asTextToPrint)
EndFunction
