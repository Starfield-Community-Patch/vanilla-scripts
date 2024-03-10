ScriptName BoostpackEffectScript Extends ActiveMagicEffect
{ script lives on the boostpack enchantment and sets an actor variable for when the boostpack is active or not }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property BoostpackActive Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.RegisterForAnimationEvent(akTarget, "StartImpactFX")
  Self.RegisterForAnimationEvent(akTarget, "StopImpactFX")
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.UnRegisterForAnimationEvent(akTarget, "StartImpactFX")
  Self.UnRegisterForAnimationEvent(akTarget, "StopImpactFX")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If akSource
    If asEventName == "StartImpactFX"
      akSource.setValue(BoostpackActive, 1.0)
    EndIf
    If asEventName == "StopImpactFX"
      akSource.setValue(BoostpackActive, 0.0)
    EndIf
  EndIf
EndEvent
