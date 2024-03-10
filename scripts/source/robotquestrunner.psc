ScriptName RobotQuestRunner Extends Actor

;-- Variables ---------------------------------------
Float AcceptableDistance = 2.299999952
Float AcceptableDistanceSpace = 100.0
Int CombatState = 3
ObjectReference CombatTarget
Quest CurrentQuest
ObjectReference CurrentTarget
Int CurrentTimePassedInDialog = 0
Int CurrentTimePassedSelectingQuest = 0
Int CurrentTimePassedSelectingTarget = 0
Int DialogueState = 2
Int DialogueStateIterator = 0
inputenablelayer DisableForTesting
Int FailedInteractionThreshold = 10
Int IdleState = 0
Int InteractState = 4
Int MaxQuestsToComplete = 1
Int MaxTimeBeforeDialogFailure = 240
Int MaxTimeBeforeFailureSelectingQuest = 150
Int MaxTimeBeforeFailureSelectingTarget = 300
Int MaxTimeBeforeKillAllSelectingTarget = 180
Int MenuState = 5
Int PathingState = 1
Int QuestsComplete = 0
Bool TestPaused = False
Bool TestSuccessful = False
Int WaitDuration = 1
String lastState = "None"
Int previousStage = -1
Int previousTarget = 0

;-- Properties --------------------------------------
Int Property Dialogue_Substate_Exit = 0 AutoReadOnly
Int Property Dialogue_Substate_Skip = 1 AutoReadOnly
Int Property Dialogue_Substate_MAX = 2 AutoReadOnly

;-- Functions ---------------------------------------

Function UpdateState()
  ; Empty function
EndFunction

Bool Function StateRequestsFinish()
  Return False
EndFunction

Bool Function IsValidState(String asState)
  If asState == "None"
    Return False
  ElseIf asState != "PlayerInDialogue" || asState != "PlayerInMessageBox" || asState != "Inert" || asState != "TestCompleted" || asState != "SelectingTarget" || asState != "SelectingQuest"
    Return False
  Else
    Return True
  EndIf
EndFunction

Function MakeGameplayBotRequest(ObjectReference Target, Int aiState)
  If Self.GetState() != "CodeControlled"
    Game.RequestGameplayBotState(Target, aiState)
  EndIf
EndFunction

Function RequestToggleCodeControl(Bool abCodeWantsControl, String NewState)
  String currentState = Self.GetState()
  If currentState == "CodeControlled" && !abCodeWantsControl
    If Game.IsPlayerInDialogue()
      Self.GotoState("PlayerInDialogue")
    ElseIf Game.IsPlayerInMessageBox()
      Self.GotoState("PlayerInMessageBox")
    ElseIf Self.IsValidQuestTarget(CurrentQuest, CurrentTarget) && Self.IsValidState(NewState)
      Self.GotoState(NewState)
    ElseIf Self.IsValidQuestTarget(CurrentQuest, CurrentTarget)
      If !Self.IsBestInteractionTarget()
        Self.GotoState("SelectingTarget")
      ElseIf Self.GetDistance(CurrentTarget) < AcceptableDistance
        Game.RequestGameplayBotState(CurrentTarget, InteractState)
      Else
        Game.RequestGameplayBotState(CurrentTarget, PathingState)
      EndIf
    Else
      Self.CheckTransitionToNewQuestOrTarget()
    EndIf
  ElseIf currentState != "CodeControlled" && abCodeWantsControl
    Self.GotoState("CodeControlled")
  EndIf
EndFunction

Function StartTest()
  Actor currentCombatTarget = None
  If Self.IsInCombat()
    currentCombatTarget = Self.GetCombatTarget()
    Self.StopCombat()
  EndIf
  Self.SetupPlayerForRobotTest()
  TestSuccessful = True
  If currentCombatTarget != None
    Self.StartCombat(currentCombatTarget as ObjectReference, False)
    CombatTarget = currentCombatTarget as ObjectReference
    Game.RequestGameplayBotState(CombatTarget, CombatState)
    Self.GotoState("CodeControlled")
  Else
    Self.GotoState("SelectingQuest")
  EndIf
  While !Self.StateRequestsFinish()
    String currentState = Self.GetState()
    If currentState != lastState
      lastState = currentState
    EndIf
    If !TestPaused && Self.GetState() != "CodeControlled"
      If Game.IsPlayerInDialogue() && Self.GetState() != "PlayerInDialogue"
        Self.GotoState("PlayerInDialogue")
      EndIf
      If Game.IsPlayerInMessageBox() && Self.GetState() != "PlayerInMessageBox"
        Self.GotoState("PlayerInMessageBox")
      EndIf
    EndIf
    Self.UpdateState()
    Utility.WaitMenuPause(WaitDuration as Float)
  EndWhile
