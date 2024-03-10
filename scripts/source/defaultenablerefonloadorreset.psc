ScriptName DefaultEnableRefOnLoadOrReset Extends ObjectReference
{ Enables this ref on load or reset }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Actions
  Bool Property EnableOnLoad = False Auto
  { If this is true, this will be enabled every time it recieves OnLoad }
  Bool Property EnableOnReset = False Auto
  { If this is true, this will be enabled every time it recieves OnReset }
  Bool Property ShouldFadeIn = False Auto
  { Set if you want this to fade in on load }
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  If EnableOnLoad
    Self.Enable(ShouldFadeIn)
  EndIf
EndEvent

Event OnReset()
  If EnableOnReset
    Self.Enable(ShouldFadeIn)
  EndIf
EndEvent
