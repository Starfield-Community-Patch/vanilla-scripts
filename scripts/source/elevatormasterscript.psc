ScriptName ElevatorMasterScript Extends ObjectReference conditional hidden
{ Script for handling elevators. Be sure to AttachRef any thing you want to move with the platform helper }

;-- Variables ---------------------------------------
Bool bBeingActivated = False
Bool bElevatorIsAtTop = False conditional
Bool bElevatorIsMoving = False conditional
Bool bHasAlreadyLoaded = False
Float fAnimRate
Int iElevatorLoopInstance

;-- Properties --------------------------------------
Group Optional_Properties
  Float Property fTimeTakenToMove = 3.0 Auto
  { The time, in seconds, it takes for the elevator to move from point A to B. }
  Bool Property bStartAtTop = True Auto
  { Default = TRUE, elevator is starting at the top }
  Bool Property bStartDeactivated = False Auto
  { Whether this elevator starts "off" or not. }
  Message Property DeactivatedMessage Auto
  { Message that shows up when any elevator button is pressed while it's deactivated. }
  Bool Property CloseInteriorDoor = True Auto
  { Inner door closes by default. Set this to FALSE to keep it from closing at all. }
EndGroup

Group No_Touchy collapsedonref
  Keyword Property Elevator_PlatformHelper Auto mandatory
  Keyword Property Elevator_InteriorButton Auto mandatory
  Keyword Property Elevator_BottomButton Auto mandatory
  Keyword Property Elevator_TopButton Auto mandatory
  Keyword Property Elevator_InteriorDoor Auto mandatory
  Keyword Property Elevator_BottomDoor Auto mandatory
  Keyword Property Elevator_TopDoor Auto mandatory
  Keyword Property Elevator_BottomNavCut Auto mandatory
  Keyword Property Elevator_TopNavCut Auto mandatory
  Keyword Property Elevator_DisableAfterLoad Auto mandatory
  Keyword Property Elevator_SoundMarker01 Auto mandatory
  { SoundMarker that enables when elevator moves and disables when elevator stops }
EndGroup


;-- Functions ---------------------------------------

Function MoveElevatorMeterHandler(ObjectReference Meter1, ObjectReference Meter2)
  ; Empty function
EndFunction

Event OnInit()
  fAnimRate = 1.0 / fTimeTakenToMove
EndEvent

Event OnCellLoad()
  Self.ElevatorSetupFunction()
EndEvent

Event OnUnload()
  Self.UnregisterForDistanceEvents(Self as ScriptObject, Game.GetPlayer() as ScriptObject, -1)
EndEvent

Function ElevatorSetupFunction()
  ObjectReference PlatformHelper = Self.GetLinkedRef(Elevator_PlatformHelper)
  ObjectReference CallButtonTop = Self.GetLinkedRef(Elevator_TopButton)
  ObjectReference CallButtonBottom = Self.GetLinkedRef(Elevator_BottomButton)
  ObjectReference TopDoor = Self.GetLinkedRef(Elevator_TopDoor)
  ObjectReference BottomDoor = Self.GetLinkedRef(Elevator_BottomDoor)
  ObjectReference DisableAfterLoad = Self.GetLinkedRef(Elevator_DisableAfterLoad)
  Self.GoToState("AlreadyLoaded")
  Self.RegisterForRemoteEvent(Self.GetLinkedRef(Elevator_InteriorButton) as ScriptObject, "OnActivate")
  If CallButtonTop
    Self.RegisterForRemoteEvent(CallButtonTop as ScriptObject, "OnActivate")
  EndIf
  If TopDoor
    TopDoor.BlockActivation(True, False)
    Self.RegisterForRemoteEvent(TopDoor as ScriptObject, "OnActivate")
    Self.RegisterForRemoteEvent(TopDoor as ScriptObject, "OnOpen")
    Self.RegisterForRemoteEvent(TopDoor as ScriptObject, "OnClose")
  EndIf
  If CallButtonBottom
    Self.RegisterForRemoteEvent(CallButtonBottom as ScriptObject, "OnActivate")
  EndIf
  If BottomDoor
    BottomDoor.BlockActivation(True, False)
    Self.RegisterForRemoteEvent(BottomDoor as ScriptObject, "OnActivate")
    Self.RegisterForRemoteEvent(BottomDoor as ScriptObject, "OnOpen")
    Self.RegisterForRemoteEvent(BottomDoor as ScriptObject, "OnClose")
  EndIf
  If bHasAlreadyLoaded == False
    ObjectReference InteriorDoor = Self.GetLinkedRef(Elevator_InteriorDoor)
    If bStartDeactivated == False
      If CloseInteriorDoor == False
        If InteriorDoor.Is3DLoaded() == False
          InteriorDoor.Waitfor3dLoad()
        EndIf
        InteriorDoor.SetOpen(True)
      EndIf
      TopDoor.BlockActivation(True, False)
      BottomDoor.BlockActivation(True, False)
    EndIf
    If bStartAtTop == True
      PlatformHelper.SetAnimationVariableFloat("CurrentPosition", 1.0)
      PlatformHelper.SetAnimationVariableFloat("Position", 1.0)
      bElevatorIsAtTop = True
      DisableAfterLoad.Disable(False)
    Else
      If PlatformHelper.Is3DLoaded() == False
        PlatformHelper.Waitfor3dLoad()
      EndIf
      PlatformHelper.SetAnimationVariableFloat("CurrentPosition", 0.0)
      PlatformHelper.SetAnimationVariableFloat("Position", 0.0)
      bElevatorIsAtTop = False
    EndIf
    bHasAlreadyLoaded = True
  EndIf
EndFunction

Function ResetElevator()
  bHasAlreadyLoaded = False
  Self.ElevatorSetupFunction()
EndFunction

Function MakeElevatorFunctional()
  ObjectReference PlatformHelper = Self.GetLinkedRef(Elevator_PlatformHelper)
  ObjectReference CallButtonTop = Self.GetLinkedRef(Elevator_TopButton)
  ObjectReference CallButtonBottom = Self.GetLinkedRef(Elevator_BottomButton)
  bStartDeactivated = False
  bHasAlreadyLoaded = True
  PlatformHelper.SetAnimationVariableFloat("Speed", fAnimRate)
EndFunction

Function MakeElevatorNonFunctional()
  ObjectReference PlatformHelper = Self.GetLinkedRef(Elevator_PlatformHelper)
  ObjectReference CallButtonTop = Self.GetLinkedRef(Elevator_TopButton)
  ObjectReference CallButtonBottom = Self.GetLinkedRef(Elevator_BottomButton)
  bStartDeactivated = True
  bHasAlreadyLoaded = True
  PlatformHelper.SetAnimationVariableFloat("Speed", fAnimRate)
EndFunction

Event ObjectReference.OnOpen(ObjectReference akSender, ObjectReference akActionRef)
  ObjectReference TopDoor = Self.GetLinkedRef(Elevator_TopDoor)
  ObjectReference BottomDoor = Self.GetLinkedRef(Elevator_BottomDoor)
  If akSender == TopDoor
    TopDoor.BlockActivation(True, True)
  EndIf
  If akSender == BottomDoor
    BottomDoor.BlockActivation(True, True)
  EndIf
EndEvent

Event ObjectReference.OnClose(ObjectReference akSender, ObjectReference akActionRef)
  ObjectReference TopDoor = Self.GetLinkedRef(Elevator_TopDoor)
  ObjectReference BottomDoor = Self.GetLinkedRef(Elevator_BottomDoor)
  If akSender == TopDoor
    TopDoor.BlockActivation(True, False)
  EndIf
  If akSender == BottomDoor
    BottomDoor.BlockActivation(True, False)
  EndIf
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    Self.GoToState("Busy")
    ObjectReference CallButtonTop = Self.GetLinkedRef(Elevator_TopButton)
    ObjectReference CallButtonBottom = Self.GetLinkedRef(Elevator_BottomButton)
    ObjectReference TopDoor = Self.GetLinkedRef(Elevator_TopDoor)
    ObjectReference BottomDoor = Self.GetLinkedRef(Elevator_BottomDoor)
    ObjectReference InteriorDoor = Self.GetLinkedRef(Elevator_InteriorDoor)
    ObjectReference InteriorButton = Self.GetLinkedRef(Elevator_InteriorButton)
    Bool bIgnoreDoorActivation = False
    If akSender == TopDoor && Math.ABS(TopDoor.GetHeadingAngle(Game.GetPlayer() as ObjectReference)) < 90.0
      bIgnoreDoorActivation = True
      TopDoor.SetOpen(True)
    EndIf
    If akSender == BottomDoor && Math.ABS(BottomDoor.GetHeadingAngle(Game.GetPlayer() as ObjectReference)) < 90.0
      bIgnoreDoorActivation = True
      BottomDoor.SetOpen(True)
    EndIf
    If bStartDeactivated == False && bIgnoreDoorActivation == False
      If bElevatorIsMoving == False && bBeingActivated == False
        Self.BlockAllButtons(True)
        bBeingActivated = True
        If akSender == InteriorButton
          Self.GetLinkedRef(Elevator_PlatformHelper).SetAnimationVariableFloat("Speed", fAnimRate)
          Self.HandleElevatorDoor(TopDoor, False)
          Self.HandleElevatorDoor(BottomDoor, False)
          Self.HandleElevatorDoor(InteriorDoor, False)
          Utility.Wait(0.5)
          Self.MoveElevator(True)
        ElseIf akSender == CallButtonTop || akSender == TopDoor && bStartDeactivated == False
          Self.GetLinkedRef(Elevator_PlatformHelper).SetAnimationVariableFloat("Speed", fAnimRate / 2.0)
          If bElevatorIsAtTop == True
            Utility.Wait(0.5)
            Self.HandleElevatorDoor(TopDoor, True)
            Utility.Wait(Utility.RandomFloat(0.100000001, 0.300000012))
            bBeingActivated = False
            Self.BlockAllButtons(False)
          Else
            Self.HandleElevatorDoor(TopDoor, False)
            Utility.Wait(Utility.RandomFloat(0.100000001, 0.300000012))
            Self.HandleElevatorDoor(BottomDoor, False)
            Self.HandleElevatorDoor(InteriorDoor, False)
            Utility.Wait(0.5)
            Self.MoveElevator(False)
          EndIf
        ElseIf akSender == CallButtonBottom || akSender == BottomDoor && bStartDeactivated == False
          Self.GetLinkedRef(Elevator_PlatformHelper).SetAnimationVariableFloat("Speed", fAnimRate / 2.0)
          If bElevatorIsAtTop == False
            Utility.Wait(0.5)
            Self.HandleElevatorDoor(BottomDoor, True)
            Utility.Wait(Utility.RandomFloat(0.100000001, 0.300000012))
            Self.HandleElevatorDoor(InteriorDoor, True)
            bBeingActivated = False
            Self.BlockAllButtons(False)
          Else
            Self.HandleElevatorDoor(TopDoor, False)
            Utility.Wait(Utility.RandomFloat(0.100000001, 0.300000012))
            Self.HandleElevatorDoor(BottomDoor, False)
            Self.HandleElevatorDoor(InteriorDoor, False)
            Utility.Wait(0.5)
            Self.MoveElevator(False)
          EndIf
        EndIf
      EndIf
    ElseIf bStartDeactivated == True
      DeactivatedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
    If bIgnoreDoorActivation == True
      bIgnoreDoorActivation = False
    EndIf
  EndIf
EndEvent

Function BlockAllButtons(Bool bShouldBlock)
  ObjectReference InteriorButton = Self.GetLinkedRef(Elevator_InteriorButton)
  ObjectReference CallButtonTop = Self.GetLinkedRef(Elevator_TopButton)
  ObjectReference CallButtonBottom = Self.GetLinkedRef(Elevator_BottomButton)
  If bShouldBlock == True
    InteriorButton.BlockActivation(True, False)
    CallButtonTop.BlockActivation(True, False)
    CallButtonBottom.BlockActivation(True, False)
  Else
    InteriorButton.BlockActivation(False, False)
    CallButtonTop.BlockActivation(False, False)
    CallButtonBottom.BlockActivation(False, False)
  EndIf
EndFunction

Function HandleElevatorDoor(ObjectReference akDoor, Bool bOpen)
  ObjectReference InteriorDoor = Self.GetLinkedRef(Elevator_InteriorDoor)
  If bOpen == True
    If akDoor.GetOpenState() >= 3
      akDoor.SetOpen(True)
    EndIf
  ElseIf akDoor.GetOpenState() <= 2
    If akDoor == InteriorDoor && CloseInteriorDoor == False
      
    Else
      akDoor.SetOpen(False)
    EndIf
  EndIf
EndFunction

Function MoveElevator(Bool bActivatedFromPanel)
  ObjectReference PlatformHelper = Self.GetLinkedRef(Elevator_PlatformHelper)
  ObjectReference TopDoor = Self.GetLinkedRef(Elevator_TopDoor)
  ObjectReference BottomDoor = Self.GetLinkedRef(Elevator_BottomDoor)
  ObjectReference InteriorDoor = Self.GetLinkedRef(Elevator_InteriorDoor)
  ObjectReference InteriorButton = Self.GetLinkedRef(Elevator_InteriorButton)
  ObjectReference ElevatorRef = Self.GetLinkedRef(None)
  ObjectReference SoundMarker01 = Self.GetLinkedRef(Elevator_SoundMarker01)
  bElevatorIsMoving = True
  Utility.Wait(0.200000003)
  If bElevatorIsAtTop == True
    PlatformHelper.SetAnimationVariableFloat("Position", 0.0)
    Self.MoveElevatorFloorPlatHandler(0)
  Else
    PlatformHelper.SetAnimationVariableFloat("Position", 1.0)
    Self.MoveElevatorFloorPlatHandler(1)
  EndIf
  If SoundMarker01
    SoundMarker01.enableNoWait(False)
  EndIf
  ElevatorRef.PlayAnimation("Stage2")
  PlatformHelper.PlayAnimationAndWait("Play01", "done")
  ElevatorRef.PlayAnimation("Stage1")
  If SoundMarker01
    SoundMarker01.disableNoWait(False)
  EndIf
  If bElevatorIsAtTop == False
    Self.MoveElevatorDoorHandler(BottomDoor)
  Else
    Self.MoveElevatorDoorHandler(TopDoor)
  EndIf
  Utility.Wait(Utility.RandomFloat(0.100000001, 0.300000012))
  Self.MoveElevatorDoorHandler(InteriorDoor)
  Utility.Wait(1.200000048)
  Self.BlockAllButtons(False)
  bBeingActivated = False
  bElevatorIsMoving = False
  Self.GoToState("")
EndFunction

Function MoveElevatorFloorPlatHandler(Int PlatformHelperAnimVar)
  ObjectReference PlatformHelper = Self.GetLinkedRef(Elevator_PlatformHelper)
  bElevatorIsAtTop = PlatformHelperAnimVar as Bool
EndFunction

Function MoveElevatorDoorHandler(ObjectReference DoorRef)
  Self.HandleElevatorDoor(DoorRef, True)
  Self.HandleElevatorDoor(DoorRef, True)
EndFunction

;-- State -------------------------------------------
State AlreadyLoaded

  Event OnLoad()
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
State Busy
EndState