EndFunction

Quest Function SelectQuest()
  Quest[] activeQuestList = Game.GetPlayerActiveQuests()
  Quest selectedQuest = None
  If activeQuestList.Length > 0
    selectedQuest = activeQuestList[0]
  EndIf
  Return selectedQuest
EndFunction

ObjectReference Function SelectQuestTarget(Quest aQuest)
  ObjectReference returnTarget = None
  If aQuest != None
    Int currStage = aQuest.GetStage()
    Int Target = 0
    ObjectReference[] targets = aQuest.GetCurrentStageTargets()
    If previousStage != currStage
      previousStage = currStage
    ElseIf targets.Length > 1
      Target = previousTarget + 1
      If Target > targets.Length
        Target = 0
      EndIf
    EndIf
    If targets.Length > 0
      returnTarget = targets[Target]
    EndIf
    previousTarget = Target
  EndIf
  Return returnTarget
EndFunction

Bool Function IsBestInteractionTarget()
  Bool isBest = True
  If CurrentQuest != None
    ObjectReference[] targets = CurrentQuest.GetCurrentStageTargets()
    isBest = targets.Length == 1
  EndIf
  Return isBest
EndFunction

Actor Function SelectCombatTarget()
  Actor returnTarget = None
  Actor player = Game.GetPlayer()
  Actor[] allActors = player.GetCurrentLocation().GetActors(None, None)
  Float closestDistance = -1.0
  Int actorToTest = 0
  While actorToTest < allActors.Length
    If !allActors[actorToTest].IsDead() && !allActors[actorToTest].IsUnconscious() && allActors[actorToTest].IsHostileToActor(player)
      Float checkDistance = Self.GetDistance(allActors[actorToTest] as ObjectReference)
      If closestDistance < 0.0 || checkDistance < closestDistance
        closestDistance = checkDistance
        returnTarget = allActors[actorToTest]
      EndIf
    EndIf
    actorToTest += 1
  EndWhile
  If returnTarget != None
    
  EndIf
  Return returnTarget
EndFunction

Bool Function IsValidQuestTarget(Quest aQuest, ObjectReference aQuestTarget)
  Bool returnValue = False
  If aQuest != None && aQuestTarget != None
    ObjectReference[] targets = aQuest.GetCurrentStageTargets()
    Int targetToTest = 0
    While targetToTest < targets.Length && !returnValue
      returnValue = targets[targetToTest] == aQuestTarget
      targetToTest += 1
    EndWhile
  EndIf
  Return returnValue
EndFunction

; Fixup hacks for debug-only function: MakeQuestNameSave
Function MakeQuestNameSave(String asStringToInsertToName)
  String questName = "NoQuest"
  Int questStage = 0
  If CurrentQuest != None
    questName = questName
    questStage = CurrentQuest.GetStage()
  EndIf
  String saveName = "RobotTest" + asStringToInsertToName + "_" + questName + "_" + questStage as String
EndFunction

Function CheckTransitionToNewQuestOrTarget()
  If Self.GetState() != "Inert"
    If CurrentQuest == None || CurrentQuest.IsCompleted()
      Self.GotoState("SelectingQuest")
    Else
      CurrentTarget = None
      Self.GotoState("SelectingTarget")
    EndIf
  EndIf
EndFunction

Function SaveAndCheckTransitionToNewQuestOrTarget()
  If Self.GetState() != "Inert"
    Self.MakeQuestNameSave("")
    Self.CheckTransitionToNewQuestOrTarget()
  EndIf
EndFunction

Function SucceedAutomatedTest()
  TestSuccessful = True
  Self.GotoState("TestCompleted")
EndFunction

Function FailAutomatedTest()
  TestSuccessful = False
  Self.GotoState("TestCompleted")
EndFunction

Event OnInit()
  ActorValue playerConfidence = Game.GetForm(701) as ActorValue
  If playerConfidence != None
    Self.SetValue(playerConfidence, 4.0)
  EndIf
  Self.GotoState("Idle")
EndEvent

; WARNING: possibly inoperative debug function OnPlayerLoadGame
Event OnPlayerLoadGame()
  If !::temp221
    If Self.IsInCombat()
      Self.StopCombat()
    EndIf
    TestPaused = False
    Self.GotoState("Inert")
  Else
    Self.CheckTransitionToNewQuestOrTarget()
  EndIf
EndEvent

Function DebugTraceAndLogError(String asTextToPrint)
  Debug.AutomatedTestLogError(asTextToPrint)
  Debug.Trace((Self as String + " ") + asTextToPrint, 0)
