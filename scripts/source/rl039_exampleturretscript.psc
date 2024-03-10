ScriptName RL039_ExampleTurretScript Extends Actor

;-- Variables ---------------------------------------
Bool attackBlob
ObjectReference explosionMarker
expandingbiomassscript target_expandingBiomassScript

;-- Properties --------------------------------------
Float Property initialWaitTime Auto Const
Float Property randomWaitTimeMin Auto Const
Float Property randomWaitTimeMax Auto Const
Float Property randomFireTimeMin Auto Const
Float Property randomFireTimeMax Auto Const
Int Property hitsPerFire Auto Const
wwiseevent Property fireSoundEvent Auto Const
Keyword Property RL039_ExplosionMarker Auto Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  ObjectReference target = Self.GetLinkedRef(None)
  target_expandingBiomassScript = target as expandingbiomassscript
  explosionMarker = Self.GetLinkedRef(RL039_ExplosionMarker)
  explosionMarker.Disable(False)
  Utility.Wait(initialWaitTime)
  attackBlob = True
  Self.ShootAtTarget()
EndEvent

Event OnDeath(ObjectReference akKiller)
  attackBlob = False
  Self.DisableNoWait(False)
EndEvent

Function ShootAtTarget()
  While attackBlob
    Float fireTime = Utility.RandomFloat(randomFireTimeMin, randomFireTimeMax)
    target_expandingBiomassScript.TakeHits(hitsPerFire)
    Int fireSoundId = fireSoundEvent.Play(Self as ObjectReference, None, None)
    explosionMarker.Enable(False)
    Utility.Wait(fireTime)
    wwiseevent.StopInstance(fireSoundId)
    explosionMarker.Disable(False)
    Float waitTime = Utility.RandomFloat(randomWaitTimeMin, randomWaitTimeMax)
    Utility.Wait(waitTime)
  EndWhile
EndFunction

Event OnCombatStateChanged(ObjectReference akTarget, Int aeCombatState)
  If aeCombatState != 0
    attackBlob = False
  ElseIf !Self.IsDead()
    attackBlob = True
    Self.ShootAtTarget()
  EndIf
EndEvent
