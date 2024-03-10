ScriptName SQ_OutpostAttackHumansScript Extends SQ_OutpostAttackScript

;-- Variables ---------------------------------------
Float fObjectAttackTimerSeconds = 3.0 Const
Int iObjectAttackTimerID = 1 Const

;-- Properties --------------------------------------
Group AttackHumansData
  ReferenceAlias[] Property Ships Auto Const mandatory
  { array of ship aliases }
  ActorValue Property OutpostBuildAreaRadius Auto Const mandatory
  { build radius AV - used to check for replacement outpost beacon during attack }
EndGroup


;-- Functions ---------------------------------------

Function HandleQuestStarted()
  oe_shipsaddonscript myShipScript = (Self as Quest) as oe_shipsaddonscript
  If myShipScript
    myShipScript.LandShip(-1)
  EndIf
  Self.RegisterForRemoteEvent(OutpostBeacon as ScriptObject, "OnWorkshopObjectPlaced")
  Self.RegisterForRemoteEvent(AttackTarget as ScriptObject, "OnLoad")
  Self.RegisterForRemoteEvent(AttackTarget as ScriptObject, "OnUnload")
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnOutpostPlaced")
EndFunction

Event ReferenceAlias.OnLoad(ReferenceAlias akSource)
  If IsAttackStarted as Bool && Attackers.GetCountDead() < Attackers.GetCount()
    Self.AttackOutpostObjects()
  EndIf
EndEvent

Event ReferenceAlias.OnUnload(ReferenceAlias akSource)
  If IsAttackStarted as Bool && Attackers.GetCountDead() < Attackers.GetCount()
    ObjectReference outpostBeaconRef = OutpostBeacon.GetRef()
    If outpostBeaconRef
      ObjectReference[] destructibleObjects = outpostBeaconRef.GetDestructibleOutpostObjects()
      Int I = 0
      While I < destructibleObjects.Length
        ObjectReference theRef = destructibleObjects[I]
        If theRef.Is3DLoaded() == False
          theRef.SetDestroyed(True)
        EndIf
        I += 1
      EndWhile
    EndIf
  EndIf
EndEvent

Event Actor.OnOutpostPlaced(Actor akSource, ObjectReference akOutpostBeacon)
  Float buildRadius = akOutpostBeacon.GetValue(OutpostBuildAreaRadius)
  ObjectReference attackTargetRef = AttackTarget.GetRef()
  If attackTargetRef.GetDistance(akOutpostBeacon) < buildRadius
    OutpostBeacon.ForceRefTo(akOutpostBeacon)
    attackTargetRef.MoveTo(akOutpostBeacon, 0.0, 0.0, 0.0, True, False)
  EndIf
EndEvent

Function HandleQuestShutdown()
  Int I = 0
  While I < Ships.Length
    Ships[I].TryToDisable()
    I += 1
  EndWhile
EndFunction

Function HandleAttackersSpawning()
  Attackers.SetValue(Game.GetAggressionAV(), 1.0)
EndFunction

Function HandleAttackerLocationChange(ObjectReference akSenderRef, Location akOldLoc, Location akNewLoc)
  ObjectReference outpostRef = OutpostBeacon.GetRef()
  Actor attackerRef = akSenderRef as Actor
  If (outpostRef as Bool && attackerRef as Bool) && akNewLoc == outpostRef.GetCurrentLocation()
    Int I = attackerRef.AttackOutpostObjects(outpostRef)
    Self.StartAttack(True)
  EndIf
EndFunction

Event ReferenceAlias.OnWorkshopObjectPlaced(ReferenceAlias akSource, ObjectReference akReference)
  If IsAttackStarted
    Self.StartTimer(fObjectAttackTimerSeconds, iObjectAttackTimerID)
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == iObjectAttackTimerID
    Self.AttackOutpostObjects()
  EndIf
EndEvent

Function AttackOutpostObjects()
  ObjectReference outpostRef = OutpostBeacon.GetRef()
  If outpostRef
    Int a = 0
    While a < Attackers.GetCount()
      Actor theAttacker = Attackers.GetActorAt(a)
      If theAttacker as Bool && theAttacker.IsDead() == False
        Int I = theAttacker.AttackOutpostObjects(outpostRef)
      EndIf
      a += 1
    EndWhile
  EndIf
EndFunction