EndFunction

Function DebugTraceAndLogProgress(String asTextToPrint)
  Debug.AutomatedTestLogProgress(asTextToPrint)
  Debug.Trace((Self as String + " ") + asTextToPrint, 0)
EndFunction

Function TogglePauseTest()
  If TestPaused
    Self.SetupPlayerForRobotTest()
    TestPaused = False
    If CurrentQuest == None || CurrentQuest.IsCompleted()
      Self.GotoState("SelectingQuest")
    Else
      CurrentTarget = None
      Self.GotoState("SelectingTarget")
    EndIf
  Else
    Self.ResetPlayerStateFromRobotTest()
    TestPaused = True
    Self.GotoState("Inert")
  EndIf
EndFunction

Function SetupPlayerForRobotTest()
  If DisableForTesting == None
    DisableForTesting = inputenablelayer.Create()
    DisableForTesting.DisablePlayerControls(False, True, True, False, True, False, False, True, True, True, False)
  EndIf
EndFunction

Function ResetPlayerStateFromRobotTest()
  DisableForTesting = None
EndFunction

Function RoboKillAllHostile()
  Actor player = Game.GetPlayer()
  Actor[] allCombatTargetActors = player.GetAllCombatTargets()
  Int actorToTest = 0
  While actorToTest < allCombatTargetActors.Length
    If !allCombatTargetActors[actorToTest].IsDead() && !allCombatTargetActors[actorToTest].IsUnconscious()
      allCombatTargetActors[actorToTest].Kill(None)
    EndIf
    actorToTest += 1
  EndWhile
  spaceshipreference playerSpaceship = Self.GetCurrentShipRef()
  spaceshipreference[] allCombatTargetShips = playerSpaceship.GetAllCombatTargets()
  Int shipToTest = 0
  While shipToTest < allCombatTargetShips.Length
    allCombatTargetShips[shipToTest].Kill(None)
    shipToTest += 1
  EndWhile
EndFunction

;-- State -------------------------------------------
State CodeControlled

  Event OnBeginState(String asOldState)
    ; Empty function
  EndEvent

  Bool Function StateRequestsFinish()
    Return False
  EndFunction
EndState

;-- State -------------------------------------------
State Idle

  Event OnBeginState(String asOldState)
    ; Empty function
  EndEvent

  Event OnEndState(String asNewState)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
State Inert

  Bool Function StateRequestsFinish()
    Return !TestPaused
  EndFunction

  Event OnBeginState(String asOldState)
    Self.ResetPlayerStateFromRobotTest()
  EndEvent
EndState

;-- State -------------------------------------------
State PlayerInDialogue

  Event OnEndState(String asNewState)
    ; Empty function
  EndEvent

  ; Fixup hacks for debug-only function: UpdateState
  Function UpdateState()
    If CurrentTimePassedInDialog > MaxTimeBeforeDialogFailure
      Self.FailAutomatedTest()
    Else
      CurrentTimePassedInDialog += WaitDuration
      Bool IsPlayerInDialogue = Game.IsPlayerInDialogue()
      If IsPlayerInDialogue
        Actor dialogueActor = None
        If dialogueActor != None && Self.GetParentCell() != dialogueActor.GetParentCell()
          Self.FailAutomatedTest()
        EndIf
        Int[] topics = Game.GetPlayerActiveDialogueUnsaidInfo()
        Int choiceIndex = -1
        Int topicIndex = 0
        While choiceIndex == -1 && topicIndex < topics.Length
          If topics[topicIndex] > 0
            choiceIndex = topicIndex
          EndIf
          topicIndex += 1
        EndWhile
        If choiceIndex != -1
          Game.RequestDialogueSelect(choiceIndex)
        ElseIf DialogueStateIterator == Self.Dialogue_Substate_Exit
          Game.RequestDialogueExit()
        ElseIf DialogueStateIterator == Self.Dialogue_Substate_Skip
          Game.RequestDialogueSkip()
        EndIf
        DialogueStateIterator = (DialogueStateIterator + 1) % Self.Dialogue_Substate_MAX
      Else
        Self.SaveAndCheckTransitionToNewQuestOrTarget()
      EndIf
    EndIf
  EndFunction

  Event OnBeginState(String asOldState)
    CurrentTimePassedInDialog = 0
    DialogueStateIterator = Self.Dialogue_Substate_Exit
  EndEvent
EndState

