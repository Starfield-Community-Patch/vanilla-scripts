ScriptName TestNPCSimpleSpawn Extends ObjectReference

;-- Variables ---------------------------------------
Int CurrentGroupSize
FormList FactionFormList
Int NPCTypeIndex
Actor[] SpawnedActors

;-- Properties --------------------------------------
Group SharedDefaults collapsedonref
  ActorBase Property ActorToSpawn Auto mandatory
  Keyword Property SpawnLocationsKeyword Auto Const mandatory
  Keyword Property DestinationLocationKeyword Auto Const mandatory
  Outfit[] Property AllTestOutfits Auto Const
  wwiseevent Property PositiveSoundEvent Auto Const
  Keyword Property PatrolTypeKeyword Auto
EndGroup

Group Settings
  Int Property GroupSize = 3 Auto
  ObjectReference Property GroupSpawnButton Auto Const
  ObjectReference Property SingleSpawnButton Auto Const
  ObjectReference Property KillAllButton Auto Const
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  SpawnedActors = new Actor[0]
  CurrentGroupSize = GroupSize
EndEvent

Event OnActivate(ObjectReference akActionRef)
  PositiveSoundEvent.Play(Self as ObjectReference, None, None)
  If akActionRef == GroupSpawnButton
    CurrentGroupSize == GroupSize
    Self.SpawnActors()
  ElseIf akActionRef == SingleSpawnButton
    CurrentGroupSize = 1
    Self.SpawnActors()
  ElseIf akActionRef == KillAllButton
    Self.KillAllNPCs()
  EndIf
EndEvent

Function SpawnActors()
  Self.KillAllNPCs()
  ObjectReference[] SpawnLocations = Self.GetLinkedRefChain(SpawnLocationsKeyword, 100)
  Int I = 0
  Int j = 0
  Actor newActor = None
  Actor previousActor = None
  While I < SpawnLocations.Length
    Outfit outfitToUse = AllTestOutfits[I % AllTestOutfits.Length]
    newActor = SpawnLocations[I].PlaceActorAtMe(ActorToSpawn, 4, None, False, False, True, None, True)
    SpawnedActors.add(newActor, 1)
    newActor.RemoveFromAllFactions()
    newActor.SetLinkedRef(SpawnLocations[I].GetLinkedRef(DestinationLocationKeyword), PatrolTypeKeyword, True)
    newActor.SetOutfit(outfitToUse, False)
    newActor.EvaluatePackage(False)
    If CurrentGroupSize > 1
      j = 0
      While j < CurrentGroupSize - 1
        previousActor = newActor
        newActor = SpawnLocations[I].PlaceActorAtMe(ActorToSpawn, 4, None, False, False, True, None, True)
        SpawnedActors.add(newActor, 1)
        newActor.RemoveFromAllFactions()
        newActor.SetLinkedRef(previousActor as ObjectReference, None, True)
        newActor.SetOutfit(outfitToUse, False)
        newActor.EvaluatePackage(False)
        j += 1
      EndWhile
    EndIf
    I += 1
    Utility.Wait(3.0)
  EndWhile
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

Actor[] Function GetSpawnedActors()
  Return SpawnedActors
EndFunction

Function SetDestinationKeyword(Keyword newKeyword)
  PatrolTypeKeyword = newKeyword
EndFunction

Function SetFaction(FormList newFactionFormList)
  FactionFormList = newFactionFormList
  ActorToSpawn = FactionFormList.GetAt(NPCTypeIndex) as ActorBase
EndFunction

Function SetClass(Int newNPCTypeIndex)
  NPCTypeIndex = newNPCTypeIndex
  ActorToSpawn = FactionFormList.GetAt(NPCTypeIndex) as ActorBase
EndFunction
