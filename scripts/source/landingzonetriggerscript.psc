ScriptName LandingZoneTriggerScript Extends ObjectReference
{ get creatures to flee when a ship lands }

;-- Variables ---------------------------------------
Bool alerted = False
spaceshipreference landedSpaceship
ObjectReference landingMarker

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard AlertGuard

;-- Properties --------------------------------------
Keyword Property SQ_LinkLandingZoneTrigger Auto Const mandatory
{ keyword to link creatures to the landing zone trigger }
ActorValue Property LandingZoneHot Auto Const mandatory
{ AV to set on creatures when the ship is landing/taking off }
Keyword Property LandingZoneTriggerKeyword Auto Const mandatory
{ keyword that links the landing marker TO the landing zone trigger }
Keyword Property DMP_ShipLandingMarker Auto Const mandatory
{ keyword to find NPCs linked to the landing marker }

;-- Functions ---------------------------------------

Event OnUnload()
  Self.ClearLinks()
  Self.AlertLinkedNPCs(False)
EndEvent

Event SpaceshipReference.OnShipLanding(spaceshipreference akSource, Bool abComplete)
  If abComplete
    Self.ClearLinks()
    Self.AlertLinkedNPCs(True)
  EndIf
EndEvent

Event SpaceshipReference.OnShipTakeOff(spaceshipreference akSource, Bool abComplete)
  If abComplete
    landedSpaceship = None
    landingMarker = None
    Self.ClearLinks()
    Self.UnregisterForRemoteEvent(akSource as ScriptObject, "OnShipLanding")
    Self.UnregisterForRemoteEvent(akSource as ScriptObject, "OnShipTakeoff")
  Else
    Self.SetLinks()
    Self.AlertLinkedNPCs(False)
  EndIf
EndEvent

Event Actor.OnCombatListAdded(Actor akSource, Actor akTarget)
  Self.AlertLinkedNPCs(False)
EndEvent

Function BeginLanding(spaceshipreference mySpaceship, ObjectReference mylandingMarker)
  If landedSpaceship == None || landedSpaceship != mySpaceship
    landedSpaceship = mySpaceship
    Self.RegisterForRemoteEvent(mySpaceship as ScriptObject, "OnShipLanding")
    Self.RegisterForRemoteEvent(mySpaceship as ScriptObject, "OnShipTakeoff")
    Self.SetLinks()
  EndIf
  landingMarker = mylandingMarker
EndFunction

Function SetLinks()
  Self.SetValue(LandingZoneHot, 1.0)
  ObjectReference[] triggerRefs = Self.GetAllRefsInTrigger()
  Int I = 0
  While I < triggerRefs.Length
    Actor triggerActor = triggerRefs[I] as Actor
    If triggerActor
      triggerActor.SetLinkedRef(Self as ObjectReference, SQ_LinkLandingZoneTrigger, True)
      triggerActor.EvaluatePackage(False)
    EndIf
    I += 1
  EndWhile
EndFunction

Function ClearLinks()
  Self.SetValue(LandingZoneHot, 0.0)
  ObjectReference[] linkedRefs = Self.GetRefsLinkedToMe(SQ_LinkLandingZoneTrigger, None)
  Int I = 0
  While I < linkedRefs.Length
    ObjectReference theRef = linkedRefs[I]
    theRef.SetLinkedRef(None, SQ_LinkLandingZoneTrigger, True)
    I += 1
  EndWhile
EndFunction

Function AlertLinkedNPCs(Bool bAlerted)
  Guard AlertGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If landingMarker
      If alerted != bAlerted
        alerted = bAlerted
        ObjectReference[] linkedRefs = landingMarker.GetRefsLinkedToMe(DMP_ShipLandingMarker, None)
        Int I = 0
        While I < linkedRefs.Length
          Actor triggerActor = linkedRefs[I] as Actor
          If triggerActor
            If bAlerted
              Self.RegisterForRemoteEvent(triggerActor as ScriptObject, "OnCombatListAdded")
              triggerActor.SetValue(LandingZoneHot, 1.0)
            Else
              Self.UnregisterForRemoteEvent(triggerActor as ScriptObject, "OnCombatListAdded")
              triggerActor.SetValue(LandingZoneHot, 0.0)
            EndIf
            triggerActor.EvaluatePackage(False)
          EndIf
          I += 1
        EndWhile
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction
