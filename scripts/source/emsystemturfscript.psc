ScriptName EMSystemTurfScript Extends ObjectReference conditional hidden

;-- Variables ---------------------------------------
Int ActiveActors
Int IdleEncounterTimer = 20
Bool RegisterLock
Bool SendingToSleep = False
Int TotalActors
Int UpdateActorsTimer = 10

;-- Properties --------------------------------------
Group Required_Properties collapsedonref
  emsystemquestscript Property EMSystemQuest Auto Const mandatory
  { The quest that handles all of the encounters. }
  Keyword Property EMSystemLinkToTurf Auto Const mandatory
  { The keyword that each actors will be linked to this turf with. }
  Keyword Property EMSystemLinkToSleep Auto Const mandatory
  { The keyword we link the sleeping actors to furniture with.  So we know which ones should be sleeping. }
  Keyword Property ActorTypeTurret Auto Const mandatory
  { They keyword a turrent actor has, since we treat sleeping turrets differently. }
  Keyword Property LinkAmbushFurniture Auto Const mandatory
EndGroup

Bool Property EncounterActive = False Auto conditional

;-- Functions ---------------------------------------

Function StartUpdateActorsTimer()
  Self.StartTimer(Utility.RandomFloat(5.0, 6.0), UpdateActorsTimer)
EndFunction

Function StartIdleEncounterTimer()
  Self.StartTimer(Utility.RandomFloat(8.0, 10.0), IdleEncounterTimer)
EndFunction

Event OnInit()
  EMSystemQuest.IncrementTotal()
EndEvent

Event OnCellLoad()
  EMSystemQuest.IncrementLoaded()
  Actor[] TurfActors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None)
  If Self.GetTriggerObjectCount() == 0 && TurfActors.Length > 0
    If Self.AllActorsOutOfCombat(None)
      Self.SendToSleep(True, TurfActors)
      Self.StartIdleEncounterTimer()
    Else
      Self.WakeUp(TurfActors)
    EndIf
  EndIf
  Self.StartUpdateActorsTimer()
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == UpdateActorsTimer
    Actor[] TurfActors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None)
    EMSystemQuest.UpdateInactive()
    Self.UpdateActorCount(TurfActors)
    If !EncounterActive
      If Self.GetTriggerObjectCount() == 0
        Self.SendToSleep(False, TurfActors)
      Else
        Self.WakeUp(TurfActors)
      EndIf
    EndIf
    If Self.Is3DLoaded()
      Self.StartUpdateActorsTimer()
    EndIf
  ElseIf aiTimerID == IdleEncounterTimer
    Bool continueTimer = False
    If Self.GetTriggerObjectCount() == 0
      Actor[] turfactors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None)
      If Self.AllActorsOutOfCombat(turfactors)
        If turfactors.Length > 0
          Self.SendToSleep(turfactors as Bool, None)
        EndIf
        continueTimer = True
      EndIf
    Else
      continueTimer = True
    EndIf
    If continueTimer && Self.Is3DLoaded()
      Self.StartIdleEncounterTimer()
    EndIf
  EndIf
EndEvent

Function SendToSleep(Bool bForced, Actor[] SentTurfActors)
  While RegisterLock
    If SendingToSleep
      Return 
    EndIf
    Utility.Wait(1.0)
  EndWhile
  RegisterLock = True
  SendingToSleep = True
  If Self.GetTriggerObjectCount() == 0
    If EncounterActive == True
      EMSystemQuest.DecrementActive()
    EndIf
    Actor[] TurfActors = None
    EncounterActive = False
    If SentTurfActors
      TurfActors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None)
    Else
      TurfActors = SentTurfActors
    EndIf
    Int maxSize = TurfActors.Length
    Int count = 0
    Self.StopCombatOnAll(TurfActors)
    While count < maxSize
      Actor turfActor = TurfActors[count]
      If turfActor.GetLinkedRef(EMSystemLinkToSleep) as Bool && (bForced || turfActor.IsAIEnabled() || turfActor.GetSitState() != 3 && turfActor.GetSleepState() != 3)
        turfActor.EvaluatePackage(False)
        If bForced && !turfActor.HasKeyword(ActorTypeTurret)
          If turfActor.GetLinkedRef(LinkAmbushFurniture)
            turfActor.EnableAI(True, False)
            Utility.Wait(0.100000001)
            turfActor.SnapIntoInteraction(turfActor.GetLinkedRef(EMSystemLinkToSleep))
            Utility.Wait(0.100000001)
            turfActor.EnableAI(False, False)
          ElseIf turfActor.GetDistance(turfActor.GetLinkedRef(EMSystemLinkToSleep)) < 128.0
            turfActor.EnableAI(True, False)
            Utility.Wait(0.100000001)
            turfActor.SnapIntoInteraction(turfActor.GetLinkedRef(EMSystemLinkToSleep))
            Utility.Wait(0.100000001)
            turfActor.EnableAI(False, False)
          EndIf
        EndIf
        If turfActor.HasKeyword(ActorTypeTurret)
          turfActor.EnableAI(True, False)
          Utility.Wait(0.100000001)
          turfActor.EnableAI(False, False)
        EndIf
      EndIf
      Self.RegisterForHitEvent(turfActor as ScriptObject, None, None, None, -1, -1, -1, -1, True)
      Self.RegisterForRemoteEvent(turfActor as ScriptObject, "OnSit")
      Self.RegisterForRemoteEvent(turfActor as ScriptObject, "OnDying")
      Self.RegisterForRemoteEvent(turfActor as ScriptObject, "OnDeath")
      Self.RegisterForRemoteEvent(turfActor as ScriptObject, "OnCombatStateChanged")
      count += 1
    EndWhile
  EndIf
  SendingToSleep = False
  RegisterLock = False
