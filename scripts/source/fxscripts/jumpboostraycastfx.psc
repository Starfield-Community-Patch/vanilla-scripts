ScriptName FXScripts:JumpBoostRaycastFX Extends ActiveMagicEffect
{ Test script for ship landing effects. }

;-- Variables ---------------------------------------
Int ImpactTimer = 10
Int SafetyTimer = 20
Float SafetyTimerDuration = 10.0
Bool bPlayImpactEffects = False

;-- Properties --------------------------------------
ImpactDataSet Property BoosterImpactEffect Auto Const mandatory
{ The impact set that will be spawned from the ship thrusters. }
Float Property ImpactRecastDelay = 0.100000001 Auto Const
Float Property ImpactRange = 6.0 Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.RegisterForAnimationEvent(akTarget, "StartImpactFX")
  Self.RegisterForAnimationEvent(akTarget, "StopImpactFX")
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  bPlayImpactEffects = False
  Self.UnRegisterForAnimationEvent(akTarget, "StartImpactFX")
  Self.UnRegisterForAnimationEvent(akTarget, "StopImpactFX")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If asEventName == "StartImpactFX"
    bPlayImpactEffects = True
    akSource.PlayImpactEffect(BoosterImpactEffect, "C_BackPack", 0.0, 0.0, -1.0, ImpactRange, True, False)
    Self.CancelTimer(SafetyTimer)
    Self.StartTimer(SafetyTimerDuration, SafetyTimer)
    Self.StartTimer(ImpactRecastDelay, ImpactTimer)
  EndIf
  If asEventName == "StopImpactFX"
    bPlayImpactEffects = False
    Self.CancelTimer(ImpactTimer)
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == ImpactTimer
    If bPlayImpactEffects == True
      Self.GetTargetActor().PlayImpactEffect(BoosterImpactEffect, "C_BackPack", 0.0, 0.0, -1.0, ImpactRange, True, False)
      Self.StartTimer(ImpactRecastDelay, ImpactTimer)
    EndIf
  EndIf
  If aiTimerID == SafetyTimer
    bPlayImpactEffects = False
    Self.CancelTimer(ImpactTimer)
  EndIf
EndEvent
