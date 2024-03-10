ScriptName MovingPlatformMasterScript Extends ObjectReference

;-- Variables ---------------------------------------
ObjectReference[] callButtons
Int currentFloorIndex
Int currentNodeMarkerIndex
wwiseevent currentTravelStartEvent
wwiseevent currentTravelStopEvent
Float doorOpenSeconds = 1.5
Int[] floorIndicesByCallButtonIndex
Bool initialized = False
ObjectReference interiorButtonDown
ObjectReference interiorButtonUp
ObjectReference interiorDoor
Bool interiorDoorIsClosing
Int maxFloorIndex
ObjectReference movingPlatformBase
Bool movingPlatformIsMoving
Int[] nodeMarkerIndicesByFloorIndex
ObjectReference[] nodeMarkers
Int targetFloorIndex
Int targetNodeMarkerIndex
Int travelSoundInstanceID = -1
Int travelStepValue
Int travelStopSoundInstanceID = -1

;-- Properties --------------------------------------
Group requiredProperties
  Float Property TravelSpeed = 1.0 Auto Const
  Int Property StartingFloor = 0 Auto Const
  { Starting from "0" being the first floor. }
EndGroup

Group optionalProperties
  Bool Property animateAccessoryReferences = False Auto Const
  Keyword Property accessoruReferenceKeyword Auto Const
EndGroup

