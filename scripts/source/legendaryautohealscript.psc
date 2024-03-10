ScriptName LegendaryAutoHealScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------
Int HealDelayID = 58618
Actor myActor
Float myHealth

;-- Properties --------------------------------------
GlobalVariable Property LegendaryAutoHealMinPercent Auto Const
GlobalVariable Property LegendaryAutoHealDelay Auto Const
ActorValue Property Health Auto
Potion Property Aid_MedPack Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  myActor = akTarget as Actor
  Self.RegisterForHitEvent(myActor as ScriptObject, None, None, None, -1, -1, -1, -1, True)
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.UnregisterForAllHitEvents(None)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  myHealth = myActor.GetValuePercentage(Health)
  If myHealth < LegendaryAutoHealMinPercent.GetValue() && myActor.GetItemCount(Aid_MedPack as Form) > 0
    myActor.EquipItem(Aid_MedPack as Form, False, False)
    Self.StartTimer(LegendaryAutoHealDelay.GetValue(), HealDelayID)
  Else
    Self.RegisterForHitEvent(myActor as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == HealDelayID
    Self.RegisterForHitEvent(myActor as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  EndIf
EndEvent
