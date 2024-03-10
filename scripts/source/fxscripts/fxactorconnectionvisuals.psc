ScriptName FXScripts:FXActorConnectionVisuals Extends ActiveMagicEffect
{ Script for play a visual effect that connects one actor to another. }

;-- Variables ---------------------------------------
Bool DeadAlready = False
Int ResampleTimer = 123
Bool bStopEffects = False

;-- Properties --------------------------------------
ImageSpaceModifier Property TrapImod Auto
{ IsMod applied when we trap a soul }
VisualEffect Property TargetVFX Auto
{ Visual Effect on Target aiming at Caster }
VisualEffect Property CasterVFX Auto
{ Visual Effect on Caster aming at Target }
EffectShader Property CasterFXS Auto
{ Effect Shader on Caster during Soul trap }
EffectShader Property TargetFXS Auto
{ Effect Shader on Target during Soul trap }
Bool Property bIsEnchantmentEffect = False Auto
{ Set this to true if this soul trap is on a weapon enchantment or a spell that can do damage to deal with a fringe case }
Float Property AbsorbFXDuration = 10.0 Auto
ActorValue Property VFXTargetDistance Auto
Float Property ResampleDelay = 0.25 Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If bIsEnchantmentEffect == False
    Actor TargetActor = Self.GetTargetActor()
    DeadAlready = TargetActor.IsDead()
  EndIf
  If akTarget
    TargetVFX.Play(akTarget, AbsorbFXDuration, akCaster as ObjectReference)
    CasterVFX.Play(akCaster as ObjectReference, AbsorbFXDuration, akTarget)
    Self.UpdateTargetDistance(akTarget, akCaster)
    Self.StartTimer(ResampleDelay, ResampleTimer)
  EndIf
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If akTarget
    TargetVFX.Stop(akTarget)
    CasterVFX.Stop(akCaster as ObjectReference)
  EndIf
  bStopEffects = True
EndEvent

Event OnTimer(Int aiTimerID)
  If !bStopEffects
    If aiTimerID == ResampleTimer
      If Self.GetElapsedTime() < 5.0
        Self.GetTargetActor()
        Self.UpdateTargetDistance(Self.GetTargetActor() as ObjectReference, Self.GetCasterActor())
        Self.StartTimer(ResampleDelay, ResampleTimer)
      EndIf
    EndIf
  EndIf
EndEvent

Function UpdateTargetDistance(ObjectReference akTarget, Actor akCaster)
  Float Dist = akCaster.GetDistance(akTarget)
  akTarget.SetValue(VFXTargetDistance, Dist)
EndFunction
