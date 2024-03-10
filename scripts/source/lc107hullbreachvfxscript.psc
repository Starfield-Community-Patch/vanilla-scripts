ScriptName LC107HullBreachVFXScript Extends ObjectReference
{ Script for the Hull Breach VFX in LC107. }

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.Is3DLoaded()
    Self.PlayAnimation("Reset")
  EndIf
EndEvent
