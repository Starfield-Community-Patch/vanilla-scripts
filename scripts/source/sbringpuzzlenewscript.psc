ScriptName SBRingPuzzleNEWScript Extends ObjectReference conditional
{ New Ring Puzzle script. }

;-- Structs -----------------------------------------
Struct ringData
  wwiseevent ringToneEvent
  Int ringToneInstance = -1
  wwiseevent successEvent
  String ringTuningSoundString
  Float solutionPosition = 0.0
EndStruct

Struct solutionData
  ObjectReference solutionRef
  Float solutionPositionX = 0.0
  Float solutionPositionY = 0.0
  Float solutionPositionZ = 0.0
EndStruct


;-- Variables ---------------------------------------
Int currentSolutionIndex = 0
Int overallTuningCount = 0
Int playerMovementTimerID = 1 Const
Float playerMovementTimerSeconds = 0.5 Const
ObjectReference puzzleSolutionRef
sbringpuzzlenewscript:solutiondata[] puzzleSolutions
Float puzzleX
Float puzzleY
Float puzzleZ
Int requiredTuningCount
Int solutionMovementTimerID = 2 Const

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard ringRotationGuard

;-- Properties --------------------------------------
Group keywords
  Keyword Property SBRingsPuzzleKeyword Auto Const mandatory
  Keyword Property SBPowerTriggerEnableMarkerKeyword Auto Const mandatory
  Keyword Property SBRumbleDebrisEnableMarkerKeyword Auto Const mandatory
EndGroup

Group effects
  Form Property MarkerDummyA Auto Const mandatory
  { used to test solution distance }
EndGroup

Group soundData
  wwiseevent Property AllRingsToneEvent Auto Const mandatory
  wwiseevent Property wSuccessEvent Auto Const mandatory
  wwiseevent Property wCloseAnimationEvent Auto Const mandatory
  wwiseevent Property wRingsIdleSoundEvent Auto Const mandatory
  wwiseevent Property wRumble Auto Const mandatory
  wwiseevent Property wRingsRelease Auto Const mandatory
  wwiseevent Property wOpenAnimation Auto Const mandatory
  wwiseevent Property wRingRotationSoundEvent Auto Const mandatory
  wwiseevent Property WwiseEvent_ShakeController_p5_p5_05 Auto Const mandatory
  wwiseevent Property WwiseEvent_ShakeController_p5_p5_02 Auto Const mandatory
  Int Property instanceRingsIdling = -1 Auto hidden
  Int Property instanceAllTuning = -1 Auto hidden
  wwiseevent Property wAnomalySuccessEvent Auto Const mandatory
  wwiseevent Property wMoveAnomalyEvent Auto Const mandatory
EndGroup

Group PuzzleData
  sbringpuzzlenewscript:ringdata[] Property Rings Auto mandatory
  Float Property fRingSpeedMin = 0.100000001 Auto Const
  Float Property fRingSpeedMax = 10.0 Auto Const
  Float Property minPuzzleTuningOrientation = 0.800000012 Auto Const
  { how close is required to total puzzle completion to count as "tuned"? }
  Float Property puzzlePositionMaxXY = 20.0 Auto Const
  { how far away max can the "solution" position be? }
  Float Property puzzlePositionMinZ = 8.0 Auto Const
  { min Z for solution }
  Float Property puzzlePositionMaxZ = 15.5 Auto Const
  { max Z for solution }
  Float Property puzzleposition_angleVmin = 0.0 Auto Const
  { horizontal angle min }
  Float Property puzzleposition_angleVmax = 90.0 Auto Const
  { horizontal angle max }
  Float Property puzzleposition_angleHmin = 15.0 Auto Const
  { horizontal angle min }
  Float Property puzzleposition_angleHmax = 345.0 Auto Const
  { horizontal angle max }
  Float Property requiredTuningSeconds = 0.5 Auto Const
  { how many seconds does the player need to be within the "tuning spot" to count as the ring/puzzle being "tuned" }
  String Property puzzleAnimationString_PlayerPos = "fRingTarget" Auto Const
  { animation variable to update puzzle animation based on player position }
  String Property puzzleAnimationString_OpenStart = "Open" Auto Const
  { animation to open the puzzle rings }
  String Property puzzleAnimationString_OpenFinish = "Opened" Auto Const
  { event when open animation is done }
  String Property puzzleAnimationString_Close = "Close" Auto Const
  { animation to show puzzle success }
  String Property puzzleAnimationString_Reset = "Reset" Auto Const
  { animation to reset the puzzle }
  String Property puzzleEventString_ReactionEnd = "ReactionEnd" Auto Const
  { custom animation event sent when puzzle is done reacting to player on completion }
  String Property puzzleWwiseEventString_RingsAll_Tuning = "ArtifactPuzzle_RingsAll_Tuning" Auto Const
  { puzzle "tuning" Wwise event }
  Int Property solutionCount = 5 Auto
  { how many times does the player need to solve the puzzle? }
  Float Property solutionMovementTimeStart = 10.0 Auto
  { starting time for solution to move }
  Float Property solutionMovementTimeMin = 2.5 Auto
  { fastest solution movement time (on last solution) - so each time you solve a step, actual movement timer will be reduced by:
        (solutionMovementTimeStart - solutionMovementTimeMin) * currentSolutionIndex / solutionCount }
  Float Property minSolutionMoveDistance = 15.0 Auto
  { try to make sure next solution is at least this far from previous }
