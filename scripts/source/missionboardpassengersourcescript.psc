ScriptName MissionBoardPassengerSourceScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorBase Property Passenger Auto Const mandatory
{ base actor to use to create passengers }
Int Property PassengerCountMin = 2 Auto Const
Int Property PassengerCountMax = 3 Auto Const
Float Property MissionTimeMult = 1.0 Auto Const
{ set to increase/decrease amount of time for this quest }
Int Property ExtraRewardPerPassenger = 20 Auto Const
{ how much award per passenger? }

;-- Functions ---------------------------------------

Function CreatePassengers(RefCollectionAlias PassengerCollection, ObjectReference PassengerMarker, Int PassengerCount)
  Int I = 0
  While I < PassengerCount
    ObjectReference passengerRef = PassengerMarker.PlaceAtMe(Passenger as Form, 1, False, False, True, None, None, True)
    PassengerCollection.AddRef(passengerRef)
    I += 1
  EndWhile
EndFunction
