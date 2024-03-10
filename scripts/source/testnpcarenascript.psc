ScriptName TestNPCArenaScript Extends ObjectReference

;-- Variables ---------------------------------------
FormList AllBlueTeamNPCTypes
FormList AllRedTeamNPCTypes
ActorBase[] BlueActorsToSpawn
ActorBase[] RedActorsToSpawn
Actor[] SpawnedActors

;-- Properties --------------------------------------
Group SharedDefaults collapsedonref
  ActorBase Property ActorToSpawn Auto mandatory
  { Actor to spawn for the first group }
  Faction Property TestNPCBehaviorRedTeam Auto Const mandatory
  { Red Team Faction }
  Faction Property TestNPCBehaviorBlueTeam Auto Const mandatory
  { Blue Team Faction }
  Faction Property TestNPCPlayerEnemyFaction Auto Const mandatory
  { Faction for fighting against the player. }
  Keyword Property RedSpawnLocationsKeyword Auto Const mandatory
  { Where the red team and noncombat NPCs will spawn. }
  Keyword Property BlueSpawnLocationsKeyword Auto Const mandatory
  { Where the blue team will spawn }
  Keyword Property DestinationLocationsKeyword Auto Const mandatory
  { Where the spawned NPCs will go. Shared for combat NPCs, set through linked refs from spawn points for non combat NPCs. }
  Keyword Property TestNPCSpawnLocationsKeyword Auto Const mandatory
  { Used to spawn and patrol NPCs if there are no spawn locations or destinations linked to the spawn activator }
  Keyword Property PatrolTypeKeyword Auto
  { Used to set run, jog, etc. for noncombat NPCs. should contain any patrol styles to be tested. }
  Keyword Property SandboxKeyword Auto Const mandatory
  { For Sandboxing NPCs }
  Outfit[] Property AllTestOutfits Auto Const mandatory
  { Used to differentiate groups of Noncombat NPCs }
  Outfit Property BlueOutfit Auto Const mandatory
  Outfit Property RedOutfit Auto Const mandatory
  wwiseevent Property PositiveSoundEvent Auto Const mandatory
  wwiseevent Property NegativeSoundEvent Auto Const mandatory
  FormList Property AllFactionFormList Auto Const mandatory
  { Form List of FormLists, for choosing random factions }
  Activator Property TestNPCSpawnMarker Auto Const mandatory
  { This marker is placed when using quick placement. }
  VoiceType Property NPCNoLinesVoiceType Auto Const
  { Select a voice type override for all spawned NPCs }
EndGroup

Group Inputs
  Int Property RedTeamSize = 1 Auto mandatory
  { Number of Actors to spawn for the first group }
  Int Property BlueTeamSize = 1 Auto mandatory
  { Number of Actors to spawn for the second group }
  ObjectReference[] Property AddToRedTeamButton Auto Const
  { These buttons will increase the team size to be spawned for the Red Team }
  ObjectReference[] Property AddToBlueTeamButton Auto Const
  { These buttons will increase the team size to be spawned for the Blue Team }
  ObjectReference[] Property SubtractFromRedTeamButton Auto Const
  { These buttons will reduce the team size to be spawned for the Red Team }
  ObjectReference[] Property SubtractFromBlueTeamButton Auto Const
  { These buttons will reduce the team size to be spawned for the Blue Team }
  Bool Property SpawnOnLoad Auto Const
  { Should a default NPC spawn into the pathing test area on load? }
  Bool Property VersusPlayer = False Auto
  Int Property HealthBoost = 200 Auto
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  SpawnedActors = new Actor[0]
  RedActorsToSpawn = new ActorBase[0]
  BlueActorsToSpawn = new ActorBase[0]
  AllRedTeamNPCTypes = AllFactionFormList.GetAt(1) as FormList
  AllBlueTeamNPCTypes = AllFactionFormList.GetAt(0) as FormList
  Int count = 0
  While count < RedTeamSize
    RedActorsToSpawn.add(ActorToSpawn, 1)
    count += 1
  EndWhile
  count = 0
  While count < BlueTeamSize
    BlueActorsToSpawn.add(ActorToSpawn, 1)
    count += 1
  EndWhile