EndGroup

Group SolutionVisibility
  Form Property SolutionVisibilityMarker Auto Const
  { placed at solution position }
  Float Property minPuzzleTuningOrientationSolution = 0.920000017 Auto Const
  { how close is required to total puzzle completion to count as "tuned"? }
  String Property solutionAnimationString_Hide = "Stage1" Auto Const
  { animation to hide solution }
  String Property solutionAnimationString_Appear = "Stage2" Auto Const
  { animation to show solution }
  String Property solutionAnimationString_Success = "Stage3" Auto Const
  { animation to show solution success }
  String Property solutionAnimationString_Move = "Stage4" Auto Const
  { animation when solution moves }
  String Property solutionAnimationString_Finish = "FXAnimFinish" Auto Const
  { event when all solution animations are done }
EndGroup

Group quests
  Quest Property QuestToCheck Auto Const
  Int Property StageToSet Auto Const
  Quest Property MQ104A Auto Const mandatory
  Int Property MQ104APuzzleStartedStage = 402 Auto Const
  Int Property MQ104APuzzleCompletedStage = 500 Auto Const
EndGroup

Group flags
  Bool Property PuzzleInitialized = False Auto conditional hidden
  Bool Property PuzzleComplete = False Auto conditional hidden
  Bool Property PlayerIsInTrigger = False Auto conditional hidden
  Bool Property DisableCheckRings = False Auto Const
  { For LC165, using this to disable the CheckRings function and avoid script spam. }
  GlobalVariable Property MQAutoSolvePuzzle Auto Const
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  puzzleSolutions = new sbringpuzzlenewscript:solutiondata[0]
  requiredTuningCount = Math.Floor(requiredTuningSeconds / playerMovementTimerSeconds)
  Self.ResetPuzzleSolutions()
EndEvent

Function PlayPuzzleAnimation(ObjectReference akRef, String asAnimation, String asEndEvent, Bool tryAgainOnFail)
  Bool animSuccess = False
  Int maxAnimAttemptCount = 10
  Int animAttemptCount = 0
  If !tryAgainOnFail
    maxAnimAttemptCount = 1
  EndIf
  If akRef.WaitFor3DLoad()
    While !animSuccess && animAttemptCount < maxAnimAttemptCount
      If asEndEvent
        animSuccess = akRef.PlayAnimationAndWait(asAnimation, asEndEvent)
      Else
        animSuccess = akRef.PlayAnimation(asAnimation)
      EndIf
      If !animSuccess && tryAgainOnFail
        Utility.Wait(0.100000001)
      EndIf
      animAttemptCount += 1
    EndWhile
  EndIf
  If animSuccess
    
  EndIf
EndFunction

