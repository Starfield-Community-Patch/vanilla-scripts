ScriptName SQ_Crew_SpawnManagerScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group autofill
  ReferenceAlias Property SpawnMarker Auto Const mandatory
  { autofill }
  RefCollectionAlias Property Alias_SpawnedCrewCollection Auto Const mandatory
  { autofill; REMINDER: these are initially disabled refs }
  Keyword Property LinkGenericCrewSpawnMarker Auto Const mandatory
  { autofill; the keyword to link spawned crew members to the spawn marker }
  Int Property StopStage = 9999 Auto Const
  { The stage to set to shut down this quest. }
EndGroup

Group EnableChances
  Int[] Property EnableChances Auto Const mandatory
  { chance for each roll to enable one of the refs in Alias_SpawnedCrewCollection }
EndGroup


;-- Functions ---------------------------------------

Function RollToEnableRefs()
  crewspawnerscript spawnMarkerRef = SpawnMarker.GetReference() as crewspawnerscript
  If spawnMarkerRef.GetCanSpawnCrew() == False
    Self.SetStopStage()
    Return 
  EndIf
  Int max = spawnMarkerRef.MaxNumberToSpawn
  Faction CrewCrimeFaction = spawnMarkerRef.CrewCrimeFaction
  ObjectReference[] crewArray = Alias_SpawnedCrewCollection.GetArray()
  Int I = 0
  Int iMax = Math.min(max as Float, crewArray.Length as Float) as Int
  If iMax > EnableChances.Length
    iMax = EnableChances.Length
  EndIf
  While I < iMax
    Bool success = Game.GetDieRollSuccess(EnableChances[I], 1, 100, -1, -1)
    If success
      Actor theCrew = crewArray[I] as Actor
      theCrew.Enable(False)
      theCrew.SetCrimeFaction(CrewCrimeFaction)
      spawnMarkerRef.AddToSpawnedCrewArray(theCrew)
      (theCrew as crewrandomvoicescript).TryToSetCrewVoiceType()
    EndIf
    I += 1
  EndWhile
  spawnMarkerRef.StartRespawnTimer()
  Self.SetStopStage()
EndFunction

Function SetStopStage()
  Self.SetStage(StopStage)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
