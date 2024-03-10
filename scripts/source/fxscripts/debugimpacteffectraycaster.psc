ScriptName FXScripts:DebugImpactEffectRaycaster Extends ObjectReference
{ Test script for ImpactEffect Object. }

;-- Variables ---------------------------------------
Int ImpactTimer = 10
ObjectReference ObjRef
Bool bPlayImpactEffects = False

;-- Properties --------------------------------------
ImpactDataSet Property ImpactEffectRef01 Auto Const mandatory
{ The impact set that will be spawned from the ship thrusters. }
ImpactDataSet Property ImpactEffectRef02 Auto Const mandatory
{ The impact set that will be spawned very close from the ship thrusters. }
ImpactDataSet Property ImpactEffectRef03 Auto Const mandatory
{ The impact set that will be spawned very close from the ship thrusters. }
Float Property ImpactRecastDelay = 0.100000001 Auto Const
Float Property Impact01Range = 50.0 Auto Const
Float Property Impact02Range = 15.0 Auto Const
Float Property Impact03Range = 20.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  If !Self.IsDisabled()
    bPlayImpactEffects = True
    Self.StartTimer(ImpactRecastDelay, ImpactTimer)
  EndIf
EndEvent

Event OnUnLoad()
  bPlayImpactEffects = False
EndEvent

Event OnTimer(Int aiTimerID)
  If Self.IsDisabled()
    bPlayImpactEffects = False
  EndIf
  If aiTimerID == ImpactTimer
    If bPlayImpactEffects == True
      Self.PlayImpactEffect(ImpactEffectRef01, "", 0.0, 0.0, -1.0, Impact01Range, True, False)
      Self.PlayImpactEffect(ImpactEffectRef02, "", 0.0, 0.0, -1.0, Impact02Range, True, False)
      Self.PlayImpactEffect(ImpactEffectRef03, "", 0.0, 0.0, -1.0, Impact03Range, True, False)
      Self.StartTimer(ImpactRecastDelay, ImpactTimer)
    EndIf
  EndIf
EndEvent