Function ResetPuzzleSolutions()
  ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword)
  puzzleX = puzzleRef.GetPositionX()
  puzzleY = puzzleRef.GetPositionY()
  puzzleZ = puzzleRef.GetPositionZ()
  currentSolutionIndex = 0
  puzzleSolutions.clear()
  Int I = 0
  ObjectReference lastSolution = None
  While I < solutionCount
    sbringpuzzlenewscript:solutiondata newPuzzleSolution = Self.ResetPuzzleSolution(lastSolution)
    puzzleSolutions.add(newPuzzleSolution, 1)
    lastSolution = newPuzzleSolution.solutionRef
    I += 1
  EndWhile
  Self.DebugTraceSolutionData()
  Self.SetPuzzleSolutionRef(False)
EndFunction

sbringpuzzlenewscript:solutiondata Function ResetPuzzleSolution(ObjectReference distanceTestRef)
  ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword)
  sbringpuzzlenewscript:solutiondata puzzleSolutionData = new sbringpuzzlenewscript:solutiondata
  Float solutionX = 0.0
  Float solutionY = 0.0
  Float solutionZ = 0.0
  Bool foundSolution = False
  Int failsafeCount = 5
  While foundSolution == False && failsafeCount > 0
    Float angleV = Utility.RandomFloat(puzzleposition_angleVmin, puzzleposition_angleVmax)
    Float angleH = Utility.RandomFloat(puzzleposition_angleHmin, puzzleposition_angleHmax)
    Float solutionRadius = Utility.RandomFloat(puzzlePositionMinZ, puzzlePositionMaxZ)
    solutionZ = solutionRadius * Math.sin(angleV)
    Float radiusH = Math.sqrt(solutionRadius * solutionRadius - solutionZ * solutionZ)
    solutionY = Math.sin(angleH) * radiusH
    solutionX = Math.cos(angleH) * radiusH
    If distanceTestRef
      ObjectReference testRef = puzzleRef.PlaceAtMe(MarkerDummyA, 1, False, False, True, None, None, True)
      testRef.MoveTo(puzzleRef, solutionX, solutionY, solutionZ, True, False)
      Float moveDistance = testRef.GetDistance(distanceTestRef)
      If moveDistance >= minSolutionMoveDistance
        foundSolution = True
      Else
        failsafeCount += 1
      EndIf
      testRef.Delete()
    Else
      foundSolution = True
    EndIf
  EndWhile
  puzzleSolutionData.solutionPositionX = solutionX
  puzzleSolutionData.solutionPositionY = solutionY
  puzzleSolutionData.solutionPositionZ = solutionZ
  puzzleSolutionData.solutionRef = puzzleRef.PlaceAtMe(SolutionVisibilityMarker, 1, False, False, True, None, None, True)
  puzzleSolutionData.solutionRef.MoveTo(puzzleRef, solutionX, solutionY, solutionZ, True, False)
  Return puzzleSolutionData
EndFunction

Function SetPuzzleSolutionRef(Bool bShowSolution)
  ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword)
  sbringpuzzlenewscript:solutiondata currentSolution = puzzleSolutions[currentSolutionIndex]
  puzzleSolutionRef = currentSolution.solutionRef
  Self.PlayPuzzleAnimation(puzzleSolutionRef, solutionAnimationString_Hide, solutionAnimationString_Finish, True)
  If bShowSolution
    Self.PlayPuzzleAnimation(puzzleSolutionRef, solutionAnimationString_Appear, solutionAnimationString_Finish, True)
  EndIf
EndFunction

Function ClearSolutionRef()
  If puzzleSolutionRef
    puzzleSolutionRef.Disable(False)
    puzzleSolutionRef.Delete()
    puzzleSolutionRef = None
  EndIf
EndFunction

