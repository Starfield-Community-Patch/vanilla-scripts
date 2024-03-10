ScriptName OutpostTutorialScript Extends Quest conditional

;-- Structs -----------------------------------------
Struct WorkshopTutorial
  Int tutorialID
  { the ID of this tutorial (which is made up of 1 or more TutorialItems ) }
  String description
  { describe this so it's easier to parse later }
  Bool bDone
  { if true, this whole sequence is done }
  Int startingStep = -1
  { set to index of starting step in TutorialSteps array }
  Int activeStep = -1
  { -1 = not active, otherwise the active step (index to TutorialSteps array) }
  ObjectReference outpostRef
  { the workshop where this tutorial is happening }
  ReferenceAlias AliasToFill
  { optional - put the object into this alias
		will be cleared when step is completed }
  Int mutuallyExclusiveTutorialID = -1
  { if this tutorial is currently running, don't start this one
		AND automatically complete me if mutually exclusive tutorial completes }
  conditionform requiredCondition
  { if this condition isn't true, don't start this tutorial }
  Int UnregisterForEventTypeOnCompletion = -1
  { if this is the final event of a type, unregister for that event when done }
  GlobalVariable completionGlobal
  { optional - set this global when complete }
EndStruct

Struct WorkshopTutorialStep
  Int tutorialID = -1
  { which tutorial do I go with? (since we can't put arrays into structs) - matches ID of WorkshopTutorial }
  Bool bStartingStep
  { TRUE for the step that starts a tutorial sequence - should be only 1 of these }
  Bool bFinalStep
  { TRUE for the step that completes a tutorial sequence }
  Message TriggerMessage
  { message to display when starting this tutorial step - optional }
  Message TriggerMessagePC
  { if this exists, use this instead of TriggerMessage if not using gamepad }
  Bool bTriggerIsMessageBox = False
  { set to true to display trigger messages as message boxes instead of help messages }
  Message HelpMessage
  { help message to display during this step }
  Message CompletionMessage
  { message to display when completing this tutorial step - optional - usually just the final step needs this }
  Message CompletionMessage2
  Message CompletionMessage3
  conditionform TriggerCondition
  { OPTIONAL - condition must evaluate to TRUE for this to even consider triggering }
  Int TriggerEvent
  { event type that STARTS this step
		(I think this only applies to starting steps) }
  Bool TriggerOnEventOnly = False
  { if TRUE don't check anything but getting the event }
  Int CompletionEvent
  { event that completes this step
		-1 = immediately complete the step (no additional event needed) }
  Bool CompletionOnEventOnly = False
  { if TRUE don't check anything but getting the event }
  conditionform CompletionCondition
  { condition must evaluate to TRUE for this to complete }
  Int Status = -1
  { -1 = not started
	  0 = active
	  1 = done }
EndStruct


;-- Variables ---------------------------------------
String HelpMessageString = "OutpostTutorialEvent"
Bool debugAllowMiscObjective = False conditional
Float helpMessageDurationLong = 10.0
Float helpMessageDurationShort = 3.0
Float helpMessageInterval = 10.0
Float messageBoxDelay = 0.200000003

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard workshopEventGuard

;-- Properties --------------------------------------
Group MiscObjective
  conditionform Property OutpostTutorialConditionMiscObjective Auto Const mandatory
  { condition to check for when to trigger outpost misc objective }
  Keyword Property OutpostPreventPlacement Auto Const mandatory
  { keyword on location that prevents outpost placement }
  Keyword Property LocTypeSurface Auto Const mandatory
  { find planet surface }
  Int Property MiscObjectiveStartStage = 10 Auto Const
  Int Property MiscObjectiveDoneStage = 20 Auto Const
EndGroup

Group EventTypes
  Int Property EventType_Build = 0 Auto Const
  Int Property EventType_Move = 1 Auto Const
  Int Property EventType_Destroy = 2 Auto Const
  Int Property EventType_Assign = 3 Auto Const
  Int Property EventType_Unassign = 4 Auto Const
  Int Property EventType_DestructionState = 5 Auto Const
  Int Property EventType_PowerOn = 6 Auto Const
  Int Property EventType_EnterMenu = 7 Auto Const
  Int Property EventType_PlaceBeacon = 8 Auto Const
  Int Property EventType_OutputLink = 9 Auto Const
  Int Property EventType_EnterBeaconPlacement = 10 Auto Const
  Int Property EventType_PowerOff = 11 Auto Const
  Int Property EventType_Flycam = 12 Auto Const
EndGroup

ReferenceAlias Property Alias_Outpost Auto Const
ReferenceAlias Property Alias_PowerRequiredObject Auto Const
ReferenceAlias Property Alias_SourceObject Auto Const
ReferenceAlias Property Alias_TargetObject Auto Const
Keyword Property WorkshopNoRepairKeyword Auto Const mandatory
{ keyword on object which indicates it can't be repaired }
ActorValue Property OutpostTutorialObject Auto Const mandatory
{ script only checks refs with this AV }
GlobalVariable Property OutpostTutorialEnterMenuCount Auto Const mandatory
{ count how many times player has entered build menu }
ActorValue Property PlayerUnityTimesEntered Auto Const mandatory
{ check this on start - no tutorials for new game plus }
Int Property PlaceOutpostAchievement = 23 Auto Const
{ achievement for placing an outpost }
outposttutorialscript:workshoptutorial[] Property Tutorials Auto
{ list of tutorials }
outposttutorialscript:workshoptutorialstep[] Property TutorialSteps Auto
{ complete list of all tutorial steps - grouped by tutorialID }

;-- Functions ---------------------------------------

Event OnQuestInit()
  Actor playerRef = Game.GetPlayer()
  If playerRef.GetValue(PlayerUnityTimesEntered) > 0.0
    Self.Stop()
  Else
    Self.RegisterForRemoteEvent(playerRef as ScriptObject, "OnEnterOutpostBeaconMode")
    Self.RegisterForRemoteEvent(playerRef as ScriptObject, "OnOutpostPlaced")
    Self.RegisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnWorkshopObjectPlaced")
    Self.RegisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnWorkshopObjectGrabbed")
    Self.RegisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnWorkshopObjectMoved")
    Self.RegisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnObjectDestroyed")
    Self.RegisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnObjectRepaired")
    Self.RegisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnWorkshopObjectRemoved")
    Self.RegisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnOutpostItemPowerOn")
    Self.RegisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnOutpostItemPowerOff")
    Self.RegisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnWorkshopOutputLink")
    Self.RegisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnWorkshopFlycam")
    Self.RegisterForRemoteEvent(playerRef as ScriptObject, "OnLocationChange")
  EndIf
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  Actor playerRef = Game.GetPlayer()
  If akSender == playerRef
    If OutpostTutorialConditionMiscObjective.IsTrue(playerRef as ObjectReference, None)
      Location currentLocation = playerRef.GetCurrentLocation()
      If currentLocation.HasKeyword(OutpostPreventPlacement) == False
        If currentLocation.HasKeyword(LocTypeSurface)
          Self.setStage(MiscObjectiveStartStage)
          Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
        EndIf
      EndIf
    EndIf
  EndIf
EndEvent

Function HandleWorkshopEvent(ObjectReference outpostRef, ObjectReference newObject, Int iEventType, ObjectReference targetObject)
  Guard workshopEventGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Int completedCount = 0
    If newObject
      Alias_SourceObject.ForceRefTo(newObject)
    Else
      Alias_SourceObject.Clear()
    EndIf
    If targetObject
      Alias_TargetObject.ForceRefTo(targetObject)
    EndIf
    Int tutorialIndex = 0
    While tutorialIndex < Tutorials.Length
      outposttutorialscript:workshoptutorial theTutorial = Tutorials[tutorialIndex]
      If theTutorial.bDone == False
        If theTutorial.activeStep > -1
          If theTutorial.outpostRef == outpostRef
            Self.EvaluateEvent(theTutorial, theTutorial.activeStep, outpostRef, newObject, targetObject, iEventType)
          Else
            Self.RollBackTutorial(theTutorial)
            Self.EvaluateEvent(theTutorial, theTutorial.startingStep, outpostRef, newObject, targetObject, iEventType)
          EndIf
        Else
          Self.EvaluateEvent(theTutorial, theTutorial.startingStep, outpostRef, newObject, targetObject, iEventType)
        EndIf
      Else
        If theTutorial.UnregisterForEventTypeOnCompletion > -1
          Self.UnregisterForWorkshopEvent(theTutorial.UnregisterForEventTypeOnCompletion)
        EndIf
        completedCount += 1
      EndIf
      tutorialIndex += 1
    EndWhile
    Int stepIndex = 0
    While stepIndex < TutorialSteps.Length
      outposttutorialscript:workshoptutorialstep theStep = TutorialSteps[stepIndex]
      If theStep.Status == 0 && theStep.CompletionEvent == -1
        Self.CompleteTutorialStep(Tutorials[theStep.tutorialID], stepIndex, newObject)
      EndIf
      stepIndex += 1
    EndWhile
    If completedCount >= Tutorials.Length
      Self.Stop()
    EndIf
    Alias_SourceObject.Clear()
    Alias_TargetObject.Clear()
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function RollBackTutorial(outposttutorialscript:workshoptutorial theTutorial)
  theTutorial.outpostRef = None
  theTutorial.activeStep = -1
  Int stepIndex = 0
  While stepIndex < TutorialSteps.Length
    outposttutorialscript:workshoptutorialstep theStep = TutorialSteps[stepIndex]
    If theStep.tutorialID == theTutorial.tutorialID
      theStep.Status = -1
      If theStep.TriggerMessage
        theStep.TriggerMessage.UnshowAsHelpMessage()
      EndIf
      If theStep.TriggerMessagePC
        theStep.TriggerMessagePC.UnshowAsHelpMessage()
      EndIf
      If theStep.HelpMessage
        theStep.HelpMessage.UnshowAsHelpMessage()
      EndIf
      If theStep.CompletionMessage
        theStep.CompletionMessage.UnshowAsHelpMessage()
      EndIf
      If theStep.CompletionMessage2
        theStep.CompletionMessage2.UnshowAsHelpMessage()
      EndIf
      If theStep.CompletionMessage3
        theStep.CompletionMessage3.UnshowAsHelpMessage()
      EndIf
    EndIf
    stepIndex += 1
  EndWhile
EndFunction

Function HelpMessage(outposttutorialscript:workshoptutorial theTutorial, Int iStepIndex, Bool bShowMessage)
  outposttutorialscript:workshoptutorialstep theStep = TutorialSteps[iStepIndex]
  If theStep.HelpMessage
    If bShowMessage
      String eventString = (HelpMessageString + "_" + theTutorial.tutorialID as String) + "_" + iStepIndex as String
      theStep.HelpMessage.ShowAsHelpMessage(eventString, helpMessageDurationShort, helpMessageInterval, 0, "WorkshopMenu", 0, None)
    Else
      theStep.HelpMessage.UnshowAsHelpMessage()
    EndIf
  EndIf
EndFunction

Function EvaluateEvent(outposttutorialscript:workshoptutorial theTutorial, Int iStepIndex, ObjectReference outpostRef, ObjectReference theObject, ObjectReference targetObject, Int iEventType)
  outposttutorialscript:workshoptutorialstep theStep = TutorialSteps[iStepIndex]
  If outpostRef as Bool && outpostRef.Is3dLoaded() == False
    Return 
  EndIf
  If theStep.Status == 1
    Return 
  ElseIf theStep.Status == -1
    If theTutorial.requiredCondition
      If Self.IsConditionTrue(theTutorial.requiredCondition, theObject, targetObject) == False
        Return 
      EndIf
    EndIf
    If theTutorial.mutuallyExclusiveTutorialID > -1
      outposttutorialscript:workshoptutorial nemesisTutorial = Tutorials[theTutorial.mutuallyExclusiveTutorialID]
      If nemesisTutorial as Bool && nemesisTutorial.activeStep > -1
        Return 
      EndIf
    EndIf
    If Self.IsValidEvent(True, theStep, outpostRef, theObject, targetObject, iEventType)
      Self.StartTutorialStep(theTutorial, iStepIndex, theObject)
      theTutorial.outpostRef = outpostRef
    EndIf
  ElseIf theStep.Status == 0
    If Self.IsValidEvent(False, theStep, outpostRef, theObject, targetObject, iEventType)
      Self.CompleteTutorialStep(theTutorial, iStepIndex, theObject)
    EndIf
  EndIf
EndFunction

Bool Function IsValidEvent(Bool bTriggerEvent, outposttutorialscript:workshoptutorialstep theStep, ObjectReference outpostRef, ObjectReference theObject, ObjectReference targetObject, Int iEventType)
  Bool bIsValid = False
  Int eventToCheck = 0
  conditionform conditionToCheck = None
  Bool checkEventOnly = False
  If bTriggerEvent
    eventToCheck = theStep.TriggerEvent
    conditionToCheck = theStep.TriggerCondition
    checkEventOnly = theStep.TriggerOnEventOnly
  Else
    eventToCheck = theStep.CompletionEvent
    conditionToCheck = theStep.CompletionCondition
    checkEventOnly = theStep.CompletionOnEventOnly
  EndIf
  If iEventType == eventToCheck
    If checkEventOnly
      If iEventType == EventType_DestructionState
        If theObject.HasKeyword(WorkshopNoRepairKeyword) == False
          bIsValid = True
        EndIf
      Else
        bIsValid = True
      EndIf
    ElseIf Self.IsConditionTrue(conditionToCheck, theObject, targetObject)
      bIsValid = True
    EndIf
  EndIf
  Return bIsValid
EndFunction

Bool Function IsConditionTrue(conditionform conditionToCheck, ObjectReference subjectRef, ObjectReference targetRef)
  Bool bIsTrue = True
  If conditionToCheck
    bIsTrue = conditionToCheck.IsTrue(subjectRef, targetRef)
  EndIf
  Return bIsTrue
EndFunction

Function StartTutorialStep(outposttutorialscript:workshoptutorial theTutorial, Int iStepIndex, ObjectReference theObject)
  outposttutorialscript:workshoptutorialstep theStep = TutorialSteps[iStepIndex]
  theStep.Status = 0
  theTutorial.activeStep = iStepIndex
  If theTutorial.AliasToFill
    theTutorial.AliasToFill.ForceRefTo(theObject)
  EndIf
  If theStep.TriggerMessage
    If theStep.bTriggerIsMessageBox
      Utility.Wait(messageBoxDelay)
      If theStep.TriggerMessagePC as Bool && Game.UsingGamePad() == False
        theStep.TriggerMessagePC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      Else
        theStep.TriggerMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      EndIf
    Else
      String eventString = ((HelpMessageString + "_" + theTutorial.tutorialID as String) + "_" + iStepIndex as String) + "_START"
      If theStep.TriggerMessagePC as Bool && Game.UsingGamePad() == False
        theStep.TriggerMessagePC.ShowAsHelpMessage(eventString, helpMessageDurationLong, 0.0, 1, "WorkshopMenu", 0, None)
      Else
        theStep.TriggerMessage.ShowAsHelpMessage(eventString, helpMessageDurationLong, 0.0, 1, "WorkshopMenu", 0, None)
      EndIf
    EndIf
  EndIf
  If theStep.HelpMessage
    Self.HelpMessage(theTutorial, iStepIndex, True)
  EndIf
EndFunction

Function CompleteTutorialStep(outposttutorialscript:workshoptutorial theTutorial, Int iStepIndex, ObjectReference theObject)
  outposttutorialscript:workshoptutorialstep theStep = TutorialSteps[iStepIndex]
  theStep.Status = 1
  If theStep.HelpMessage
    Self.HelpMessage(theTutorial, iStepIndex, False)
  EndIf
  If theStep.CompletionMessage
    String eventString = ((HelpMessageString + "_" + theTutorial.tutorialID as String) + "_" + iStepIndex as String) + "_COMPLETE"
    theStep.CompletionMessage.ShowAsHelpMessage(eventString, helpMessageDurationLong, 0.0, 1, "WorkshopMenu", 0, None)
    If theStep.CompletionMessage2
      theStep.CompletionMessage2.ShowAsHelpMessage(eventString + "2", helpMessageDurationLong, 0.0, 1, "WorkshopMenu", 0, None)
    EndIf
    If theStep.CompletionMessage3
      theStep.CompletionMessage3.ShowAsHelpMessage(eventString + "3", helpMessageDurationLong, 0.0, 1, "WorkshopMenu", 0, None)
    EndIf
  EndIf
  If theTutorial.AliasToFill
    theTutorial.AliasToFill.Clear()
  EndIf
  Bool bFoundNextStep = False
  Int I = iStepIndex + 1
  While I < TutorialSteps.Length && bFoundNextStep == False
    outposttutorialscript:workshoptutorialstep nextStep = TutorialSteps[I]
    If nextStep.tutorialID == theTutorial.tutorialID
      bFoundNextStep = True
      Self.StartTutorialStep(theTutorial, I, theObject)
    EndIf
    I += 1
  EndWhile
  If bFoundNextStep == False
    theTutorial.bDone = True
    theTutorial.activeStep = -1
    theTutorial.outpostRef = None
    If theTutorial.UnregisterForEventTypeOnCompletion > -1
      Self.UnregisterForWorkshopEvent(theTutorial.UnregisterForEventTypeOnCompletion)
    EndIf
    If theTutorial.completionGlobal
      theTutorial.completionGlobal.SetValueInt(1)
    EndIf
    If theTutorial.mutuallyExclusiveTutorialID > -1
      outposttutorialscript:workshoptutorial nemesisTutorial = Tutorials[theTutorial.mutuallyExclusiveTutorialID]
      If nemesisTutorial
        nemesisTutorial.bDone = True
        nemesisTutorial.outpostRef = None
        If nemesisTutorial.UnregisterForEventTypeOnCompletion > -1
          Self.UnregisterForWorkshopEvent(nemesisTutorial.UnregisterForEventTypeOnCompletion)
        EndIf
      EndIf
    EndIf
  EndIf
EndFunction

Event ReferenceAlias.OnWorkshopObjectPlaced(ReferenceAlias akSource, ObjectReference akReference)
  If akReference.GetValue(OutpostTutorialObject) > 0.0
    Self.HandleWorkshopEvent(akSource.GetRef(), akReference, EventType_Build, None)
  EndIf
EndEvent

Event ReferenceAlias.OnWorkshopObjectGrabbed(ReferenceAlias akSource, ObjectReference akReference)
  If akReference.GetValue(OutpostTutorialObject) > 0.0
    Self.HandleWorkshopEvent(akSource.GetRef(), akReference, EventType_Move, None)
  EndIf
EndEvent

Event ReferenceAlias.OnWorkshopObjectMoved(ReferenceAlias akSource, ObjectReference akReference)
  If akReference.GetValue(OutpostTutorialObject) > 0.0
    Self.HandleWorkshopEvent(akSource.GetRef(), akReference, EventType_Move, None)
  EndIf
EndEvent

Event ReferenceAlias.OnObjectDestroyed(ReferenceAlias akSource, ObjectReference akReference)
  If akReference.GetValue(OutpostTutorialObject) > 0.0
    Self.HandleWorkshopEvent(akSource.GetRef(), akReference, EventType_DestructionState, None)
  EndIf
EndEvent

Event ReferenceAlias.OnObjectRepaired(ReferenceAlias akSource, ObjectReference akReference)
  If akReference.GetValue(OutpostTutorialObject) > 0.0
    Self.HandleWorkshopEvent(akSource.GetRef(), akReference, EventType_DestructionState, None)
  EndIf
EndEvent

Event ReferenceAlias.OnWorkshopObjectRemoved(ReferenceAlias akSource, ObjectReference akReference)
  If akReference == Alias_Outpost.GetRef()
    Self.ClearAllOutpostAliases()
  ElseIf akReference.GetValue(OutpostTutorialObject) > 0.0
    Self.HandleWorkshopEvent(akSource.GetRef(), akReference, EventType_Destroy, None)
  EndIf
EndEvent

Event ReferenceAlias.OnOutpostItemPowerOn(ReferenceAlias akSource, ObjectReference akPoweredItem, ObjectReference akPowerGenerator)
  If akPoweredItem.GetValue(OutpostTutorialObject) > 0.0
    Self.HandleWorkshopEvent(akSource.GetRef(), akPoweredItem, EventType_PowerOn, akPowerGenerator)
  EndIf
EndEvent

Event ReferenceAlias.OnOutpostItemPowerOff(ReferenceAlias akSource, ObjectReference akPoweredItem)
  If akPoweredItem.GetValue(OutpostTutorialObject) > 0.0
    Self.HandleWorkshopEvent(akSource.GetRef(), akPoweredItem, EventType_PowerOff, None)
  EndIf
EndEvent

Event ReferenceAlias.OnWorkshopOutputLink(ReferenceAlias akSourceAlias, ObjectReference akSource, ObjectReference akTarget)
  If akSource.GetValue(OutpostTutorialObject) > 0.0 || akTarget.GetValue(OutpostTutorialObject) > 0.0
    Self.HandleWorkshopEvent(akSourceAlias.GetRef(), akSource, EventType_OutputLink, akTarget)
  EndIf
EndEvent

Event ReferenceAlias.OnWorkshopFlyCam(ReferenceAlias akSourceAlias, Bool aStart)
  If aStart
    ObjectReference outpostBeaconRef = akSourceAlias.GetRef()
    Self.HandleWorkshopEvent(outpostBeaconRef, None, EventType_Flycam, None)
  EndIf
EndEvent

Event Actor.OnOutpostPlaced(Actor akSource, ObjectReference akOutpostBeacon)
  Alias_Outpost.ForceRefTo(akOutpostBeacon)
  If Self.GetStageDone(MiscObjectiveStartStage) && Self.GetStageDone(MiscObjectiveDoneStage) == False
    Self.setStage(MiscObjectiveDoneStage)
  EndIf
  Self.HandleWorkshopEvent(akOutpostBeacon, None, EventType_PlaceBeacon, None)
  Game.AddAchievement(PlaceOutpostAchievement)
EndEvent

Event Actor.OnEnterOutpostBeaconMode(Actor akSource)
  Self.HandleWorkshopEvent(None, None, EventType_EnterBeaconPlacement, None)
EndEvent

Function EnterWorkshopMenu(ObjectReference akOutpostBeacon)
  Alias_Outpost.ForceRefTo(akOutpostBeacon)
  OutpostTutorialEnterMenuCount.Mod(1.0)
  Self.HandleWorkshopEvent(akOutpostBeacon, None, EventType_EnterMenu, None)
EndFunction

Function UnregisterForWorkshopEvent(Int eventType)
  If eventType == EventType_Build
    Self.UnregisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnWorkshopObjectPlaced")
  ElseIf eventType == EventType_Move
    Self.UnregisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnWorkshopObjectMoved")
  ElseIf eventType == EventType_Destroy
    Self.UnregisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnWorkshopObjectRemoved")
  ElseIf eventType == EventType_Assign
    
  ElseIf eventType == EventType_Unassign
    
  ElseIf eventType == EventType_DestructionState
    Self.UnregisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnObjectDestroyed")
  ElseIf eventType == EventType_PowerOn
    Self.UnregisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnOutpostItemPowerOn")
  ElseIf eventType == EventType_EnterMenu
    
  ElseIf eventType == EventType_OutputLink
    Self.UnregisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnWorkshopOutputLink")
  ElseIf eventType == EventType_EnterBeaconPlacement
    Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnEnterOutpostBeaconMode")
  ElseIf eventType == EventType_PowerOff
    Self.UnregisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnOutpostItemPowerOff")
  EndIf
EndFunction

Function ClearAllOutpostAliases()
  Alias_Outpost.Clear()
  Alias_PowerRequiredObject.Clear()
  Alias_SourceObject.Clear()
  Alias_TargetObject.Clear()
EndFunction

Function TestDisplay()
  Int I = 0
  While I < TutorialSteps.Length
    outposttutorialscript:workshoptutorialstep theStep = TutorialSteps[I]
    I += 1
  EndWhile
  I = 0
  While I < Tutorials.Length
    outposttutorialscript:workshoptutorial theTutorial = Tutorials[I]
    I += 1
  EndWhile
EndFunction

Function TestMiscObjective()
  debugAllowMiscObjective = True
EndFunction

Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Debug.TraceLog(CallingObject, asTextToPrint, "OutpostTutorial", "", 0, False, False, False, True)
EndFunction
