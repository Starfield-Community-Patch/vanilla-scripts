ScriptName FXScripts:FXPlaceExplosionOnAnimScript Extends ActiveMagicEffect
{ This script places explosions at specific locations on an actor when the specified animation events are called.  For use with AOE attacks. }

;-- Structs -----------------------------------------
Struct AreaAttackDatum
  Explosion ExplosionEffect
  String sAnimEventName
  String sFXNodeName
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
fxscripts:fxplaceexplosiononanimscript:areaattackdatum[] Property AttackData Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Int I = 0
  While I < AttackData.Length
    Self.RegisterForAnimationEvent(akCaster as ObjectReference, AttackData[I].sAnimEventName)
    I += 1
  EndWhile
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Int I = 0
  While I < AttackData.Length
    Self.UnRegisterForAnimationEvent(akCaster as ObjectReference, AttackData[I].sAnimEventName)
    I += 1
  EndWhile
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  Self.PlayEffectFromListRecursive(akSource, AttackData, asEventName, 0)
EndEvent

Function PlayEffectFromListRecursive(ObjectReference akSourceRef, fxscripts:fxplaceexplosiononanimscript:areaattackdatum[] DataSet, String asAnimEvent, Int aiStartIndex)
  Int iFoundIndex = DataSet.findstruct("sAnimEventName", asAnimEvent, aiStartIndex)
  If iFoundIndex >= 0
    akSourceRef.placeatNode(DataSet[iFoundIndex].sFXNodeName, DataSet[iFoundIndex].ExplosionEffect as Form, 1, False, False, True, False)
    If iFoundIndex >= 0 && iFoundIndex + 1 < DataSet.Length
      Self.PlayEffectFromListRecursive(akSourceRef, DataSet, asAnimEvent, iFoundIndex + 1)
    EndIf
  EndIf
EndFunction
