ScriptName AddictolScrip Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property Addiction Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor targetAsActor = akTarget as Actor
  If targetAsActor
    targetAsActor.RemoveSpell(Addiction)
  EndIf
EndEvent
