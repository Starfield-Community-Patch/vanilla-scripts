ScriptName OutpostHarvesterFaunaScript Extends OutpostEventHandlerParent
{ manages creating the appropriate actor for a fauna harvester }

;-- Structs -----------------------------------------
Struct FaunaCreationData
  Keyword CreatureKeyword
  Int createCount
EndStruct

Struct ResourceGlobalData
  ActorValue resourceAV
  GlobalVariable resourceGlobal
EndStruct


;-- Variables ---------------------------------------
Int InitTimerID = 3 Const
Int RespawnResetTimerID = 2 Const
Float RespawnSeconds = 0.0
Int RespawnTimerID = 1 Const
Bool allowRespawn = True

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard createdActorsGuard

;-- Properties --------------------------------------
Group Required_Properties
  Bool Property DeleteActorWhenDestroyed = True Auto Const
  { if TRUE, actor will be deleted when this object is destroyed (actor will be recreated when object is repaired) }
  Keyword Property OutpostLinkCreatedActorTarget Auto Const mandatory
  { AUTOFILL - used to get reference to link created actor to }
  outpostharvesterfaunascript:faunacreationdata[] Property FaunaCreation Auto Const mandatory
  { array used to decide how many to create
        order with highest CreationCount first in the array }
  Faction Property OutpostFaunaFaction Auto Const mandatory
  { faction to put on all created actors to be friends with player }
  ReferenceAlias Property OutpostFauna Auto Const mandatory
  { alias on SQ_Parent used to stamp data on created fauna }
  ActorValue Property OrganicResourceAV Auto hidden
  { set by menu from build menu event }
  ActorValue Property HandScannerTarget Auto mandatory
  { used to tag created actors }
EndGroup

Group Optional_Properties
  LocationRefType Property CreatedActorBaseRefType Auto Const
  { OPTIONAL: loc ref to tag created actor }
  Keyword Property OutpostLinkCreatedActor Auto Const
  { OPTIONAL: used to link actor to this ref }
  outpostharvesterfaunascript:resourceglobaldata[] Property ResourceGlobals Auto Const
  { OPTIONAL - array of global variables to update when the builder is set to build the matching resource AV }
  Float Property ResourceGlobalValueToSet = 25.0 Auto Const
  { value to set resourceGlobal to }
EndGroup

Group Respawn_Properties
{ How long to wait after an actor dies before respawning? }
  Float Property RespawnSecondsMin = 10.0 Auto Const
  { min value for RespawnSeconds - this is the starting value }
  Float Property RespawnSecondsMax = 120.0 Auto Const
  { max that RespawnSeconds is allowed to reach }
  Float Property RespawnSecondsAddPerDeath = 10.0 Auto Const
  { how many seconds to add to RespawnSeconds per death }
  Float Property RespawnResetSeconds = 900.0 Auto Const
  { how long after last death to reset Respawn time to min }
EndGroup

Actor[] Property createdActors Auto hidden

;-- Functions ---------------------------------------

Event Actor.OnEnterBleedout(Actor akSource)
  ; Empty function
EndEvent

Function HandleOnWorkshopObjectPlaced(ObjectReference akReference)
  ; Empty function
EndFunction

Event OnInit()
  Guard createdActorsGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    createdActors = new Actor[0]
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  RespawnSeconds = RespawnSecondsMin
  Self.StartTimer(1.0, InitTimerID)
EndEvent

Event OnBuilderMenuSelect(ActorValue akActorValue)
  OrganicResourceAV = akActorValue
  Self.UpdateResource()
  If ResourceGlobals.Length > 0
    Int resourceGlobalIndex = ResourceGlobals.findstruct("resourceAV", OrganicResourceAV, 0)
    If resourceGlobalIndex > -1
      GlobalVariable globalToSet = ResourceGlobals[resourceGlobalIndex].resourceGlobal
      If globalToSet as Bool && globalToSet.GetValue() != ResourceGlobalValueToSet
        globalToSet.SetValue(ResourceGlobalValueToSet)
      EndIf
    EndIf
  EndIf
EndEvent

Event Actor.OnDeath(Actor akSource, ObjectReference akKiller)
  Self.StartTimer(RespawnSeconds, RespawnTimerID)
EndEvent

Event OnObjectRepaired(ObjectReference akReference)
  Self.CreateActors()
EndEvent

Function HandleOnWorkshopObjectRemoved(ObjectReference akReference)
  Self.ClearCreatedActors(True)
EndFunction

Event OnObjectDestroyed(ObjectReference akReference)
  If DeleteActorWhenDestroyed
    Self.ClearCreatedActors(True)
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == RespawnTimerID
    Self.RespawnCreatedActor()
  ElseIf aiTimerID == RespawnResetTimerID
    RespawnSeconds = RespawnSecondsMin
  ElseIf aiTimerID == InitTimerID
    Self.UpdateResource()
  EndIf
EndEvent

