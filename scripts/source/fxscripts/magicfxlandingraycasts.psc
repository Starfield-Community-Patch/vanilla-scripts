ScriptName FXScripts:MagicFXLandingRaycasts Extends ActiveMagicEffect
{ Test script for ship landing effects. }

;-- Variables ---------------------------------------
Int ImpactTimer = 10
ObjectReference ObjRef
Bool bPlayImpactEffects = False

;-- Properties --------------------------------------
ImpactDataSet Property ThrusterDustKickupImpacts Auto Const mandatory
{ The impact set that will be spawned from the ship thrusters. }
ImpactDataSet Property ThrusterFireKickupImpacts Auto Const mandatory
{ The impact set that will be spawned very close from the ship thrusters. }
Float Property ImpactRecastDelay = 0.100000001 Auto Const
Float Property ImpactRange = 50.0 Auto Const
Float Property ImpactCloseRange = 15.0 Auto Const

;-- Functions ---------------------------------------

Event OnInit()
  ObjRef = Self.GetTargetActor() as ObjectReference
  If ObjRef
    
  EndIf
EndEvent

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  ObjRef = (akTarget as Actor) as ObjectReference
  If ObjRef
    Self.RegisterForAnimationEvent(akTarget, "StartImpactFX")
    Self.RegisterForAnimationEvent(akTarget, "StopImpactFX")
  EndIf
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If ObjRef
    bPlayImpactEffects = False
    Self.UnRegisterForAnimationEvent(akTarget, "StartImpactFX")
    Self.UnRegisterForAnimationEvent(akTarget, "StopImpactFX")
  EndIf
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If asEventName == "StartImpactFX"
    bPlayImpactEffects = True
    Self.StartTimer(ImpactRecastDelay, ImpactTimer)
  EndIf
  If asEventName == "StopImpactFX"
    bPlayImpactEffects = False
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == ImpactTimer
    If bPlayImpactEffects == True
      ObjRef.PlayImpactEffect(ThrusterDustKickupImpacts, "ThrusterRayCaster01", 0.0, 0.0, -1.0, ImpactRange, True, False)
      ObjRef.PlayImpactEffect(ThrusterDustKickupImpacts, "ThrusterRayCaster02", 0.0, 0.0, -1.0, ImpactRange, True, False)
      ObjRef.PlayImpactEffect(ThrusterDustKickupImpacts, "ThrusterRayCaster03", 0.0, 0.0, -1.0, ImpactRange, True, False)
      ObjRef.PlayImpactEffect(ThrusterDustKickupImpacts, "ThrusterRayCaster04", 0.0, 0.0, -1.0, ImpactRange, True, False)
      ObjRef.PlayImpactEffect(ThrusterFireKickupImpacts, "ThrusterRayCaster01", 0.0, 0.0, -1.0, ImpactCloseRange, True, False)
      ObjRef.PlayImpactEffect(ThrusterFireKickupImpacts, "ThrusterRayCaster02", 0.0, 0.0, -1.0, ImpactCloseRange, True, False)
      ObjRef.PlayImpactEffect(ThrusterFireKickupImpacts, "ThrusterRayCaster03", 0.0, 0.0, -1.0, ImpactCloseRange, True, False)
      ObjRef.PlayImpactEffect(ThrusterFireKickupImpacts, "ThrusterRayCaster04", 0.0, 0.0, -1.0, ImpactCloseRange, True, False)
      Self.StartTimer(ImpactRecastDelay, ImpactTimer)
    EndIf
  EndIf
EndEvent