;-- State -------------------------------------------
State PlayerInMessageBox

  Event OnBeginState(String asOldState)
    ; Empty function
  EndEvent

  Event OnEndState(String asNewState)
    ; Empty function
  EndEvent

  Function UpdateState()
    If Game.IsPlayerInMessageBox()
      Game.RequestMessageBoxSelect(1)
    Else
      Self.CheckTransitionToNewQuestOrTarget()
    EndIf
  EndFunction
EndState

;-- State -------------------------------------------
State SelectingQuest

  Event OnEndState(String asNewState)
    ; Empty function
  EndEvent

  Function UpdateState()
    If CurrentQuest != None && CurrentQuest.IsCompleted()
      QuestsComplete += 1
      If QuestsComplete >= MaxQuestsToComplete
        Self.SucceedAutomatedTest()
        Return 
      EndIf
      CurrentQuest = None
    EndIf
    If CurrentQuest == None
      CurrentQuest = Self.SelectQuest()
    EndIf
    If CurrentQuest != None
      Self.GotoState("SelectingTarget")
    Else
      CurrentTimePassedSelectingQuest += WaitDuration
      If CurrentTimePassedSelectingQuest > MaxTimeBeforeFailureSelectingQuest
        Self.FailAutomatedTest()
      EndIf
    EndIf
  EndFunction

  Event OnBeginState(String asOldState)
    CurrentTimePassedSelectingQuest = 0
  EndEvent
EndState

;-- State -------------------------------------------
State SelectingTarget

  Event OnEndState(String asNewState)
    ; Empty function
  EndEvent

  Function UpdateState()
    ObjectReference prospectiveTarget = Self.SelectQuestTarget(CurrentQuest)
    If prospectiveTarget != None
      spaceshipreference playerSpaceship = Self.GetCurrentShipRef()
      Bool inCombatWithPlayer = False
      Actor targetActor = prospectiveTarget as Actor
      spaceshipreference targetShip = prospectiveTarget as spaceshipreference
      If targetActor != None
        Actor[] combatTargets = targetActor.GetAllCombatTargets()
        Int combatTargetIndex = 0
        While combatTargetIndex < combatTargets.Length && !inCombatWithPlayer
          inCombatWithPlayer = combatTargets[combatTargetIndex] == Self as Actor
          combatTargetIndex += 1
        EndWhile
      ElseIf targetShip != None
        spaceshipreference[] combattargets = targetShip.GetAllCombatTargets()
        Int combattargetindex = 0
        While combattargetindex < combattargets.Length && !inCombatWithPlayer
          inCombatWithPlayer = combattargets[combattargetindex] == playerSpaceship
          combattargetindex += 1
        EndWhile
      EndIf
      If inCombatWithPlayer
        If targetActor
          CombatTarget = targetActor as ObjectReference
        Else
          CombatTarget = targetShip as ObjectReference
        EndIf
        Self.MakeGameplayBotRequest(CombatTarget, CombatState)
        Self.GotoState("CodeControlled")
      ElseIf prospectiveTarget == Self.GetFurnitureUsing()
        Keyword PilotSeatKeyword = Game.GetForm(22055) as Keyword
        If prospectiveTarget.HasKeyword(PilotSeatKeyword)
          If playerSpaceship
            playerSpaceship.TakeOff()
          EndIf
        EndIf
      ElseIf Self.GetDistance(prospectiveTarget) < AcceptableDistance
        CurrentTarget = prospectiveTarget
        Self.MakeGameplayBotRequest(CurrentTarget, InteractState)
        Self.GotoState("CodeControlled")
      Else
        CurrentTarget = prospectiveTarget
        Self.MakeGameplayBotRequest(CurrentTarget, PathingState)
        Self.GotoState("CodeControlled")
      EndIf
    Else
      CombatTarget = Self.SelectCombatTarget() as ObjectReference
      If CombatTarget != None
        Self.MakeGameplayBotRequest(CombatTarget, CombatState)
        Self.GotoState("CodeControlled")
      Else
        CurrentTimePassedSelectingTarget += WaitDuration
        If CurrentTimePassedSelectingTarget > MaxTimeBeforeFailureSelectingTarget
          Self.FailAutomatedTest()
        ElseIf CurrentTimePassedSelectingTarget > MaxTimeBeforeKillAllSelectingTarget
          Self.RoboKillAllHostile()
        EndIf
      EndIf
    EndIf
  EndFunction

  Event OnBeginState(String asOldState)
    CurrentTimePassedSelectingTarget = 0
  EndEvent
EndState

;-- State -------------------------------------------
State TestCompleted

  Bool Function StateRequestsFinish()
    Return True
  EndFunction

  Event OnBeginState(String asOldState)
    Self.ResetPlayerStateFromRobotTest()
  EndEvent
EndState
