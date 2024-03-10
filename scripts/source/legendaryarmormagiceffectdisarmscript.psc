ScriptName LegendaryArmorMagicEffectDisarmScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property ModLegendaryArmorDisarm Auto Const
{ AUTOFILL }
Spell Property DisarmSpell Auto Const
{ AUTOFILL }
Keyword Property NoDisarm Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If akTarget is Actor
    Self.RegisterForHitEvent(akTarget as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  EndIf
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If akTarget is Actor
    Self.UnregisterForAllHitEvents(None)
  EndIf
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If akAggressor.HasKeyword(NoDisarm)
    Return 
  EndIf
  Int dieRoll = Utility.RandomInt(1, 100)
  If dieRoll as Float <= akTarget.GetValue(ModLegendaryArmorDisarm)
    DisarmSpell.Cast(akTarget, akAggressor)
  EndIf
  Self.RegisterForHitEvent(akTarget as ScriptObject, None, None, None, -1, -1, -1, -1, True)
EndEvent
