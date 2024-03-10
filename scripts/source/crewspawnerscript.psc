ScriptName CrewSpawnerScript Extends ObjectReference
{ Used to set spawn limits for the location by setting this data on the reference found by SQ_Crew_SpawnManager to spawn at }

;-- Variables ---------------------------------------
Bool canSpawnCrew = True
Int respawnIntervalTimerID = 1 Const
Actor[] spawnedCrew

;-- Properties --------------------------------------
Group SpawnLimits
  Int Property MaxNumberToSpawn = 6 Auto Const
  { the max number to spawn }
  Int Property RespawnIntervalLocalDays = 3 Auto Const
  { the interval to respawn these actors in local days }
EndGroup

Group ActorData
  Faction Property CrewCrimeFaction Auto Const
  { the crime faction to assign }
EndGroup

Group Autofill
  Keyword Property LinkGenericCrewSpawnMarker Auto Const mandatory
  { the keyword that links generic crew members to this spawn marker }
EndGroup


;-- Functions ---------------------------------------

Bool Function GetCanSpawnCrew()
  Return canSpawnCrew
EndFunction

Function StartRespawnTimer()
  canSpawnCrew = False
  Self.GoToState("RespawnTimer")
EndFunction

Function ClearSpawnedCrewArray()
  spawnedCrew.clear()
EndFunction

Function AddToSpawnedCrewArray(Actor crewMember)
  If !spawnedCrew
    spawnedCrew = new Actor[0]
  EndIf
  spawnedCrew.add(crewMember, 1)
  crewMember.SetLinkedRef(Self as ObjectReference, LinkGenericCrewSpawnMarker, True)
EndFunction

Function RemoveFromSpawnedCrewArray(Actor crewMember)
  Int foundIndex = spawnedCrew.find(crewMember, 0)
  If foundIndex > -1
    spawnedCrew.remove(foundIndex, 1)
    crewMember.SetLinkedRef(None, LinkGenericCrewSpawnMarker, True)
  EndIf
EndFunction

Function PrepareForRespawn()
  Int I = 0
  While I < spawnedCrew.Length
    Actor theCrew = spawnedCrew[I]
    If theCrew.GetCrewAssignment() == None
      theCrew.DisableNoWait(False)
      theCrew.Delete()
    EndIf
    I += 1
  EndWhile
  Self.ClearSpawnedCrewArray()
  canSpawnCrew = True
EndFunction

;-- State -------------------------------------------
State LoadedAfterTimerComplete

  Event OnBeginState(String asOldState)
    ; Empty function
  EndEvent

  Event OnUnload()
    Self.PrepareForRespawn()
  EndEvent
EndState

;-- State -------------------------------------------
State RespawnTimer

  Event OnTimerGameTime(Int aiTimerID)
    If aiTimerID == respawnIntervalTimerID
      If Self.Is3DLoaded()
        Self.GoToState("LoadedAfterTimerComplete")
      Else
        Self.PrepareForRespawn()
      EndIf
    EndIf
  EndEvent

  Event OnBeginState(String asOldState)
    Self.StartTimerGameTime(RespawnIntervalLocalDays as Float * Self.GetDayLength(), respawnIntervalTimerID)
  EndEvent
EndState
