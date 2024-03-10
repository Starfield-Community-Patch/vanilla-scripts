ScriptName IncendiaryBurnSCRIPT Extends ActiveMagicEffect
{ If hit with enough incendiaty ammo over a period of time you will burn }

;-- Variables ---------------------------------------
Int bulletTimer = 10
Actor victim

;-- Properties --------------------------------------
ActorValue Property Incendiary Auto
Keyword Property IncendiaryState01 Auto
Keyword Property IncendiaryState02 Auto
Bool Property RANK2 = False Auto
{ Should we apply the burn effect? }
Spell Property pCryoFreezeSpell Auto
{ The Cryo freeze spell }
Float Property ShaderDuration = 10.0 Auto
{ shatter shader duration }
Keyword Property pOnFireState Auto
{ on fire property }

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  victim = akTarget as Actor
  If victim
    If !RANK2 && victim.getValue(Incendiary) < 5.0
      victim.modValue(Incendiary, 1.0)
      Self.startTimer(1.0, bulletTimer)
    ElseIf RANK2 && victim.getValue(Incendiary) >= 5.0
      victim.addKeyword(pOnFireState)
    EndIf
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == bulletTimer
    If !RANK2 && victim.getValue(Incendiary) < 5.0
      victim.damageValue(Incendiary, victim.getValue(Incendiary))
    EndIf
  EndIf
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If victim as Bool && RANK2
    victim.damageValue(Incendiary, victim.getValue(Incendiary) - 3.0)
    victim.removeKeyword(pOnFireState)
  EndIf
EndEvent