Group audioProperties
  Bool Property UseDirectionalSoundEvents = False Auto Const
  { when false, the 'TravelSoundEvent' will be played, regardless of the platform's movement direction. When true, direction-specific 'Start' and 'Stop' events will be played instead. }
  wwiseevent Property TravelSoundEvent Auto Const
  { This should be a looping sound, which plays while the moving platform is in motion. }
  wwiseevent Property UpwardTravelStartsEvent Auto Const
  { This sound plays once, when the platform begins traveling upwards. }
  wwiseevent Property UpwardTravelStopsEvent Auto Const
  { This sound plays once, when the platform stops traveling upwards. }
  wwiseevent Property DownwardTravelStartsEvent Auto Const
  { This sound plays once, when the platform begins traveling downwards. }
  wwiseevent Property DownwardTravelStopsEvent Auto Const
  { This sound plays once, when the platform stops traveling downwards. }
EndGroup

Group No_Touchy collapsedonref
  Keyword Property MovingPlatform_TranslationHelperKeyword Auto Const
  Keyword Property MovingPlatform_InteriorDoorKeyword Auto Const
  Keyword Property MovingPlatform_InteriorButtonUpKeyword Auto Const
  Keyword Property MovingPlatform_InteriorButtonDownKeyword Auto Const
  Keyword Property MovingPlatform_CallButtonFloorKeyword Auto Const
  LocationRefType Property MovingPlatform_FloorMarkerLocationRefType Auto Const
EndGroup


;-- Functions ---------------------------------------

Event OnCellLoad()
  If initialized == False
    Self.InitializeMovingPlatform()
  Else
    Self.RegisterForEvents()
  EndIf
EndEvent

Event OnUnload()
  Self.UnregisterFromEvents()
  wwiseevent.StopInstance(travelSoundInstanceID)
  wwiseevent.StopInstance(travelStopSoundInstanceID)
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  If akSender.IsActivationBlocked()
    Return 
  EndIf
  If movingPlatformIsMoving
    Return 
  EndIf
  If akSender == interiorButtonUp
    If currentFloorIndex < maxFloorIndex
      Self.ProcessFloorTravelRequest(currentFloorIndex + 1)
    EndIf
  ElseIf akSender == interiorButtonDown
    If currentFloorIndex > 0
      Self.ProcessFloorTravelRequest(currentFloorIndex - 1)
    EndIf
  Else
    Int callButtonIndex = callButtons.find(akSender, 0)
    If callButtonIndex > -1
      Int requestedFloorIndex = floorIndicesByCallButtonIndex[callButtonIndex]
      If requestedFloorIndex == currentFloorIndex
        Self.OpenInteriorDoor()
      Else
        Self.ProcessFloorTravelRequest(requestedFloorIndex)
      EndIf
    EndIf
  EndIf
EndEvent

Event ObjectReference.OnTranslationAlmostComplete(ObjectReference akSender)
  If akSender != movingPlatformBase
    Return 
  EndIf
  If currentNodeMarkerIndex != targetNodeMarkerIndex
    Self.TravelToNextNode()
  Else
    Self.CompleteFloorTravel(True)
  EndIf
EndEvent

Function InitializeMovingPlatform()
  movingPlatformBase = Self.GetLinkedRef(MovingPlatform_TranslationHelperKeyword)
  interiorDoor = Self.GetLinkedRef(MovingPlatform_InteriorDoorKeyword)
  interiorButtonUp = Self.GetLinkedRef(MovingPlatform_InteriorButtonUpKeyword)
  interiorButtonDown = Self.GetLinkedRef(MovingPlatform_InteriorButtonDownKeyword)
  nodeMarkers = Self.GetLinkedRefChain(None, 100)
  If nodeMarkers.Length == 0
    Return 
  EndIf
  nodeMarkerIndicesByFloorIndex = new Int[0]
  callButtons = new ObjectReference[0]
  floorIndicesByCallButtonIndex = new Int[0]
  Int I = 0
  Int currentFloor = -1
  While I < nodeMarkers.Length
    ObjectReference nodeMarker = nodeMarkers[I]
    If nodeMarker.HasLocRefType(MovingPlatform_FloorMarkerLocationRefType)
      currentFloor += 1
      nodeMarkerIndicesByFloorIndex.add(I, 1)
      ObjectReference[] callButtonsForFloor = nodeMarker.GetRefsLinkedToMe(MovingPlatform_CallButtonFloorKeyword, None)
      Int iCallButton = 0
      While iCallButton < callButtonsForFloor.Length
        ObjectReference callButton = callButtonsForFloor[iCallButton]
        callButtons.add(callButton, 1)
        floorIndicesByCallButtonIndex.add(currentFloor, 1)
        iCallButton += 1
      EndWhile
    EndIf
    I += 1
  EndWhile
  currentFloorIndex = StartingFloor
  Int startingFloornodeIndex = nodeMarkerIndicesByFloorIndex[currentFloorIndex]
  ObjectReference startingNodeMarker = nodeMarkers[startingFloornodeIndex]
  movingPlatformBase.MoveTo(startingNodeMarker, 0.0, 0.0, 0.0, True, False)
  maxFloorIndex = currentFloor
  Self.RegisterForEvents()
  initialized = True
EndFunction

Function RegisterForEvents()
  If interiorButtonUp
    Self.RegisterForRemoteEvent(interiorButtonUp as ScriptObject, "OnActivate")
  EndIf
  If interiorButtonDown
    Self.RegisterForRemoteEvent(interiorButtonDown as ScriptObject, "OnActivate")
  EndIf
  Int I = 0
  While I < callButtons.Length
    ObjectReference callButton = callButtons[I]
    Self.RegisterForRemoteEvent(callButton as ScriptObject, "OnActivate")
    I += 1
  EndWhile
EndFunction

Function UnregisterFromEvents()
  If interiorButtonUp
    Self.UnregisterForRemoteEvent(interiorButtonUp as ScriptObject, "OnActivate")
  EndIf
  If interiorButtonDown
    Self.UnregisterForRemoteEvent(interiorButtonDown as ScriptObject, "OnActivate")
  EndIf
  Int I = 0
  While I < callButtons.Length
    ObjectReference callButton = callButtons[I]
    Self.UnregisterForRemoteEvent(callButton as ScriptObject, "OnActivate")
    I += 1
  EndWhile
  Self.UnregisterForRemoteEvent(movingPlatformBase as ScriptObject, "OnTranslationAlmostComplete")
EndFunction

Function ProcessFloorTravelRequest(Int requestedFloorIndex)
  movingPlatformIsMoving = True
  Self.CloseInteriorDoor()
  currentNodeMarkerIndex = nodeMarkerIndicesByFloorIndex[currentFloorIndex]
  targetNodeMarkerIndex = nodeMarkerIndicesByFloorIndex[requestedFloorIndex]
  targetFloorIndex = requestedFloorIndex
  Int nodeDistance = targetNodeMarkerIndex - currentNodeMarkerIndex
  travelStepValue = 1
  If nodeDistance < 0
    travelStepValue = -1
  EndIf
  Self.RegisterForRemoteEvent(movingPlatformBase as ScriptObject, "OnTranslationAlmostComplete")
  If UseDirectionalSoundEvents
    If travelStepValue > 0
      currentTravelStartEvent = UpwardTravelStartsEvent
      currentTravelStopEvent = UpwardTravelStopsEvent
    ElseIf travelStepValue < 0
      currentTravelStartEvent = DownwardTravelStartsEvent
      currentTravelStopEvent = DownwardTravelStopsEvent
    EndIf
  Else
    currentTravelStartEvent = TravelSoundEvent
    currentTravelStopEvent = None
  EndIf
  wwiseevent.StopInstance(travelSoundInstanceID)
  If currentTravelStartEvent != None
    travelSoundInstanceID = currentTravelStartEvent.Play(movingPlatformBase, None, None)
  EndIf
  Self.TravelToNextNode()
EndFunction

Function TravelToNextNode()
  Int nextNodeMarkerIndex = currentNodeMarkerIndex + travelStepValue
  ObjectReference nextNodeMarker = nodeMarkers[nextNodeMarkerIndex]
  currentNodeMarkerIndex = nextNodeMarkerIndex
  If animateAccessoryReferences
    String accessoryAnimationName = ""
    If travelStepValue > 0
      accessoryAnimationName = "Play02"
    ElseIf travelStepValue < 0
      accessoryAnimationName = "Play01"
    EndIf
    ObjectReference[] accessoryReferences = Self.GetRefsLinkedToMe(accessoruReferenceKeyword, None)
    Int I = 0
    While I < accessoryReferences.Length
      ObjectReference accessoryReference = accessoryReferences[I]
      accessoryReference.PlayAnimation(accessoryAnimationName)
      I += 1
    EndWhile
  EndIf
  movingPlatformBase.TranslateToRef(nextNodeMarker, TravelSpeed, 0.0)
EndFunction

Function CancelTravelAndReturnToOriginFloor()
  Int returnFloorIndex = currentFloorIndex
  Self.CompleteFloorTravel(False)
  Self.ProcessFloorTravelRequest(returnFloorIndex)
EndFunction

Function CompleteFloorTravel(Bool OpenInteriorDoor)
  wwiseevent.StopInstance(travelStopSoundInstanceID)
  If currentTravelStopEvent != None
    travelStopSoundInstanceID = currentTravelStopEvent.Play(movingPlatformBase, None, None)
  EndIf
  Self.UnregisterForRemoteEvent(movingPlatformBase as ScriptObject, "OnTranslationAlmostComplete")
  If OpenInteriorDoor
    Self.OpenInteriorDoor()
  EndIf
  currentFloorIndex = targetFloorIndex
  movingPlatformIsMoving = False
EndFunction

Function OpenInteriorDoor()
  Int openState = interiorDoor.GetOpenState()
  If openState == 3
    interiorDoor.SetOpen(True)
    Utility.Wait(doorOpenSeconds)
  EndIf
EndFunction

Function CloseInteriorDoor()
  Int openState = interiorDoor.GetOpenState()
  If openState == 1
    interiorDoorIsClosing = True
    interiorDoor.SetOpen(False)
    Utility.Wait(doorOpenSeconds)
    interiorDoorIsClosing = False
  EndIf
EndFunction

Bool Function IsInteriorDoorClosing()
  Return interiorDoorIsClosing
EndFunction

Float Function GetDoorOpenSeconds()
  Return doorOpenSeconds
EndFunction

Bool Function IsMoving()
  Return movingPlatformIsMoving
EndFunction

Int Function GetCurrentDirection()
  Return travelStepValue
EndFunction
