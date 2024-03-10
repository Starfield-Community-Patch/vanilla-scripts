ScriptName DefaultRefAmbushTrigger2 Extends ObjectReference
{ Alternate ambush trigger system for locations with complex ambush needs. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group OptionalProperties
  Bool Property TriggerIfAnyLinkedActorEntersCombat = True Auto Const
  { Default=True. If True, trigger the ambush when any actor managed by this trigger enters combat. }
  Bool Property TriggerIfAnyLinkedActorIsHit = False Auto Const
  { Default=False. If True, trigger the ambush when any actor managed by this trigger is hit. }
  Faction Property FactionToApplyInAmbush Auto Const
  { Default=None. If set, this faction will be added to the actors controlled by this trigger while they are in ambush, and removed when they emerge. }
  Float Property InitialAmbushDelay = 0.0 Auto Const
  { Default=0. If set, the delay between the event that triggers the ambush and the first creature released from it. }
  Float Property MinAmbushDelay = 0.0 Auto Const
  { Default=0. If set, the minimum delay between releasing actors controlled by this trigger. }
  Float Property MaxAmbushDelay = 0.25 Auto Const
  { Default=0.25. If set, the maximum delay between releasing actors controlled by this trigger. }
EndGroup

Group AutofillProperties
  ActorValue Property AmbushTriggered Auto Const mandatory
  Keyword Property LinkAmbushTrigger Auto Const mandatory
  Keyword Property LinkAmbushSequence Auto Const mandatory
  Keyword Property DMP_AmbushMarker Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event Actor.OnCombatStateChanged(Actor akSource, ObjectReference akTarget, Int aeCombatState)
  Self.TriggerAmbushForActor(akSource)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  Self.TriggerAmbushForActor(akSource as Actor)
EndEvent

Function TriggerAmbush()
  ; Empty function
EndFunction

Actor[] Function GetAmbushTriggerActors()
  Actor[] mySequence = Self.GetLinkedRefChain(LinkAmbushSequence, 100) as Actor[]
  If mySequence == None || mySequence.Length == 0
    Actor[] myChildren = Self.GetRefsLinkedToMe(LinkAmbushTrigger, None) as Actor[]
    If myChildren == None || myChildren.Length == 0
      Return new Actor[0]
    Else
      Return myChildren
    EndIf
  Else
    Actor[] mychildren = Self.GetRefsLinkedToMe(LinkAmbushTrigger, None) as Actor[]
    Int I = 0
    While I < mychildren.Length
      If mySequence.find(mychildren[I], 0) < 0
        mySequence.add(mychildren[I], 1)
      EndIf
      I += 1
    EndWhile
    Return mySequence
  EndIf
EndFunction

Function TriggerAmbushForActor(Actor actorToTrigger)
  If FactionToApplyInAmbush != None
    actorToTrigger.RemoveFromFaction(FactionToApplyInAmbush)
  EndIf
  actorToTrigger.SetValue(AmbushTriggered, 1.0)
  actorToTrigger.EvaluatePackage(False)
EndFunction

;-- State -------------------------------------------
State Triggered

  Event OnBeginState(String asOldState)
    Self.UnregisterForAllEvents()
    Actor[] myActors = Self.GetAmbushTriggerActors()
    Int I = 0
    While I < myActors.Length
      If I == 0
        If InitialAmbushDelay > 0.0
          Utility.Wait(InitialAmbushDelay)
        EndIf
      ElseIf MaxAmbushDelay > 0.0
        Utility.Wait(Utility.RandomFloat(MinAmbushDelay, MaxAmbushDelay))
      EndIf
      Self.TriggerAmbushForActor(myActors[I])
      I += 1
    EndWhile
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event Actor.OnCombatStateChanged(Actor akSource, ObjectReference akTarget, Int aeCombatState)
    Self.TriggerAmbushForActor(akSource)
    Self.GoToState("Triggered")
  EndEvent

  Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
    Self.TriggerAmbushForActor(akSource as Actor)
    Self.GoToState("Triggered")
  EndEvent

  Event OnTriggerEnter(ObjectReference akActionRef)
    Self.GoToState("Triggered")
  EndEvent

  Function TriggerAmbush()
    Self.GoToState("Triggered")
  EndFunction

  Event OnCellLoad()
    Actor[] myActors = Self.GetAmbushTriggerActors()
    If myActors.Length > 0
      Int I = 0
      While I < myActors.Length
        If TriggerIfAnyLinkedActorEntersCombat
          Self.RegisterForRemoteEvent(myActors[I] as ScriptObject, "OnCombatStateChanged")
        EndIf
        If TriggerIfAnyLinkedActorIsHit
          Self.RegisterForHitEvent(myActors[I] as ScriptObject, None, None, None, -1, -1, -1, -1, True)
        EndIf
        If FactionToApplyInAmbush != None
          If myActors[I].GetLinkedRef(DMP_AmbushMarker) != None
            myActors[I].AddToFaction(FactionToApplyInAmbush)
          EndIf
        EndIf
        I += 1
      EndWhile
    EndIf
  EndEvent
EndState
