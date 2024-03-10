ScriptName FXScripts:FXPlayFXOnLoad Extends ObjectReference
{ Places a activator on death. }

;-- Variables ---------------------------------------
Bool done = False

;-- Properties --------------------------------------
VisualEffect Property VisualEffectToApply Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  If !done
    If Self.IsDisabled() == False
      If Self.Is3DLoaded()
        VisualEffectToApply.Play(Self as ObjectReference, -1.0, None)
        done = True
      EndIf
    EndIf
  EndIf
EndEvent

Event OnUnLoad()
  VisualEffectToApply.Stop(Self as ObjectReference)
EndEvent