EndEvent

Event OnActivate(ObjectReference akActionRef)
  PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None)
  If AddToRedTeamButton.find(akActionRef, 0) >= 0
    RedActorsToSpawn.add(ActorToSpawn, 1)
  ElseIf AddToBlueTeamButton.find(akActionRef, 0) >= 0
    BlueActorsToSpawn.add(ActorToSpawn, 1)
  ElseIf SubtractFromRedTeamButton.find(akActionRef, 0) >= 0
    RedActorsToSpawn.removelast()
  ElseIf SubtractFromBlueTeamButton.find(akActionRef, 0) >= 0
    BlueActorsToSpawn.removelast()
  EndIf
EndEvent

Function SpawnTeams(ObjectReference akActionRef)
  ObjectReference[] SpawnLocationsRedTeam = akActionRef.GetLinkedRefChain(RedSpawnLocationsKeyword, 100)
  ObjectReference[] SpawnLocationsBlueTeam = akActionRef.GetLinkedRefChain(BlueSpawnLocationsKeyword, 100)
  ObjectReference[] DestinationLocations = akActionRef.GetLinkedRefChain(DestinationLocationsKeyword, 100)
  If SpawnLocationsRedTeam.Length == 0 && SpawnLocationsBlueTeam.Length == 0
    Self.RandomNavLocations(akActionRef)
    SpawnLocationsRedTeam = Self.FindAllReferencesWithKeyword(TestNPCSpawnLocationsKeyword as Form, 1000.0)
  EndIf
  If DestinationLocations.Length == 0
    DestinationLocations = SpawnLocationsRedTeam
  EndIf
  Int count = 0
  While count < RedActorsToSpawn.Length
    Actor newActor = SpawnLocationsRedTeam[Utility.RandomInt(0, SpawnLocationsRedTeam.Length - 1)].PlaceActorAtMe(RedActorsToSpawn[count], 1, None, False, False, True, None, True)
    newActor.RemoveFromAllFactions()
    If VersusPlayer
      newActor.AddToFaction(TestNPCPlayerEnemyFaction)
    Else
      newActor.AddToFaction(TestNPCBehaviorRedTeam)
    EndIf
    newActor.SetLinkedRef(DestinationLocations[Utility.RandomInt(0, DestinationLocations.Length - 1)], PatrolTypeKeyword, True)
    If HealthBoost > 0
      newActor.SetValue(Game.GetHealthAV(), HealthBoost as Float)
    EndIf
    newActor.EvaluatePackage(False)
    SpawnedActors.add(newActor, 1)
    count += 1
  EndWhile
  count = 0
  While count < BlueActorsToSpawn.Length
    Actor newactor = SpawnLocationsBlueTeam[Utility.RandomInt(0, SpawnLocationsBlueTeam.Length - 1)].PlaceActorAtMe(BlueActorsToSpawn[count], 1, None, False, False, True, None, True)
    newactor.RemoveFromAllFactions()
    newactor.AddToFaction(TestNPCBehaviorBlueTeam)
    newactor.SetLinkedRef(DestinationLocations[Utility.RandomInt(0, DestinationLocations.Length - 1)], PatrolTypeKeyword, True)
    If HealthBoost > 0
      newactor.SetValue(Game.GetHealthAV(), HealthBoost as Float)
    EndIf
    newactor.EvaluatePackage(False)
    SpawnedActors.add(newactor, 1)
    count += 1
  EndWhile
EndFunction

Function AddSpecificNPC(Int classToAddIndex, Int TeamToAddTo)
  If TeamToAddTo == 1 && AllRedTeamNPCTypes.GetAt(classToAddIndex) as Bool
    RedActorsToSpawn.add(AllRedTeamNPCTypes.GetAt(classToAddIndex) as ActorBase, 1)
    PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None)
  ElseIf TeamToAddTo == 2 && AllBlueTeamNPCTypes.GetAt(classToAddIndex) as Bool
    BlueActorsToSpawn.add(AllBlueTeamNPCTypes.GetAt(classToAddIndex) as ActorBase, 1)
    PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None)
  Else
    NegativeSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None)
  EndIf
