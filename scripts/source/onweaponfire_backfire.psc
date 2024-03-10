ScriptName OnWeaponFire_Backfire Extends ActiveMagicEffect hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property ChanceBackfire = 10 Auto Const
Spell Property myWeaponFireSpell Auto Const
String Property myAnimEvent Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.registerForAnimationEvent(akTarget, myAnimEvent)
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If asEventName == myAnimEvent
    If Game.GetDieRollSuccess(ChanceBackfire, 1, 100, -1, -1)
      myWeaponFireSpell.Cast(akSource, None)
    EndIf
  Else
    Self.registerForAnimationEvent(akSource, myAnimEvent)
  EndIf
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.UnregisterForAnimationEvent(akCaster as ObjectReference, myAnimEvent)
EndEvent