Function UpdateResource()
  Self.ClearCreatedActors(True)
  Self.CreateActors()
EndFunction

Function ClearCreatedActors(Bool bDeleteActor)
  Guard createdActorsGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Int I = createdActors.Length - 1
    While I > -1
      Self.ClearCreatedActor(createdActors[I], bDeleteActor)
      createdActors.removelast()
      I -= 1
    EndWhile
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function ClearCreatedActor(Actor createdActorRef, Bool bDeleteActor)
  If createdActorRef != None
    Self.UnregisterForRemoteEvent(createdActorRef as ScriptObject, "OnDeath")
    Self.UnregisterForRemoteEvent(createdActorRef as ScriptObject, "OnEnterBleedout")
    If bDeleteActor
      createdActorRef.Delete()
    EndIf
    createdActorRef = None
  EndIf
EndFunction

Function RespawnCreatedActor()
  Guard createdActorsGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Bool respawnedActor = False
    Int I = 0
    While I < createdActors.Length && respawnedActor == False
      Actor createdActorRef = createdActors[I]
      If createdActorRef.IsDead()
        If allowRespawn && respawnedActor == False
          respawnedActor = True
          createdActors[I] = Self.CreateActor(None)
        EndIf
      EndIf
      I += 1
    EndWhile
    Self.CheckForRespawnOrDestroy()
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function CreateActors()
  Guard createdActorsGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If createdActors == None
      createdActors = new Actor[0]
    EndIf
    If createdActors.Length <= 0
      Actor newActor = Self.CreateActor(None)
      If newActor
        createdActors.add(newActor, 1)
        Int I = 0
        Int createCount = 0
        While I < FaunaCreation.Length && createCount == 0
          outpostharvesterfaunascript:faunacreationdata theData = FaunaCreation[I]
          If newActor.HasKeyword(theData.CreatureKeyword)
            createCount = theData.createCount
          EndIf
          I += 1
        EndWhile
        If createCount > 1
          createCount -= 1
          I = 0
          While I < createCount
            Actor createdActor = Self.CreateActor(None)
            createdActors.add(createdActor, 1)
            I += 1
          EndWhile
        EndIf
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Actor Function CreateActor(Actor createdActorRef)
  If createdActorRef
    If createdActorRef.IsDead() == False
      createdActorRef.RestoreValue(Game.GetHealthAV(), 9999.0)
    EndIf
  ElseIf OrganicResourceAV
    ObjectReference workshopRef = Self.GetWorkshop()
    ActorBase createdActorBase = Self.GetActorBaseForResource(OrganicResourceAV)
    If createdActorBase
      createdActorRef = Self.PlaceAtMe(createdActorBase as Form, 1, False, True, True, None, None, True) as Actor
      createdActorRef.IgnoreFriendlyHits(True)
      createdActorRef.SetValue(HandScannerTarget, 1.0)
      createdActorRef.SetScanned(True)
      OutpostFauna.ApplyToRef(createdActorRef as ObjectReference)
      createdActorRef.AddToFaction(OutpostFaunaFaction)
      Self.RegisterForRemoteEvent(createdActorRef as ScriptObject, "OnDeath")
      Self.RegisterForRemoteEvent(createdActorRef as ScriptObject, "OnEnterBleedout")
      If OutpostLinkCreatedActor
        ObjectReference createdActorTargetRef = Self.GetLinkedRef(OutpostLinkCreatedActorTarget)
        If createdActorTargetRef == None
          createdActorTargetRef = Self as ObjectReference
        EndIf
        createdActorRef.SetLinkedRef(createdActorTargetRef, OutpostLinkCreatedActor, False)
        createdActorRef.MoveTo(createdActorTargetRef, 0.0, 0.0, 0.0, True, False)
      EndIf
      If CreatedActorBaseRefType
        Location workshopLocation = workshopRef.GetCurrentLocation()
        createdActorRef.SetLocRefType(workshopLocation, CreatedActorBaseRefType)
      EndIf
      createdActorRef.Enable(False)
    EndIf
  EndIf
  Return createdActorRef
EndFunction

Function CheckForRespawnOrDestroy()
  allowRespawn = False
  Int deadCount = 0
  Int I = 0
  While I < createdActors.Length
    If createdActors[I].IsDead()
      deadCount += 1
    EndIf
    I += 1
  EndWhile
  If deadCount >= createdActors.Length
    Self.DamageObject(9999.0)
    Self.SetDestroyed(True)
    Self.ClearCreatedActors(False)
  ElseIf deadCount > 0
    Self.StartTimer(RespawnSeconds, RespawnTimerID)
    RespawnSeconds += RespawnSecondsAddPerDeath
    RespawnSeconds = Math.Min(RespawnSecondsMax, RespawnSeconds)
    Self.StartTimer(RespawnResetSeconds, RespawnResetTimerID)
  EndIf
  allowRespawn = True
EndFunction
