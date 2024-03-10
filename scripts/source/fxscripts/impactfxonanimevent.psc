ScriptName FXScripts:ImpactFXOnAnimEvent Extends ActiveMagicEffect
{ Play an impact effect in response to an animation event. }

;-- Structs -----------------------------------------
Struct ImpactRaycastDatum
  ImpactDataSet ImpactFX
  String sAnimEventName
  String sFXNodeName = "Root"
  Float x = 0.0
  Float y = 0.0
  Float z = -1.0
  Bool bUseNodeRotation = True
EndStruct


;-- Variables ---------------------------------------
ObjectReference ObjRef

;-- Properties --------------------------------------
fxscripts:impactfxonanimevent:impactraycastdatum[] Property ImpactRaycastList Auto Const mandatory
Float Property ImpactRecastDelay = 0.100000001 Auto Const
Float Property ImpactRange = 10.0 Auto Const
Float Property ImpactRecastStopTime = 4.0 Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  ObjRef = akCaster as ObjectReference
  Int I = 0
  While I < ImpactRaycastList.Length
    Self.RegisterForAnimationEvent(akCaster as ObjectReference, ImpactRaycastList[I].sAnimEventName)
    I += 1
  EndWhile
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Int I = 0
  While I < ImpactRaycastList.Length
    Self.UnRegisterForAnimationEvent(akCaster as ObjectReference, ImpactRaycastList[I].sAnimEventName)
    I += 1
  EndWhile
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  Self.PlayEffectFromListRecursive(ObjRef, ImpactRaycastList, asEventName, 0)
EndEvent

Function PlayEffectFromListRecursive(ObjectReference akSourceRef, fxscripts:impactfxonanimevent:impactraycastdatum[] DataSet, String asAnimEvent, Int aiStartIndex)
  Int iFoundIndex = DataSet.findstruct("sAnimEventName", asAnimEvent, aiStartIndex)
  If iFoundIndex >= 0
    akSourceRef.PlayImpactEffect(DataSet[iFoundIndex].ImpactFX, DataSet[iFoundIndex].sFXNodeName, DataSet[iFoundIndex].x, DataSet[iFoundIndex].y, DataSet[iFoundIndex].z, ImpactRange, DataSet[iFoundIndex].bUseNodeRotation, False)
    If iFoundIndex >= 0 && iFoundIndex + 1 < DataSet.Length
      Self.PlayEffectFromListRecursive(akSourceRef, DataSet, asAnimEvent, iFoundIndex + 1)
    EndIf
  EndIf
EndFunction
