ScriptName SQ_Airlock_QuestScript Extends Quest
{ handles adding/removing actors to a ref collection meaning they are "inside" an airlocked location.Achievements_TrackedStatsScript }

;-- Variables ---------------------------------------
Bool registeredForOnPlayerTeleportEvent
Bool registeredForPlayerEvent

;-- Properties --------------------------------------
Group Autofill
  RefCollectionAlias Property Alias_InsideActors Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  ; Empty function
EndEvent

Function RegisterForOnPlayerFollowerWarp()
  registeredForPlayerEvent = True
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerFollowerWarp")
EndFunction

Function RegisterForOnPlayerTeleport()
  registeredForOnPlayerTeleportEvent = True
  Self.RegisterForPlayerTeleport()
EndFunction

Event Actor.OnPlayerFollowerWarp(Actor akSender, ObjectReference akFollower)
  If Alias_InsideActors.Find(Game.GetPlayer() as ObjectReference) < 0
    Alias_InsideActors.RemoveRef(akFollower)
  EndIf
EndEvent

Event OnPlayerTeleport()
  Self.RemoveActorFromInsideActorsAlias(Game.GetPlayer())
EndEvent

Function SetActorInside(Actor ActorToSet, Bool SetInside)
  If SetInside
    Alias_InsideActors.AddRef(ActorToSet as ObjectReference)
  Else
    Alias_InsideActors.RemoveRef(ActorToSet as ObjectReference)
  EndIf
  If registeredForPlayerEvent == False
    Self.RegisterForOnPlayerFollowerWarp()
  EndIf
  If registeredForOnPlayerTeleportEvent == False
    Self.RegisterForOnPlayerTeleport()
  EndIf
EndFunction

Function SetActorsInside(Actor[] ActorsToSet, Bool SetInside)
  Int I = 0
  While I < ActorsToSet.Length
    If ActorsToSet[I]
      Self.SetActorInside(ActorsToSet[I], SetInside)
    EndIf
    I += 1
  EndWhile
EndFunction

Function RemoveActorFromInsideActorsAlias(Actor akActor)
  Alias_InsideActors.RemoveRef(akActor as ObjectReference)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