Function MoveSolution()
  Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If PuzzleComplete == False
      ObjectReference oldSolutionRef = puzzleSolutions[currentSolutionIndex].solutionRef
      Self.PlayPuzzleAnimation(oldSolutionRef, solutionAnimationString_Move, solutionAnimationString_Finish, True)
      wMoveAnomalyEvent.Play(oldSolutionRef, None, None)
      sbringpuzzlenewscript:solutiondata newPuzzleSolution = Self.ResetPuzzleSolution(Game.GetPlayer() as ObjectReference)
      puzzleSolutions[currentSolutionIndex] = newPuzzleSolution
      Self.SetPuzzleSolutionRef(True)
      oldSolutionRef.Delete()
      Self.StartSolutionMovementTimer()
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function StartSolutionMovementTimer()
  Float solutionTimeDifference = ((solutionMovementTimeStart - solutionMovementTimeMin) * currentSolutionIndex as Float) / solutionCount as Float
  Float solutionTime = solutionMovementTimeStart - solutionTimeDifference
  Self.StartTimer(solutionTime, solutionMovementTimerID)
EndFunction

Event OnTriggerEnter(ObjectReference akActionRef)
  If PuzzleComplete == False && (akActionRef == Game.GetPlayer() as ObjectReference)
    Self.CheckRotateRingsStart()
  EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  If PuzzleComplete == False && (akActionRef == Game.GetPlayer() as ObjectReference)
    Self.CheckRotateRingsStart()
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If aiTimerID == playerMovementTimerID
      Self.RotateRings(True)
    ElseIf aiTimerID == solutionMovementTimerID
      Self.MoveSolution()
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndEvent

Function CancelAllTimers()
  Self.CancelTimer(playerMovementTimerID)
  Self.CancelTimer(solutionMovementTimerID)
EndFunction

Function CheckRotateRingsStart()
  Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    PlayerIsInTrigger = Self.IsInTrigger(Game.GetPlayer() as ObjectReference)
    Cell myCell = Self.GetParentCell()
    If PlayerIsInTrigger
      myCell.SetGravityScale(0.0)
      Self.InitializePuzzle()
      Self.RotateRings(True)
    Else
      Self.RotateRings(False)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function RotateRings(Bool usePlayerPosition)
  If PuzzleComplete == False && (PlayerIsInTrigger || usePlayerPosition == False)
    ObjectReference playerRef = Game.GetPlayer() as ObjectReference
    ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword)
    Float distanceToSolution = Game.GetPlayer().GetDistance(puzzleSolutionRef)
    Float maxDistanceToSolution = puzzlePositionMaxZ * 2.0
    distanceToSolution = Math.Min(distanceToSolution, maxDistanceToSolution)
    Float fTotalPuzzleComplete = 1.0 - distanceToSolution / maxDistanceToSolution
    If fTotalPuzzleComplete >= minPuzzleTuningOrientationSolution
      overallTuningCount += 1
      If overallTuningCount >= requiredTuningCount
        Utility.Wait(0.100000001)
        Self.CompletePuzzle()
      EndIf
    Else
      overallTuningCount = 0
    EndIf
    Self.StartTimer(playerMovementTimerSeconds, playerMovementTimerID)
  EndIf
EndFunction