EndFunction

Function WakeUp(Actor[] SentTurfActors)
  While RegisterLock
    If EncounterActive
      Return 
    EndIf
    Utility.Wait(1.0)
  EndWhile
  RegisterLock = True
  If EncounterActive == False
    EMSystemQuest.IncrementActive()
    EncounterActive = True
    Actor[] TurfActors = None
    If SentTurfActors
      TurfActors = SentTurfActors
    Else
      TurfActors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None)
    EndIf
    Int maxSize = TurfActors.Length
    Int count = 0
    While count < maxSize
      Actor turfActor = TurfActors[count]
      Self.UnregisterForAllHitEvents(turfActor as ScriptObject)
      Self.UnRegisterForRemoteEvent(turfActor as ScriptObject, "OnCombatStateChanged")
      Self.UnRegisterForRemoteEvent(turfActor as ScriptObject, "OnSit")
      turfActor.EnableAI(True, False)
      turfActor.EvaluatePackage(False)
      Self.RegisterForRemoteEvent(turfActor as ScriptObject, "OnCombatStateChanged")
      count += 1
    EndWhile
  EndIf
  RegisterLock = False
EndFunction

Function StopCombatOnAll(Actor[] SentTurfActors)
  Actor[] TurfActors = None
  If SentTurfActors
    TurfActors = SentTurfActors
  Else
    TurfActors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None)
  EndIf
  Int maxSize = TurfActors.Length
  Int count = 0
  While count < maxSize
    Actor turfActor = TurfActors[count]
    turfActor.StopCombat()
    turfActor.StopCombatAlarm()
    count += 1
  EndWhile
EndFunction

Function UpdateActorCount(Actor[] SentTurfActors)
  Int PreviousTotalActors = TotalActors
  Int PreviousActiveActors = ActiveActors
  TotalActors = 0
  ActiveActors = 0
  Actor[] TurfActors = None
  If SentTurfActors
    TurfActors = SentTurfActors
  Else
    TurfActors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None)
  EndIf
  Int maxSize = TurfActors.Length
  Int count = 0
  While count < maxSize
    Actor turfActor = TurfActors[count]
    TotalActors += 1
    If turfActor.IsAIEnabled()
      ActiveActors += 1
    EndIf
    count += 1
  EndWhile
  EMSystemQuest.UpdateActorsActive(PreviousActiveActors, ActiveActors)
  EMSystemQuest.UpdateActorsTotal(PreviousTotalActors, TotalActors)
EndFunction

Bool Function TryToDisableAI(Actor ActorToDisable)
  Bool result = False
  If EncounterActive == False
    ActorToDisable.EnableAI(False, False)
    result = True
  EndIf
  Return result
EndFunction

Event Actor.OnSit(Actor akSender, ObjectReference akFurniture)
  If akFurniture == akSender.GetLinkedRef(EMSystemLinkToSleep)
    Utility.Wait(0.100000001)
    Self.TryToDisableAI(akSender)
  EndIf
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Self.CancelTimer(IdleEncounterTimer)
  Self.WakeUp(None)
EndEvent

Event Actor.OnCombatStateChanged(Actor akSender, ObjectReference akTarget, Int aeCombatState)
  Actor[] TurfActors = None
  If aeCombatState > 0
    Self.CancelTimer(IdleEncounterTimer)
    TurfActors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None)
    Self.WakeUp(TurfActors)
  ElseIf aeCombatState == 0
    TurfActors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None)
    If Self.AllActorsOutOfCombat(TurfActors)
      Self.SendToSleep(TurfActors as Bool, None)
      If Self.Is3DLoaded()
        Self.StartIdleEncounterTimer()
      EndIf
    Else
      Self.CancelTimer(IdleEncounterTimer)
    EndIf
  EndIf
EndEvent

Event Actor.OnDeath(Actor akSender, ObjectReference akKiller)
  If Self.CountActorsLinkedToMe(EMSystemLinkToTurf, None) == 0
    If EncounterActive == True
      EMSystemQuest.DecrementActive()
      EMSystemQuest.DecrementTotal()
    EndIf
    EncounterActive = False
  EndIf
EndEvent

Event Actor.OnDying(Actor akSender, ObjectReference akKiller)
  akSender.EnableAI(True, False)
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    Actor[] TurfActors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None)
    If TurfActors.Length == 0
      
    Else
      Self.WakeUp(TurfActors)
    EndIf
  EndIf
EndEvent

Bool Function AllActorsOutOfCombat(Actor[] SentTurfActors)
  Actor[] TurfActors = None
  If SentTurfActors
    TurfActors = SentTurfActors
  Else
    TurfActors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None)
  EndIf
  Int maxSize = TurfActors.Length
  Int count = 0
  While count < maxSize
    Actor turfActor = TurfActors[count]
    If turfActor.GetCombatState() != 0
      Return False
    EndIf
    count += 1
  EndWhile
  Return True
EndFunction

Event OnUnload()
  EncounterActive = False
  EMSystemQuest.DecrementLoaded()
  EMSystemQuest.SubtractFromActorsTotal(TotalActors)
  EMSystemQuest.SubtractFromActorsActive(ActiveActors)
  EMSystemQuest.UpdateInactive()
  Self.UpdateActorCount(None)
  TotalActors = 0
  ActiveActors = 0
  Self.UnRegisterForAllEvents()
  Self.CancelTimer(UpdateActorsTimer)
  Self.CancelTimer(IdleEncounterTimer)
EndEvent
