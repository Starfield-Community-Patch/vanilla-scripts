ScriptName LoadElevatorFloorScript Extends ObjectReference

;-- Structs -----------------------------------------
Struct LoadElevatorFloorSetupData
  Int floorIndex
  loadelevatormanagerscript managerScript
  Message buttonActivationMessage
EndStruct


;-- Variables ---------------------------------------
ObjectReference[] allTriggers
ObjectReference[] cosmeticEntranceDoors
Int doorControlTimerID = 0 Const
Bool isFloorOperational = True
Int lockLevelInaccessible = 254 Const
Int lockLevelUnlocked = 0 Const
ObjectReference[] occupancyTriggers
ObjectReference[] proximityTriggers

;-- Properties --------------------------------------
Group NoTouch collapsedonref
{ These properties should only be set in the base form. }
  Keyword Property ProximityTriggerKeyword Auto Const mandatory
  Keyword Property OccupancyTriggerKeyword Auto Const mandatory
  Keyword Property LobbyDoorKeyword Auto Const mandatory
  Keyword Property CosmeticEntranceDoorKeyord Auto Const mandatory
  Keyword Property FloorRequestTargetKeyword Auto Const mandatory
  Keyword Property LoadElevatorManagerKeyword Auto Const mandatory
  GlobalVariable Property DoorControlTimerSeconds Auto Const mandatory
  GlobalVariable Property ArrivalSequenceWaitSeconds Auto Const mandatory
EndGroup

Group Customization
{ Set these properties to customize how your elevator floor behaves. }
  wwiseevent Property OBJ_Elevator_Generic_02_Arrive_WEF Auto Const
  { The sound that players when the player arrives on this floor. }
  wwiseevent Property OBJ_Elevator_Generic_02_Arrive_Chime_WEF Auto Const
  { The sound that players when non-player Actors arrive on this floor. }
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  ObjectReference managerDoor = Self.GetManagerDoor()
  If managerDoor == None
    
  EndIf
  loadelevatorfloorscript:loadelevatorfloorsetupdata setupData = Self.GetLoadElevatorFloorSetupDataRecursive(Self as ObjectReference, 0)
  If setupData == None
    
  EndIf
  ObjectReference[] elevatorButtons = Self.GetLinkedRefChain(FloorRequestTargetKeyword, 100)
  Int I = 0
  While I < elevatorButtons.Length
    loadelevatorrequestflooronactivate elevatorButton = elevatorButtons[I] as loadelevatorrequestflooronactivate
    elevatorButton.AssignLoadElevatorData(setupData.floorIndex, setupData.managerScript)
    elevatorButton.AssignButtonName(setupData.buttonActivationMessage)
    I += 1
  EndWhile
  cosmeticEntranceDoors = Self.GetRefsLinkedToMe(CosmeticEntranceDoorKeyord, None)
  proximityTriggers = Self.GetRefsLinkedToMe(ProximityTriggerKeyword, None)
  occupancyTriggers = Self.GetRefsLinkedToMe(OccupancyTriggerKeyword, None)
  allTriggers = new ObjectReference[proximityTriggers.Length + occupancyTriggers.Length]
  Int iTrigger = 0
  I = 0
  While I < proximityTriggers.Length
    allTriggers[iTrigger] = proximityTriggers[I]
    iTrigger += 1
    I += 1
  EndWhile
  I = 0
  While I < occupancyTriggers.Length
    allTriggers[iTrigger] = occupancyTriggers[I]
    iTrigger += 1
    I += 1
  EndWhile
  If setupData.managerScript.GetElevatorOperational()
    Self.RegisterTriggerEvents(allTriggers)
  Else
    managerDoor.Disable(False)
    Self.BlockElevatorButtonActivation(True, True)
    isFloorOperational = False
    Self.RegisterTriggerEvents(occupancyTriggers)
  EndIf
  ObjectReference[] triggers = None
  If isFloorOperational
    triggers = allTriggers
  Else
    triggers = occupancyTriggers
  EndIf
  Bool triggersAreOccupied = Self.AreTriggersOccupied(triggers)
  If triggersAreOccupied
    Self.GotoState("DoorsAreOpenState")
    Self.SetAllDoorsOpen(True)
    Self.StartTimer(DoorControlTimerSeconds.GetValue(), doorControlTimerID)
  EndIf
EndEvent

Event OnUnload()
  Self.UnregisterTriggerEvents(allTriggers)
  cosmeticEntranceDoors.clear()
  proximityTriggers.clear()
  occupancyTriggers.clear()
  allTriggers.clear()
EndEvent

Function SetElevatorButtonName(Message buttonName)
  ObjectReference[] elevatorButtons = Self.GetLinkedRefChain(FloorRequestTargetKeyword, 100)
  Int I = 0
  While I < elevatorButtons.Length
    loadelevatorrequestflooronactivate elevatorButton = elevatorButtons[I] as loadelevatorrequestflooronactivate
    elevatorButton.AssignButtonName(buttonName)
    I += 1
  EndWhile
EndFunction

Bool Function IsAccessible()
  Return Self.GetManagerDoor().GetLockLevel() != lockLevelInaccessible
EndFunction

Function SetAccessible(Bool accessible)
  ObjectReference managerDoor = Self.GetManagerDoor()
  If accessible
    managerDoor.SetLockLevel(lockLevelUnlocked)
    managerDoor.Unlock(False)
  Else
    managerDoor.SetLockLevel(lockLevelInaccessible)
    managerDoor.Lock(True, False, True)
  EndIf