Function InitializePuzzle()
  Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If PuzzleInitialized == False
      PuzzleInitialized = True
      ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword)
      If PuzzleComplete
        Return 
      EndIf
      Int instanceRumble = wRumble.Play(Game.GetPlayer() as ObjectReference, None, None)
      Self.GetLinkedRef(SBRumbleDebrisEnableMarkerKeyword).Enable(False)
      WwiseEvent_ShakeController_p5_p5_05.Play(Game.GetPlayer() as ObjectReference, None, None)
      Utility.Wait(2.0)
      If puzzleRef
        wRingsRelease.Play(puzzleRef, None, None)
        Utility.Wait(0.300000012)
        wOpenAnimation.Play(puzzleRef, None, None)
        Self.PlayPuzzleAnimation(puzzleRef, puzzleAnimationString_OpenStart, puzzleAnimationString_OpenFinish, True)
      EndIf
      If MQ104A.IsRunning() && MQ104A.GetStageDone(MQ104APuzzleStartedStage) == False
        MQ104A.SetStage(MQ104APuzzleStartedStage)
      EndIf
      Self.InitializeRings()
      Self.StartSolutionMovementTimer()
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function InitializeRings()
  ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword)
  Utility.Wait(1.0)
  puzzleRef.SetAnimationVariableFloat("Speed", 0.029999999)
  Int count = 0
  ObjectReference[] myDebris = Self.GetRefsLinkedToMe(None, None)
  While count < myDebris.Length
    ObjectReference currentObjectReference = myDebris[count]
    If currentObjectReference.Is3DLoaded()
      currentObjectReference.SetMotionType(currentObjectReference.Motion_Dynamic, False)
    EndIf
    count += 1
  EndWhile
  Utility.Wait(0.200000003)
  If DisableCheckRings
    Return 
  EndIf
  Int I = 0
  While I < Rings.Length
    sbringpuzzlenewscript:ringdata theRing = Rings[I]
    theRing.ringToneInstance = theRing.ringToneEvent.PlayWithRTPC(puzzleRef, theRing.ringTuningSoundString, 0.0)
    I += 1
  EndWhile
  instanceAllTuning = AllRingsToneEvent.PlayWithRTPC(puzzleRef, puzzleWwiseEventString_RingsAll_Tuning, 0.0)
  instanceRingsIdling = wRingsIdleSoundEvent.PlayWithRTPC(puzzleRef, puzzleWwiseEventString_RingsAll_Tuning, 0.0)
  If puzzleSolutionRef as Bool && !puzzleSolutionRef.IsDeleted()
    puzzleSolutionRef.Enable(False)
    Self.PlayPuzzleAnimation(puzzleSolutionRef, solutionAnimationString_Hide, solutionAnimationString_Finish, True)
    Self.PlayPuzzleAnimation(puzzleSolutionRef, solutionAnimationString_Appear, "", True)
  EndIf
EndFunction

Function CompletePuzzle()
  Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    currentSolutionIndex += 1
    If currentSolutionIndex < puzzleSolutions.Length
      Float fTotalPuzzleComplete = currentSolutionIndex as Float / puzzleSolutions.Length as Float
      wwiseevent.UpdateInstanceRTPC(instanceAllTuning, puzzleWwiseEventString_RingsAll_Tuning, fTotalPuzzleComplete)
      wwiseevent.UpdateInstanceRTPC(instanceRingsIdling, puzzleWwiseEventString_RingsAll_Tuning, fTotalPuzzleComplete)
      wAnomalySuccessEvent.Play(Game.GetPlayer() as ObjectReference, None, None)
      ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword)
      puzzleRef.SetAnimationVariableFloat(puzzleAnimationString_PlayerPos, fTotalPuzzleComplete)
      Self.PlayPuzzleAnimation(puzzleSolutionRef, solutionAnimationString_Success, solutionAnimationString_Finish, True)
      Self.SetPuzzleSolutionRef(True)
      Self.StartSolutionMovementTimer()
    Else
      If MQ104A.IsRunning() && MQ104A.GetStageDone(MQ104APuzzleCompletedStage) == False
        MQ104A.SetStage(MQ104APuzzleCompletedStage)
      EndIf
      PuzzleComplete = True
      Self.DisableNoWait(False)
      If puzzleSolutionRef
        Self.PlayPuzzleAnimation(puzzleSolutionRef, solutionAnimationString_Success, "", True)
      EndIf
      ObjectReference puzzleref = Self.GetLinkedRef(SBRingsPuzzleKeyword)
      ObjectReference powerTriggerEnableMarkerRef = Self.GetLinkedRef(SBPowerTriggerEnableMarkerKeyword)
      Int I = 0
      While I < Rings.Length
        sbringpuzzlenewscript:ringdata theRing = Rings[I]
        Self.StopSoundInstanceIfSet(theRing.ringToneInstance)
        I += 1
      EndWhile
      Self.StopSoundInstanceIfSet(instanceAllTuning)
      WwiseEvent_ShakeController_p5_p5_02.Play(Game.GetPlayer() as ObjectReference, None, None)
      Int instanceSuccess = wSuccessEvent.Play(Game.GetPlayer() as ObjectReference, None, None)
      Self.RegisterForAnimationEvent(puzzleref, puzzleEventString_ReactionEnd)
      Self.PlayPuzzleAnimation(puzzleref, puzzleAnimationString_Close, "", True)
      Int instanceCloseAnimation = wCloseAnimationEvent.Play(puzzleref, None, None)
      Int count = 0
      ObjectReference[] myDebris = Self.GetRefsLinkedToMe(None, None)
      While count < myDebris.Length
        ObjectReference currentObjectReference = myDebris[count]
        currentObjectReference.SetMotionType(currentObjectReference.Motion_Dynamic, False)
        count += 1
      EndWhile
      WwiseEvent_ShakeController_p5_p5_05.Play(Game.GetPlayer() as ObjectReference, None, None)
      count = 0
      While count < myDebris.Length
        Float fRandom = Utility.RandomFloat(0.300000012, 1.399999976)
        ObjectReference currentobjectreference = myDebris[count]
        currentobjectreference.ApplyHavokImpulse(0.0, 0.0, 1.0, fRandom)
        count += 1
      EndWhile
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If asEventName == puzzleEventString_ReactionEnd
    If QuestToCheck as Bool && StageToSet > -1
      QuestToCheck.SetStage(StageToSet)
    EndIf
    Self.SendCustomEvent("sbringpuzzlenewscript_PuzzleSolvedEvent", None)
    ObjectReference powerTriggerEnableMarkerRef = Self.GetLinkedRef(SBPowerTriggerEnableMarkerKeyword)
    If powerTriggerEnableMarkerRef
      powerTriggerEnableMarkerRef.Enable(False)
    EndIf
    Utility.Wait(2.0)
    Self.StopSoundInstanceIfSet(instanceRingsIdling)
    ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword)
    Self.UnregisterForAnimationEvent(puzzleRef, puzzleEventString_ReactionEnd)
  EndIf
