ScriptName SQ_Groups_QuestScript Extends Quest
{ used to access group definitions and functions }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group autofill
  GlobalVariable Property SQ_Group_Gender_Any Auto Const mandatory
  GlobalVariable Property SQ_Group_Gender_Female Auto Const mandatory
  GlobalVariable Property SQ_Group_Gender_Male Auto Const mandatory
  GlobalVariable Property SQ_Group_SpawnType_Corpse Auto Const mandatory
EndGroup

Group GroupRoles
  GlobalVariable Property SQ_GroupRole_Enemy Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_GroupRole_Victim Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_GroupRole_Neutral Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_GroupRole_BiomePredator Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_GroupRole_BiomePrey Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_GroupRole_BiomeCritter Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_Debug_GroupRole_Enemy Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_Debug_GroupRole_Victim Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_Debug_GroupRole_Neutral Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_Debug_GroupRole_BiomePredator Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_Debug_GroupRole_BiomePrey Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_Debug_GroupRole_BiomeCritter Auto Const mandatory
  { autofill }
EndGroup

sq_groupscript[] Property Groups Auto Const mandatory
{ holds all the defined groups with SQ_GroupScript }

;-- Functions ---------------------------------------

Bool Function CheckGroupsForOccupation(sq_groupscript[] GroupsToCheck, sq_groupoccupationscript OccupationToFind)
  Int I = 0
  While I < GroupsToCheck.Length
    sq_groupscript currentGroup = GroupsToCheck[I]
    If currentGroup.HasOccupation(OccupationToFind)
      Return True
    EndIf
    I += 1
  EndWhile
  Return False
EndFunction

sq_groupscript[] Function GetAllGroupsWithOccupation(sq_groupoccupationscript OccupationToFind, sq_groupscript[] LimitSearchToTheseGroups)
  sq_groupscript[] matchingGroups = new sq_groupscript[0]
  sq_groupscript[] arrayToSearch = LimitSearchToTheseGroups
  If arrayToSearch == None
    arrayToSearch = Groups
  EndIf
  Int I = 0
  While I < arrayToSearch.Length
    sq_groupscript currentGroup = arrayToSearch[I]
    If currentGroup.OccupationData.findstruct("Occupation", OccupationToFind, 0) >= 0
      matchingGroups.add(currentGroup, 1)
    EndIf
    I += 1
  EndWhile
  Return matchingGroups
EndFunction

sq_groupscript Function GetRandomGroupWithOccupation(sq_groupoccupationscript OccupationToFind, sq_groupscript[] LimitSearchToTheseGroups)
  sq_groupscript[] groupsWithOccupation = Self.GetAllGroupsWithOccupation(OccupationToFind, LimitSearchToTheseGroups)
  Int iRandom = Utility.RandomInt(0, groupsWithOccupation.Length - 1)
  sq_groupscript randomGroup = groupsWithOccupation[iRandom]
  Return randomGroup
EndFunction

sq_groupoccupationscript[] Function GetAllPossibleOccupations()
  sq_groupoccupationscript[] occupations = new sq_groupoccupationscript[0]
  Int I = 0
  While I < Groups.Length
    sq_groupscript currentGroup = Groups[I]
    sq_groupoccupationscript[] currentGroupOccupations = currentGroup.GetAllOccupations()
    Int iOccupation = 0
    While iOccupation < currentGroupOccupations.Length
      sq_groupoccupationscript currentOccupation = currentGroupOccupations[iOccupation]
      If occupations.find(currentOccupation, 0) < 0
        occupations.add(currentOccupation, 1)
      EndIf
      iOccupation += 1
    EndWhile
    I += 1
  EndWhile
  Return occupations
EndFunction

sq_groupoccupationscript Function GetRandomOccupationFromAllPossibleOccupations()
  sq_groupoccupationscript[] allPossibleOccupations = Self.GetAllPossibleOccupations()
  Int iRandom = Utility.RandomInt(0, allPossibleOccupations.Length - 1)
  sq_groupoccupationscript randomOccupation = allPossibleOccupations[iRandom]
  Return randomOccupation
EndFunction

sq_groupscript Function GetGroupByActor(Actor ActorToGetGroupFor, Bool ValidateActor)
  sq_groupscript returnVal = None
  Int I = 0
  While returnVal == None && I < Groups.Length
    sq_groupscript currentGroup = Groups[I]
    If currentGroup.CheckActorFactions(ActorToGetGroupFor)
      If ValidateActor == False || currentGroup.ValidateActor(ActorToGetGroupFor, None)
        returnVal = currentGroup
      Else
        Return None
      EndIf
    EndIf
    I += 1
  EndWhile
  Return returnVal
EndFunction

sq_groupscript Function GetGroupByFactionID(GlobalVariable FactionID)
  sq_groupscript returnVal = None
  Int I = 0
  While returnVal == None && I < Groups.Length
    sq_groupscript currentGroup = Groups[I]
    If currentGroup.FactionID == FactionID
      returnVal = currentGroup
    EndIf
    I += 1
  EndWhile
  Return returnVal
EndFunction

sq_groupscript Function GetGroupByFactionIDValue(Int FactionIDValue)
  sq_groupscript returnVal = None
  Int I = 0
  While returnVal == None && I < Groups.Length
    sq_groupscript currentGroup = Groups[I]
    If currentGroup.FactionID.GetValue() == FactionIDValue as Float
      Return currentGroup
    EndIf
    I += 1
  EndWhile
  Return returnVal
EndFunction

Int Function GetGroupFactionIDValueByActor(Actor ActorToGetGroupFor, Bool ValidateActor)
  Return Self.GetGroupByActor(ActorToGetGroupFor, ValidateActor).FactionID.GetValue() as Int
EndFunction

Function DebugSpawnGroupReference(ObjectReference SpawnAtRef, sq_groupscript GroupToSpawnFrom, sq_groupoccupationscript OccupationToSpawn, GlobalVariable SpawnType, GlobalVariable Gender)
  GroupToSpawnFrom.SpawnGroupReference(SpawnAtRef, OccupationToSpawn, None, False, SpawnType, Gender, False, None, False, -1)
EndFunction

Function SetDebugGroupRoleEnemy(GlobalVariable SQ_GroupID)
  SQ_Debug_GroupRole_Enemy.SetValue(SQ_GroupID.GetValueInt() as Float)
EndFunction

Function SetDebugGroupRoleVictim(GlobalVariable SQ_GroupID)
  SQ_Debug_GroupRole_Victim.SetValue(SQ_GroupID.GetValueInt() as Float)
EndFunction

Function SetDebugGroupRoleNeutral(GlobalVariable SQ_GroupID)
  SQ_Debug_GroupRole_Neutral.SetValue(SQ_GroupID.GetValueInt() as Float)
EndFunction

Function SetDebugGroupRoleBiomePredator(GlobalVariable SQ_GroupID)
  SQ_Debug_GroupRole_BiomePredator.SetValue(SQ_GroupID.GetValueInt() as Float)
EndFunction

Function SetDebugGroupRoleBiomePrey(GlobalVariable SQ_GroupID)
  SQ_Debug_GroupRole_BiomePrey.SetValue(SQ_GroupID.GetValueInt() as Float)
EndFunction

Function SetDebugGroupRoleBiomeCritter(GlobalVariable SQ_GroupID)
  SQ_Debug_GroupRole_BiomeCritter.SetValue(SQ_GroupID.GetValueInt() as Float)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
