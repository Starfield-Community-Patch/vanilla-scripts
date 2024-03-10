ScriptName DefaultBlockActivationOnLoad Extends ObjectReference default
{ Blocks activation once on load. }

;-- Variables ---------------------------------------
Bool HasLoaded = False

;-- Properties --------------------------------------
Bool Property HideActivationText = True Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnLoad()
  If !HasLoaded
    HasLoaded = True
    Self.BlockActivation(True, HideActivationText)
  EndIf
EndEvent
