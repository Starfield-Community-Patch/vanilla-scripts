ScriptName SE_LegendaryScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property OrbitLocation Auto Const
Quest Property SE_ZW08_SpaceCell Auto Const mandatory
ReferenceAlias Property playerShip Auto Const
ReferenceAlias Property LegendaryShip Auto Const
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
Int Property timerID = 1 Auto Const
Int Property GameHours = 48 Auto Const
Float Property PlayerDistanceCheck = 10000.0 Auto Const

;-- Functions ---------------------------------------

Bool Function MoveShip()
  Bool isShipMoving = False
  If playerShip.GetRef().GetDistance(LegendaryShip.GetRef()) > PlayerDistanceCheck
    OrbitLocation.RefillAlias()
    If OrbitLocation.GetLocation() != None
      isShipMoving = True
      SE_ZW08_SpaceCell.Stop()
      While SE_ZW08_SpaceCell.IsStopped() == False
        Utility.Wait(0.5)
      EndWhile
      SE_ZW08_SpaceCell.Start()
    EndIf
    If Self.IsObjectiveDisplayed(10) && OrbitLocation.GetLocation() != None
      Self.SetObjectiveDisplayed(10, True, True)
    EndIf
    Alias_MapMarker.GetRef().SetMarkerDiscovered()
  EndIf
  Return isShipMoving
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == timerID
    If Self.MoveShip() == False
      Self.StartMoveTimer()
    EndIf
  EndIf
EndEvent

Function StartMoveTimer()
  Self.StartTimerGameTime(GameHours as Float, timerID)
EndFunction

Function DebugTimerNow()
  Self.CancelTimerGameTime(1)
  Self.StartTimerGameTime(0.000001, 1)
EndFunction
