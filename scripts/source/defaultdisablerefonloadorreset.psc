ScriptName DefaultDisableRefOnLoadOrReset Extends ObjectReference
{ Disables this ref on load or reset }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Actions
  Bool Property DisableOnLoad = False Auto
  { If this is true, this will be disabled every time it recieves OnLoad }
  Bool Property DisableOnReset = False Auto
  { If this is true, this will be disabled every time it recieves OnReset }
  Bool Property ShouldFadeOut = False Auto
  { Set if you want this to fade out }
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  If DisableOnLoad
    Self.Disable(ShouldFadeOut)
  EndIf
EndEvent

Event OnReset()
  If DisableOnReset
    Self.Disable(ShouldFadeOut)
  EndIf
EndEvent
