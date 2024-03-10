ScriptName CCT_StayInBleedoutEffectScript Extends ActiveMagicEffect
{ sets NoBleedoutRecovery when bleedout starts; clear it when hit while in bleedout. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property IgnoreHitsTimeSeconds = 2.0 Auto Const
{ how long after entering bleedout to ignore hits? }

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.RegisterForRemoteEvent(akCaster as ScriptObject, "OnEnterBleedout")
  Self.RegisterForRemoteEvent(akCaster as ScriptObject, "OnUnload")
EndEvent

Event Actor.OnEnterBleedout(Actor akSource)
  akSource.SetNoBleedoutRecovery(True)
  Self.StartTimer(IgnoreHitsTimeSeconds, 0)
  akSource.EvaluatePackage(False)
EndEvent

Event OnTimer(Int aiTimerID)
  Self.RegisterForHitEvent(Self.GetCasterActor() as ScriptObject, None, None, None, -1, -1, -1, -1, True)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  Actor myActor = Self.GetCasterActor()
  If myActor as Bool && myActor.IsBleedingOut() > 0
    myActor.SetNoBleedoutRecovery(False)
  EndIf
EndEvent

Event ObjectReference.OnUnload(ObjectReference akSource)
  (akSource as Actor).SetNoBleedoutRecovery(False)
EndEvent
