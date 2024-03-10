ScriptName CityNAMASTElevatorActivatorScript Extends ObjectReference conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property MASTElevatorMessage Auto Const mandatory
GlobalVariable Property MASTDestinationGlobal Auto
ObjectReference Property LobbyMarker Auto Const
ObjectReference Property SubsectionMarker Auto Const
ObjectReference Property VanguardMarker Auto Const
ObjectReference Property MilitaryMarker Auto Const
ObjectReference Property ScienceMarker Auto Const
ObjectReference Property CabinetMarker Auto Const
ObjectReference Property NATMarker Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Int iButton = 0
  iButton = MASTElevatorMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If iButton == 0
    MASTDestinationGlobal.SetValue(0.0)
    Game.FastTravel(CabinetMarker)
  ElseIf iButton == 1
    MASTDestinationGlobal.SetValue(1.0)
    Game.FastTravel(ScienceMarker)
  ElseIf iButton == 2
    MASTDestinationGlobal.SetValue(2.0)
    Game.FastTravel(MilitaryMarker)
  ElseIf iButton == 3
    MASTDestinationGlobal.SetValue(3.0)
    Game.FastTravel(LobbyMarker)
  ElseIf iButton == 4
    Game.FastTravel(NATMarker)
  ElseIf iButton == 5
    Game.FastTravel(VanguardMarker)
  ElseIf iButton == 6
    Game.FastTravel(SubsectionMarker)
  EndIf
EndEvent
