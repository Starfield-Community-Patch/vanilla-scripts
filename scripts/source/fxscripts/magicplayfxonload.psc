ScriptName FXScripts:MagicPlayFXOnLoad Extends ActiveMagicEffect
{ Places a activator on death. }

;-- Variables ---------------------------------------
ObjectReference ObjRef
Bool done = False

;-- Properties --------------------------------------
VisualEffect Property VisualEffectToApply Auto Const mandatory

;-- Functions ---------------------------------------

Event OnInit()
  ObjRef = Self.GetTargetActor() as ObjectReference
  If ObjRef
    
  EndIf
EndEvent

Event OnLoad()
  If ObjRef as Bool && !done
    If ObjRef.IsDisabled() == False
      If ObjRef.Is3DLoaded()
        VisualEffectToApply.Play(ObjRef, -1.0, None)
        done = True
      EndIf
    EndIf
  EndIf
EndEvent

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If ObjRef as Bool && !done
    done = True
    VisualEffectToApply.Play(akCaster as ObjectReference, -1.0, None)
  EndIf
EndEvent

Event OnUnLoad()
  If ObjRef
    VisualEffectToApply.Stop(ObjRef)
  EndIf
EndEvent
