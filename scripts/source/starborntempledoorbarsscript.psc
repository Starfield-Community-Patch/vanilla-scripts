ScriptName StarbornTempleDoorBarsScript Extends ObjectReference
{ Script for the Starborn Temple Door Bars. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group BaseProperties collapsedonref
  Float Property AnimateDistanceOpen = 6.0 Auto Const
  Float Property AnimateDistanceClose = 10.0 Auto Const
  String Property OpenAnimation = "Play01" Auto Const
  String Property CloseAnimation = "Play02" Auto Const
EndGroup

Group RefProperties collapsedonbase
  Bool Property ShouldRegisterForOpenEvent = True Auto
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  If ShouldRegisterForOpenEvent
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, AnimateDistanceOpen, 0)
  EndIf
EndEvent

Function SetShouldRegisterForOpenEvent(Bool shouldRegister)
  ShouldRegisterForOpenEvent = shouldRegister
  If shouldRegister
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, AnimateDistanceOpen, 0)
  Else
    Self.UnregisterForDistanceEvents(Self as ScriptObject, Game.GetPlayer() as ScriptObject, -1)
  EndIf
EndFunction

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.PlayAnimationAndWait(OpenAnimation, "Done")
  Self.RegisterForDistanceGreaterThanEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, AnimateDistanceClose, 0)
EndEvent

Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.PlayAnimationAndWait(CloseAnimation, "Done")
  Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, AnimateDistanceOpen, 0)
EndEvent