EndFunction

Function ClearActorsToSpawn()
  RedActorsToSpawn.clear()
  BlueActorsToSpawn.clear()
EndFunction

Function KillAllNPCs()
  Int count = 0
  While count < SpawnedActors.Length
    Actor curItem = SpawnedActors[count]
    curItem.KillSilent(None)
    count += 1
  EndWhile
  SpawnedActors.clear()
EndFunction

Function SetRandomTeams(Bool andSpawn, Bool onlyRed, ObjectReference akActionRef, Int randMin, Int randMax)
  RedActorsToSpawn.clear()
  BlueActorsToSpawn.clear()
  RedTeamSize = Utility.RandomInt(randMin, randMax)
  BlueTeamSize = Utility.RandomInt(randMin, randMax)
  If onlyRed
    BlueTeamSize = 0
  EndIf
  Int count = 0
  While count < RedTeamSize
    RedActorsToSpawn.add(AllRedTeamNPCTypes.GetAt(Utility.RandomInt(0, AllRedTeamNPCTypes.GetSize() - 1)) as ActorBase, 1)
    count += 1
  EndWhile
  count = 0
  While count < BlueTeamSize
    BlueActorsToSpawn.add(AllBlueTeamNPCTypes.GetAt(Utility.RandomInt(0, AllBlueTeamNPCTypes.GetSize() - 1)) as ActorBase, 1)
    count += 1
  EndWhile
  If andSpawn && akActionRef as Bool
    Self.SpawnTeams(akActionRef)
  EndIf
EndFunction

Function SetFactionToSpawn(FormList newFactionList, Int TeamNumber)
  If TeamNumber == 1
    PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None)
    Int count = 0
    While count < RedActorsToSpawn.Length
      Int index = AllRedTeamNPCTypes.Find(RedActorsToSpawn[count] as Form)
      If index > -1
        If newFactionList.GetAt(index)
          RedActorsToSpawn[count] = newFactionList.GetAt(index) as ActorBase
        Else
          RedActorsToSpawn[count] = newFactionList.GetAt(0) as ActorBase
        EndIf
      Else
        RedActorsToSpawn[count] = newFactionList.GetAt(0) as ActorBase
      EndIf
      count += 1
    EndWhile
    AllRedTeamNPCTypes = newFactionList
  ElseIf TeamNumber == 2
    Int count = 0
    PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None)
    While count < BlueActorsToSpawn.Length
      Int index = AllBlueTeamNPCTypes.Find(BlueActorsToSpawn[count] as Form)
      If index > -1
        If newFactionList.GetAt(index)
          BlueActorsToSpawn[count] = newFactionList.GetAt(index) as ActorBase
        Else
          BlueActorsToSpawn[count] = newFactionList.GetAt(0) as ActorBase
        EndIf
      Else
        BlueActorsToSpawn[count] = newFactionList.GetAt(0) as ActorBase
      EndIf
      count += 1
    EndWhile
    AllBlueTeamNPCTypes = newFactionList
  Else
    NegativeSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None)
  EndIf
EndFunction

