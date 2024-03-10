ScriptName LoadElevatorManagerScript Extends ObjectReference conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group MessageCustomization collapsedonref
{ Change these properties to affect Message Boxes seen by the player }
  Message Property ChooseFloorMessage Auto Const mandatory
  { The text displayed on elevator buttons, when more than two floors are present }
  Message Property InaccessibleFloorMessage Auto Const mandatory
  { The text displayed when a player attempts to travel to an inaccessible floor }
  Message Property LockedFloorMessage Auto Const mandatory
  { The text displayed when a player selects a locked floor }
  Message Property NotOperatingMessage Auto Const mandatory
  { The text displayed when the elevator is "off", and the Player tried to request travel to another floor }
EndGroup

Group TwoFloorElevator
{ Only set these properties if your elevator has exactly two floors. }
  Message Property FirstFloorName Auto
  Message Property SecondFloorName Auto
EndGroup

Group ThreeOrMoreFloorElevator
{ Only set these properties if your elevator has three or more floors. }
  Message Property FloorNames Auto
EndGroup

Group OperationCustomization
  Bool Property IsOperational = True Auto conditional
  { Non-operational elevators won't accept travel requests, and their doors won't open based on Actor proximity. }
EndGroup

Group AutofillProperties collapsedonref
  wwiseevent Property QST_MQ207C_Elevator_Activate_Fail_WEF Auto Const mandatory
  wwiseevent Property OBJ_Elevator_Generic_02_Depart_WEF Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function SetFirstFloorName(Message newFloorName)
  FirstFloorName = newFloorName
  loadelevatorfloorscript[] loadElevatorFloors = Self.GetLoadElevatorFloors()
  If loadElevatorFloors.Length != 2
    Return 
  EndIf
  loadElevatorFloors[1].SetElevatorButtonName(newFloorName)
EndFunction

Function SetSecondFloorName(Message newFloorName)
  SecondFloorName = newFloorName
  loadelevatorfloorscript[] loadElevatorFloors = Self.GetLoadElevatorFloors()
  If loadElevatorFloors.Length != 2
    Return 
  EndIf
  loadElevatorFloors[0].SetElevatorButtonName(newFloorName)
EndFunction

Function SetFloorNames(Message newFloorNames)
  FloorNames = newFloorNames
EndFunction

Message Function GetButtonMessageForFloor(Int floorIndex)
  loadelevatorfloorscript[] loadElevatorFloors = Self.GetLoadElevatorFloors()
  If loadElevatorFloors.Length > 2
    If ChooseFloorMessage == None
      
    EndIf
    Return ChooseFloorMessage
  ElseIf floorIndex == 0
    If SecondFloorName == None
      
    EndIf
    Return SecondFloorName
  ElseIf floorIndex == 1
    If FirstFloorName == None
      
    EndIf
    Return FirstFloorName
  EndIf
EndFunction

Function RequestFloorTravel(Int currentFloor, ObjectReference requester)
  Int requestedFloor = 0
  loadelevatorfloorscript[] loadElevatorFloors = Self.GetLoadElevatorFloors()
  ObjectReference[] reversemanagerDoors = new ObjectReference[loadElevatorFloors.Length]
  Int I = 0
  While I < reversemanagerDoors.Length
    loadelevatorfloorscript loadElevator = loadElevatorFloors[I]
    reversemanagerDoors[loadElevatorFloors.Length - I - 1] = loadElevator.GetManagerDoor()
    I += 1
  EndWhile
  If loadElevatorFloors.Length > 2
    If FloorNames == None
      Return 
    EndIf
    FloorNames.AttachLoadDoors(reversemanagerDoors)
  EndIf
  If loadElevatorFloors.Length > 2
    If FloorNames == None
      Return 
    EndIf
    Int floorChoice = FloorNames.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    If floorChoice == -1 || floorChoice > loadElevatorFloors.Length - 1
      Return 
    EndIf
    requestedFloor = loadElevatorFloors.Length - 1 - floorChoice
  ElseIf currentFloor == 0
    requestedFloor = 1
  ElseIf currentFloor == 1
    requestedFloor = 0
  EndIf
  Self.TravelToFloor(currentFloor, requestedFloor, loadElevatorFloors, requester, False)
EndFunction

Function TravelToRandomFloor(ObjectReference requester)
  loadelevatorfloorscript[] loadElevatorFloors = Self.GetLoadElevatorFloors()
  Int randomFloorIndex = Utility.RandomInt(0, loadElevatorFloors.Length - 1)
  Self.TravelToFloor(-1, randomFloorIndex, loadElevatorFloors, requester, True)
EndFunction

Function TravelToFloor(Int currentFloor, Int requestedFloor, loadelevatorfloorscript[] loadElevatorFloors, ObjectReference requester, Bool ignoreFloorRestrictions)
  loadelevatorfloorscript loadElevatorFloor = loadElevatorFloors[requestedFloor]
  If requestedFloor == currentFloor
    loadElevatorFloor.PlayArrivalSound(False)
    Return 
  EndIf
  If !loadElevatorFloor.IsAccessible()
    QST_MQ207C_Elevator_Activate_Fail_WEF.Play(requester, None, None)
    InaccessibleFloorMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    Return 
  EndIf
  ObjectReference managerDoor = loadElevatorFloor.GetManagerDoor()
  If managerDoor != None
    Key requiredKey = managerDoor.GetKey()
    If ignoreFloorRestrictions == False && requiredKey != None && requester.GetItemCount(requiredKey as Form) == 0
      LockedFloorMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      Return 
    EndIf
    If OBJ_Elevator_Generic_02_Depart_WEF != None
      OBJ_Elevator_Generic_02_Depart_WEF.Play(requester, None, None)
    EndIf
    managerDoor.Activate(requester, False)
  EndIf
EndFunction

Function SetElevatorOperational(Bool operational)
  IsOperational = operational
  loadelevatorfloorscript[] loadElevatorFloors = Self.GetLoadElevatorFloors()
  Int I = 0
  While I < loadElevatorFloors.Length
    loadelevatorfloorscript floorScript = loadElevatorFloors[I]
    If operational != floorScript.IsFloorOperational()
      floorScript.SetElevatorFloorOperational(operational)
    EndIf
    I += 1
  EndWhile
EndFunction

Bool Function GetElevatorOperational()
  Return IsOperational
EndFunction

loadelevatorfloorscript[] Function GetLoadElevatorFloors()
  Return Self.GetLinkedRefChain(None, 100) as loadelevatorfloorscript[]
EndFunction