EndFunction

Function PlayArrivalSound(Bool isPlayer)
  If isPlayer
    If OBJ_Elevator_Generic_02_Arrive_WEF != None
      OBJ_Elevator_Generic_02_Arrive_WEF.Play(Self as ObjectReference, None, None)
    EndIf
  ElseIf OBJ_Elevator_Generic_02_Arrive_Chime_WEF != None
    OBJ_Elevator_Generic_02_Arrive_Chime_WEF.Play(Self as ObjectReference, None, None)
  EndIf
EndFunction

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
  Self.GotoState("DoorsAreOpenState")
  If occupancyTriggers.find(akSender, 0) >= 0
    Bool isPlayer = akActionRef == Game.GetPlayer() as ObjectReference
    If isPlayer
      Utility.Wait(ArrivalSequenceWaitSeconds.GetValue())
    EndIf
    Self.PlayArrivalSound(isPlayer)
  EndIf
  Self.SetAllDoorsOpen(True)
  Self.StartTimer(DoorControlTimerSeconds.GetValue(), doorControlTimerID)
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == doorControlTimerID
    ObjectReference[] triggers = None
    If isFloorOperational
      triggers = allTriggers
    Else
      triggers = occupancyTriggers
    EndIf
    Bool triggersAreOccupied = Self.AreTriggersOccupied(triggers)
    If triggersAreOccupied
      Self.StartTimer(DoorControlTimerSeconds.GetValue(), doorControlTimerID)
    Else
      Self.SetAllDoorsOpen(False)
      Self.GotoState("")
    EndIf
  EndIf
EndEvent

Bool Function AreTriggersOccupied(ObjectReference[] triggers)
  Int I = 0
  While I < triggers.Length
    If triggers[I].GetTriggerObjectCount() > 0
      Return True
    EndIf
    I += 1
  EndWhile
  Return False
EndFunction

Function SetAllDoorsOpen(Bool setOpen)
  Int iDoor = 0
  While iDoor < cosmeticEntranceDoors.Length
    ObjectReference cosmeticEntranceDoor = cosmeticEntranceDoors[iDoor]
    Int openState = cosmeticEntranceDoor.GetOpenState()
    If setOpen
      If openState == 3 || openState == 4
        cosmeticEntranceDoor.setOpen(True)
      EndIf
    ElseIf openState == 1 || openState == 2
      cosmeticEntranceDoor.setOpen(False)
    EndIf
    iDoor += 1
  EndWhile
EndFunction

Function SetElevatorFloorOperational(Bool operational)
  ObjectReference managerDoor = Self.GetManagerDoor()
  If operational
    managerDoor.Enable(False)
    Self.RegisterTriggerEvents(proximityTriggers)
    Self.BlockElevatorButtonActivation(False, False)
  Else
    managerDoor.Disable(False)
    Self.UnregisterTriggerEvents(proximityTriggers)
    Self.BlockElevatorButtonActivation(True, True)
  EndIf
  isFloorOperational = operational
EndFunction

Bool Function isFloorOperational()
  Return isFloorOperational
EndFunction

Function BlockElevatorButtonActivation(Bool blockActivation, Bool blockActivationText)
  ObjectReference[] elevatorButtons = Self.GetLinkedRefChain(FloorRequestTargetKeyword, 100)
  Int I = 0
  While I < elevatorButtons.Length
    elevatorButtons[I].blockActivation(blockActivation, blockActivationText)
    I += 1
  EndWhile
EndFunction

Function RegisterTriggerEvents(ObjectReference[] triggers)
  Int I = 0
  While I < triggers.Length
    ObjectReference trigger = triggers[I]
    Self.RegisterForRemoteEvent(trigger as ScriptObject, "OnTriggerEnter")
    I += 1
  EndWhile
EndFunction

Function UnregisterTriggerEvents(ObjectReference[] triggers)
  Int I = 0
  While I < triggers.Length
    ObjectReference trigger = triggers[I]
    Self.UnregisterForRemoteEvent(trigger as ScriptObject, "OnTriggerEnter")
    I += 1
  EndWhile
EndFunction

ObjectReference Function GetManagerDoor()
  ObjectReference managerDoor = Self.GetLinkedRef(LobbyDoorKeyword)
  If managerDoor == None
    
  EndIf
  Return managerDoor
EndFunction

loadelevatorfloorscript:loadelevatorfloorsetupdata Function GetLoadElevatorFloorSetupDataRecursive(ObjectReference target, Int floorIndex)
  ObjectReference[] refsLinkedToMe = target.GetRefsLinkedToMe(None, None)
  If refsLinkedToMe.Length == 0
    Return None
  EndIf
  ObjectReference refLinkedToMe = refsLinkedToMe[0]
  If refLinkedToMe.HasKeyword(LoadElevatorManagerKeyword)
    loadelevatorfloorscript:loadelevatorfloorsetupdata data = new loadelevatorfloorscript:loadelevatorfloorsetupdata
    data.floorIndex = floorIndex
    data.managerScript = refLinkedToMe as loadelevatormanagerscript
    data.buttonActivationMessage = data.managerScript.GetButtonMessageForFloor(floorIndex)
    Return data
  Else
    floorIndex += 1
    Return Self.GetLoadElevatorFloorSetupDataRecursive(refLinkedToMe, floorIndex)
  EndIf
EndFunction

;-- State -------------------------------------------
State DoorsAreOpenState

  Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
    ; Empty function
  EndEvent
EndState
