ScriptName FXScripts:TestFXLandingRaycasts Extends ObjectReference
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
ImpactDataSet Property ThrusterFireMidRangeKickupImpacts Auto Const mandatory
{ The impact set that will be spawned very close from the ship thrusters. }
Float Property ImpactRecastDelay = 0.100000001 Auto Const
Float Property ImpactRange = 45.0 Auto Const
Float Property ImpactMidRange = 13.0 Auto Const
Float Property ImpactCloseRange = 7.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  ObjectReference TestRef = Self as ObjectReference
  If TestRef.IsBoundGameObjectAvailable()
    Cell ShipCell = TestRef.GetParentCell()
    ObjectReference ShipRef = ShipCell.GetParentRef()
    ObjRef = TestRef
    Self.RegisterForRemoteEvent((ShipRef as spaceshipreference) as ScriptObject, "OnShipLanding")
    Self.RegisterForRemoteEvent((ShipRef as spaceshipreference) as ScriptObject, "OnShipTakeOff")
  EndIf
EndEvent

Event SpaceshipReference.OnShipLanding(spaceshipreference akSender, Bool abComplete)
  Cell ShipCell = Self.GetParentCell()
  ObjectReference ShipRef = ShipCell.GetParentRef()
  If ShipRef
    If abComplete == False
      Self.RegisterForAnimationEvent(ShipRef, "StartImpactFX")
      Self.RegisterForAnimationEvent(ShipRef, "StopImpactFX")
    Else
      bPlayImpactEffects = False
      Self.UnRegisterForAnimationEvent(ShipRef, "StartImpactFX")
      Self.UnRegisterForAnimationEvent(ShipRef, "StopImpactFX")
    EndIf
  EndIf
EndEvent

Event SpaceshipReference.OnShipTakeOff(spaceshipreference akSender, Bool abComplete)
  Cell ShipCell = Self.GetParentCell()
  ObjectReference ShipRef = ShipCell.GetParentRef()
  If ShipRef
    If abComplete == False
      Self.RegisterForAnimationEvent(ShipRef, "StartImpactFX")
      Self.RegisterForAnimationEvent(ShipRef, "StopImpactFX")
    Else
      bPlayImpactEffects = False
      Self.UnRegisterForAnimationEvent(ShipRef, "StartImpactFX")
      Self.UnRegisterForAnimationEvent(ShipRef, "StopImpactFX")
    EndIf
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
      If ObjRef
        ObjRef.PlayImpactEffect(ThrusterDustKickupImpacts, "ThrusterRayCaster01", 0.0, 0.0, -1.0, ImpactRange, True, False)
        ObjRef.PlayImpactEffect(ThrusterFireKickupImpacts, "ThrusterRayCaster01", 0.0, 0.0, -1.0, ImpactCloseRange, True, False)
        ObjRef.PlayImpactEffect(ThrusterFireMidRangeKickupImpacts, "ThrusterRayCaster01", 0.0, 0.0, -1.0, ImpactMidRange, True, False)
      EndIf
      Self.StartTimer(ImpactRecastDelay, ImpactTimer)
    EndIf
  EndIf
EndEvent
