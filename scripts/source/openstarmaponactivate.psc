ScriptName OpenStarMapOnActivate Extends ObjectReference
{ Opens the Star Map when this activator is used. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property FailedActivationMessage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Self.GoToState("Busy")
  If Game.IsMenuControlsEnabled()
    Game.ShowGalaxyStarMapMenu()
  Else
    FailedActivationMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
  Self.GoToState("")
EndEvent

;-- State -------------------------------------------
State Busy

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function
  EndEvent
EndState
