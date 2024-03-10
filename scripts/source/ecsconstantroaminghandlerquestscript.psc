ScriptName ECSConstantRoamingHandlerQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Quest_Properties
  Int Property StageToSet = -1 Auto Const
  { The stage we want to set, presumably to end the quest }
  LocationAlias Property ShipInteriorLocation Auto Const mandatory
  { The Location Alias of the Ship's interior that we want to check, in case the player is inside when the quest tries to stop }
  ReferenceAlias Property PlayerShip Auto Const mandatory
  { The Player's ship }
  ReferenceAlias Property Ship Auto Const mandatory
  { The ship we want to move }
  ReferenceAlias Property ShipMarker Auto Const mandatory
  { The Marker we want to send the ship to in the new location when the quest starts }
  ReferenceAlias Property ShipHoldingMarker Auto Const mandatory
  { The Marker we want to send the ship to in the ship's holding cell before stopping the quest }
EndGroup

Group Timer_Properties
  Int Property ShipMoveTimerID = 1 Auto Const
  Float Property ShipMoveTimerLengthMin = 48.0 Auto Const
  { The minimum time, in game time hours, we want to wait before trying to stop the quest and start it again. }
  Float Property ShipMoveTimerLengthMax = 120.0 Auto Const
  { The maximum time, in game time hours, we want to wait before trying to stop the quest and start it again. }
  Int Property TryAgainTimerID = 2 Auto Const
  Float Property TryAgainTimerLength = 150.0 Auto Const
  { The length, in real time seconds to wait before trying to stop the quest again }
  Int Property UndockTimerID = 3 Auto Const
  Float Property UndockTimerLengthMin = 10.0 Auto Const
  { The minimum time, in real time seconds to wait before trying to stop the quest }
  Float Property UndockTimerLengthMax = 30.0 Auto Const
  { The maximum time, in real time seconds to wait before trying to stop the quest }
EndGroup


;-- Functions ---------------------------------------

Function TryToStopQuest()
  If !Self.GetStageDone(StageToSet)
    If !Game.GetPlayer().IsInLocation(ShipInteriorLocation.GetLocation())
      spaceshipreference myPlayerShip = PlayerShip.GetShipRef()
      spaceshipreference myShip = Ship.GetShipRef()
      If !myPlayerShip.IsDockedWith(myShip)
        myShip.DisableWithGravJump()
        myShip.MoveTo(ShipHoldingMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
        If StageToSet >= 0
          Self.SetStage(StageToSet)
        EndIf
      Else
        Self.StartTimer(TryAgainTimerLength, TryAgainTimerID)
      EndIf
    Else
      Self.StartTimer(TryAgainTimerLength, TryAgainTimerID)
    EndIf
  EndIf
EndFunction

Function RandomJump()
  Int iRandom = Utility.RandomInt(0, 1)
  If iRandom == 0
    Float fRandom = Utility.RandomFloat(UndockTimerLengthMin, UndockTimerLengthMax)
    Self.StartTimer(fRandom, UndockTimerID)
    Self.TryToStopQuest()
  EndIf
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  Self.TryToStopQuest()
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == TryAgainTimerID
    Self.TryToStopQuest()
  ElseIf aiTimerID == UndockTimerID
    Self.TryToStopQuest()
  EndIf
EndEvent

Event OnQuestInit()
  Float fRandomGameTimeTimer = Utility.RandomFloat(ShipMoveTimerLengthMin, ShipMoveTimerLengthMax)
  Self.StartTimerGameTime(fRandomGameTimeTimer, ShipMoveTimerID)
  spaceshipreference myShip = Ship.GetShipRef()
  myShip.MoveTo(ShipMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  myShip.Enable(False)
EndEvent