EndEvent

Event OnLoad()
  Self.ResetPuzzle(False)
EndEvent

Event OnUnload()
  Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Self.CancelAllTimers()
    Self.ClearSolutionRef()
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndEvent

Function ResetPuzzle(Bool override)
  If PuzzleComplete == False || override
    Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      currentSolutionIndex = 0
      Self.SetPuzzleSolutionRef(False)
      ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword)
      Self.PlayPuzzleAnimation(puzzleRef, puzzleAnimationString_Reset, "", False)
      Self.StopSoundInstanceIfSet(instanceRingsIdling)
      ObjectReference powerTriggerEnableMarkerRef = Self.GetLinkedRef(SBPowerTriggerEnableMarkerKeyword)
      If powerTriggerEnableMarkerRef
        powerTriggerEnableMarkerRef.DisableNoWait(False)
      EndIf
      Self.EnableNoWait(False)
      PlayerIsInTrigger = False
      PuzzleInitialized = False
      If override
        PuzzleComplete = False
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  EndIf
EndFunction

Function StopSoundInstanceIfSet(Int aiSoundInstance)
  If aiSoundInstance > -1
    wwiseevent.StopInstance(aiSoundInstance)
  EndIf
EndFunction

Function StopSounds()
  Int I = 0
  While I < Rings.Length
    Self.StopSoundInstanceIfSet(Rings[I].ringToneInstance)
    I += 1
  EndWhile
  Self.StopSoundInstanceIfSet(instanceAllTuning)
  Self.StopSoundInstanceIfSet(instanceRingsIdling)
EndFunction

Function testmovetosolution()
  Game.GetPlayer().MoveTo(puzzleSolutionRef, 0.0, 0.0, 0.0, True, False)
EndFunction

Function DebugTraceSolutionData()
  Int I = 0
  While I < puzzleSolutions.Length
    sbringpuzzlenewscript:solutiondata thePuzzleSolution = puzzleSolutions[I]
    I += 1
  EndWhile
EndFunction

Function debugSetSolutionCount(Int newCount)
  solutionCount = newCount
  Self.ResetPuzzleSolutions()
  Self.ResetPuzzle(False)
  Self.CheckRotateRingsStart()
EndFunction

Function debugSetSolutionTimes(Float startTime, Float minTime)
  solutionMovementTimeStart = startTime
  solutionMovementTimeMin = minTime
EndFunction
