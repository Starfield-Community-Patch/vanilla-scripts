ScriptName FXScripts:FXShipDropCollection Extends ObjectReference
{ This Script applies a Visual Effect. }

;-- Variables ---------------------------------------
Bool done = False

;-- Properties --------------------------------------
EffectShader Property EffectShaderToApply Auto Const mandatory
{ This is the visue effect that will be used. }

;-- Functions ---------------------------------------

Event OnLoad()
  If !done
    If Self.IsDisabled() == False
      If Self.Is3DLoaded()
        EffectShaderToApply.Play(Self as ObjectReference, -1.0)
        done = True
      EndIf
    EndIf
  EndIf
EndEvent

Event OnUnLoad()
  EffectShaderToApply.Stop(Self as ObjectReference)
EndEvent
