ScriptName FXScripts:FXResourceCollectionVisuals Extends ActiveMagicEffect
{ Script for play a visual effect that connects one actor to another. }

;-- Variables ---------------------------------------
Int ResampleTimer = 1235
Bool bStopEffects = False

;-- Properties --------------------------------------
ImageSpaceModifier Property TrapImod Auto
{ IsMod applied when we trap a soul }
VisualEffect Property TargetVFX Auto
{ Visual Effect on Target aiming at Caster }
VisualEffect Property CasterVFX Auto
{ Visual Effect on Caster aming at Target }
Float Property AbsorbFXDuration = 10.0 Auto
ActorValue Property VFXTargetDistance Auto
Float Property ResampleDelay = 0.5 Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If akTarget
    TargetVFX.Play(akTarget, AbsorbFXDuration, akCaster as ObjectReference)
    Self.UpdateTargetDistance(akTarget, akCaster)
    Self.StartTimer(ResampleDelay, ResampleTimer)
  EndIf
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If akTarget
    TargetVFX.Stop(akTarget)
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
