ScriptName FXScripts:FXLandingRaycasts Extends ObjectReference
{ Test script for ship landing effects. }

;-- Variables ---------------------------------------
Int ImpactTimer = 10
Bool bPlayImpactEffects = False

;-- Properties --------------------------------------
ImpactDataSet Property ThrusterDustKickupImpacts Auto Const mandatory
{ The impact set that will be spawned from the ship thrusters. }
ImpactDataSet Property ThrusterFireKickupImpacts Auto Const mandatory
{ The impact set that will be spawned very close from the ship thrusters. }
Float Property ImpactRecastDelay = 0.100000001 Auto Const
Float Property ImpactRange = 50.0 Auto Const
Float Property ImpactCloseRange = 15.0 Auto Const
String Property ThrusterRayCaster01 = "FX_LightEngBig" Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  ObjectReference ObjRef = Self as ObjectReference
  bPlayImpactEffects = True
  Self.RegisterForAnimationEvent(ObjRef, "StartImpactFX")
  Self.RegisterForAnimationEvent(ObjRef, "StopImpactFX")
EndEvent

Event OnUnLoad()
  ObjectReference ObjRef = Self as ObjectReference
  bPlayImpactEffects = False
  Self.UnRegisterForAnimationEvent(ObjRef, "StartImpactFX")
  Self.UnRegisterForAnimationEvent(ObjRef, "StopImpactFX")
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
  ObjectReference ObjRef = Self as ObjectReference
  If aiTimerID == ImpactTimer
    If bPlayImpactEffects == True
      ObjRef.PlayImpactEffect(ThrusterDustKickupImpacts, ThrusterRayCaster01, 0.0, 0.0, -1.0, ImpactRange, False, False)
      ObjRef.PlayImpactEffect(ThrusterFireKickupImpacts, ThrusterRayCaster01, 0.0, 0.0, -1.0, ImpactCloseRange, False, False)
      Self.StartTimer(ImpactRecastDelay, ImpactTimer)
    EndIf
  EndIf
EndEvent
