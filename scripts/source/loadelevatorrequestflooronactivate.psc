ScriptName LoadElevatorRequestFloorOnActivate Extends ObjectReference

;-- Variables ---------------------------------------
Int currentFloorIndex = -1
loadelevatormanagerscript loadElevatorManager

;-- Functions ---------------------------------------

Function AssignLoadElevatorData(Int newCurrentFloorIndex, loadelevatormanagerscript newLoadElevatorManager)
  currentFloorIndex = newCurrentFloorIndex
  loadElevatorManager = newLoadElevatorManager
EndFunction

Function AssignButtonName(Message buttonNameMessage)
  Self.SetOverrideName(buttonNameMessage)
EndFunction

;-- State -------------------------------------------
State RequestingFloorTravel

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForPlayerToRequestFloorTravel

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("RequestingFloorTravel")
    If currentFloorIndex != -1 && loadElevatorManager != None && (akActionRef == Game.GetPlayer() as ObjectReference)
      If loadElevatorManager == None
        
      Else
        loadElevatorManager.RequestFloorTravel(currentFloorIndex, akActionRef)
      EndIf
    EndIf
    Self.GotoState("WaitingForPlayerToRequestFloorTravel")
  EndEvent
EndState