Function SpawnNonCombatActors(Int GroupSize, ObjectReference LinkRefHub)
  Self.KillAllNPCs()
  ObjectReference[] SpawnLocations = LinkRefHub.GetLinkedRefChain(RedSpawnLocationsKeyword, 100)
  Int I = 0
  Int j = 0
  Actor newActor = None
  Actor previousActor = None
  While I < SpawnLocations.Length
    Outfit outfitToUse = AllTestOutfits[I % AllTestOutfits.Length]
    If RedActorsToSpawn[0]
      newActor = SpawnLocations[I].PlaceActorAtMe(RedActorsToSpawn[0], 4, None, False, False, True, None, True)
    Else
      newActor = SpawnLocations[I].PlaceActorAtMe(AllRedTeamNPCTypes.GetAt(0) as ActorBase, 4, None, False, False, True, None, True)
    EndIf
    SpawnedActors.add(newActor, 1)
    newActor.RemoveFromAllFactions()
    If SpawnLocations[I].GetLinkedRef(DestinationLocationsKeyword)
      newActor.SetLinkedRef(SpawnLocations[I].GetLinkedRef(DestinationLocationsKeyword), PatrolTypeKeyword, True)
      PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None)
    ElseIf SpawnLocations[I].GetLinkedRef(SandboxKeyword)
      newActor.SetLinkedRef(SpawnLocations[I].GetLinkedRef(SandboxKeyword), SandboxKeyword, True)
      PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None)
    Else
      NegativeSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None)
    EndIf
    newActor.SetOutfit(outfitToUse, False)
    newActor.EvaluatePackage(False)
    If GroupSize > 1
      j = 0
      While j < GroupSize - 1
        previousActor = newActor
        If RedActorsToSpawn[j + 1]
          newActor = SpawnLocations[I].PlaceActorAtMe(RedActorsToSpawn[j + 1], 4, None, False, False, True, None, True)
        Else
          newActor = SpawnLocations[I].PlaceActorAtMe(AllRedTeamNPCTypes.GetAt(0) as ActorBase, 4, None, False, False, True, None, True)
        EndIf
        SpawnedActors.add(newActor, 1)
        newActor.RemoveFromAllFactions()
        newActor.SetLinkedRef(previousActor as ObjectReference, None, True)
        newActor.SetOutfit(outfitToUse, False)
        newActor.EvaluatePackage(False)
        j += 1
      EndWhile
    EndIf
    I += 1
    Utility.Wait(1.0)
  EndWhile
EndFunction

Function SetPatrolSpeed(Keyword newPatrolKeyword)
  Int count = 0
  While count < SpawnedActors.Length
    ObjectReference linkedObject = SpawnedActors[count].GetLinkedRef(PatrolTypeKeyword)
    SpawnedActors[count].SetLinkedRef(None, PatrolTypeKeyword, True)
    SpawnedActors[count].SetLinkedRef(linkedObject, newPatrolKeyword, True)
    SpawnedActors[count].EvaluatePackage(False)
    count += 1
  EndWhile
  PatrolTypeKeyword = newPatrolKeyword
  PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None)
EndFunction

FormList Function GetFactionFormList(Int TeamNumber)
  FormList factionFormList = None
  If TeamNumber == 1
    factionFormList = AllRedTeamNPCTypes
  ElseIf TeamNumber == 2
    factionFormList = AllBlueTeamNPCTypes
  EndIf
  Return factionFormList
EndFunction

Bool Function RandomNavLocations(ObjectReference akActionRef)
  Int range = 50
  Int numberOfSpawnLocations = 10
  ObjectReference[] newMarkers = new ObjectReference[0]
  Int I = 0
  While I < numberOfSpawnLocations
    ObjectReference newSpawnMarker = Self.PlaceAtMe(TestNPCSpawnMarker as Form, 1, False, False, True, None, None, True)
    newMarkers.add(newSpawnMarker, 1)
    I += 1
  EndWhile
  I = 0
  While I < numberOfSpawnLocations
    newMarkers[I].SetPosition(newMarkers[I].GetPositionX() + Utility.RandomInt(-range, range) as Float, newMarkers[I].GetPositionY() + Utility.RandomInt(-range, range) as Float, newMarkers[I].GetPositionZ())
    I += 1
  EndWhile
  I = 0
  While I < numberOfSpawnLocations
    newMarkers[I].MoveToNearestNavmeshLocation()
    I += 1
  EndWhile
  I = 0
  While I < newMarkers.Length - 1
    newMarkers[I].SetLinkedRef(newMarkers[I + 1], None, True)
    I += 1
  EndWhile
  newMarkers.clear()
  Return True
EndFunction
