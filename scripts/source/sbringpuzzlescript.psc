ScriptName SBRingPuzzleScript Extends ObjectReference conditional
{ runs the starborn temple puzzle
    starts tracking the player's position relative to the "solution spot" when player enters trigger
    updates animation variables on puzzle to modify how "tuned" each ring is
    complete puzzle when the player is at "solution spot" (within a tolerance) }

;-- Structs -----------------------------------------
Struct ringData
  wwiseevent ringToneEvent
  Int ringToneInstance = -1
  wwiseevent successEvent
  String ringTuningSoundString
  Float solutionPosition = 0.0
EndStruct


;-- Variables ---------------------------------------
Int instanceRingMovement
Int overallTuningCount = 0
Int playerMovementTimerID = 1 Const
Float playerMovementTimerSeconds = 0.5 Const
ObjectReference puzzleSolutionRef
Float puzzleX
Float puzzleY
Float puzzleZ
Int requiredTuningCount
ObjectReference visibleSolutionRef

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
  { placed at solution position }
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
EndGroup

Group PuzzleData
  sbringpuzzlescript:ringdata[] Property Rings Auto mandatory
  Float Property fRingSpeedMin = 0.100000001 Auto Const
  Float Property fRingSpeedMax = 10.0 Auto Const
  Float Property minPuzzleTuningOrientation = 0.800000012 Auto Const
  { how close is required to total puzzle completion to count as "tuned"? }
  Float Property puzzlePositionMaxXY = 20.0 Auto Const
  { how far away max can the "solution" position be? }
  Float Property puzzlePositionMinZ = 8.0 Auto Const
  { min Z for solution }
  Float Property puzzlePositionMaxZ = 18.0 Auto Const
  { max Z for solution; (min is always 0) }
  Float Property puzzleposition_angleVmin = 0.0 Auto Const
  { horizontal angle min }
  Float Property puzzleposition_angleVmax = 90.0 Auto Const
  { horizontal angle max }
  Float Property puzzleposition_angleHmin = 15.0 Auto Const
  { horizontal angle min }
  Float Property puzzleposition_angleHmax = 345.0 Auto Const
  { horizontal angle max }
  Float Property requiredTuningSeconds = 3.0 Auto Const
  { how many seconds does the player need to be within the "tuning spot" to count as the ring/puzzle being "tuned" }
  String Property puzzleAnimationString = "fRingTarget" Auto Const
  { animation variable to update puzzle animation based on player position }
EndGroup

Group SolutionVisibility
  GlobalVariable Property SBPuzzleSolutionVisible Auto Const
  { set to 1 to use solution visibility ref }
  String Property solutionAnimationString = "fHintVisibility" Auto Const
  { animation variable to update solution animation based on player position }
  Form Property SolutionVisibilityMarker Auto Const
  { placed at solution position if SBPuzzleSolutionVisible > 0 }
  Float Property minPuzzleTuningOrientationSolution = 0.920000017 Auto Const
  { how close is required to total puzzle completion to count as "tuned"? }
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
  { TEMP. For LC165, using this to disable the CheckRings function and avoid script spam. }
  GlobalVariable Property MQAutoSolvePuzzle Auto Const
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  requiredTuningCount = Math.Floor(requiredTuningSeconds / playerMovementTimerSeconds)
  Self.ResetPuzzleSolution(False)
EndEvent

Function ResetPuzzleSolution(Bool bUseMax)
  ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword)
  puzzleX = puzzleRef.GetPositionX()
  puzzleY = puzzleRef.GetPositionY()
  puzzleZ = puzzleRef.GetPositionZ()
  Float solutionX = 0.0
  Float solutionY = 0.0
  Float solutionZ = 0.0
  Float angleV = Utility.RandomFloat(puzzleposition_angleVmin, puzzleposition_angleVmax)
  Float angleH = Utility.RandomFloat(puzzleposition_angleHmin, puzzleposition_angleHmax)
  Float solutionRadius = Utility.RandomFloat(puzzlePositionMinZ, puzzlePositionMaxZ)
  If bUseMax
    solutionRadius = puzzlePositionMaxZ
  EndIf
  solutionZ = solutionRadius * Math.sin(angleV)
  Float radiusH = Math.sqrt(solutionRadius * solutionRadius - solutionZ * solutionZ)
  solutionY = Math.sin(angleH) * radiusH
  solutionX = Math.cos(angleH) * radiusH
  Rings[0].solutionPosition = solutionX
  Rings[1].solutionPosition = solutionY
  Rings[2].solutionPosition = solutionZ
  Self.DebugTraceRingData()
  Self.CreateSolutionRef()
EndFunction

Function CreateSolutionRef()
  ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword)
  If puzzleSolutionRef == None
    puzzleSolutionRef = puzzleRef.PlaceAtMe(MarkerDummyA, 1, False, False, True, None, None, True)
  EndIf
  puzzleSolutionRef.MoveTo(puzzleRef, Rings[0].solutionPosition, Rings[1].solutionPosition, Rings[2].solutionPosition, True, False)
  If SBPuzzleSolutionVisible.GetValue() > 0.0
    If visibleSolutionRef == None
      visibleSolutionRef = puzzleSolutionRef.PlaceAtMe(SolutionVisibilityMarker, 1, False, True, True, None, None, True)
    Else
      visibleSolutionRef.MoveTo(puzzleSolutionRef, 0.0, 0.0, 0.0, True, False)
    EndIf
    visibleSolutionRef.SetAnimationVariableFloat(solutionAnimationString, 0.0)
    visibleSolutionRef.Enable(False)
  EndIf
EndFunction

Function ClearSolutionRef()
  puzzleSolutionRef = None
  If visibleSolutionRef
    visibleSolutionRef.Disable(False)
    visibleSolutionRef.Delete()
    visibleSolutionRef = None
  EndIf
EndFunction

Event OnTriggerEnter(ObjectReference akActionRef)
  If PuzzleComplete == False && (akActionRef == Game.getplayer() as ObjectReference)
    Self.CheckRotateRingsStart()
  EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  If PuzzleComplete == False && (akActionRef == Game.getplayer() as ObjectReference)
    Self.CheckRotateRingsStart()
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == playerMovementTimerID
    Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      Self.RotateRings(True)
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  EndIf
EndEvent

Function CheckRotateRingsStart()
  Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    PlayerIsInTrigger = Self.IsInTrigger(Game.getplayer() as ObjectReference)
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
    ObjectReference playerRef = Game.getplayer() as ObjectReference
    ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword)
    Float distanceToSolution = Game.getplayer().GetDistance(puzzleSolutionRef)
    Float maxDistanceToSolution = puzzlePositionMaxZ * 2.0
    distanceToSolution = Math.Min(distanceToSolution, maxDistanceToSolution)
    Float fTotalPuzzleComplete = 1.0 - distanceToSolution / maxDistanceToSolution
    wwiseevent.UpdateInstanceRTPC(instanceAllTuning, "ArtifactPuzzle_RingsAll_Tuning", fTotalPuzzleComplete)
    wwiseevent.UpdateInstanceRTPC(instanceRingsIdling, "ArtifactPuzzle_RingsAll_Tuning", fTotalPuzzleComplete)
    puzzleRef.SetAnimationVariableFloat(puzzleAnimationString, fTotalPuzzleComplete)
    If visibleSolutionRef
      visibleSolutionRef.SetAnimationVariableFloat(solutionAnimationString, fTotalPuzzleComplete)
    EndIf
    If fTotalPuzzleComplete >= minPuzzleTuningOrientation && visibleSolutionRef == None || fTotalPuzzleComplete >= minPuzzleTuningOrientationSolution
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

Function testmovetosolution()
  Game.getplayer().MoveTo(puzzleSolutionRef, 0.0, 0.0, 0.0, True, False)
EndFunction

Function DebugTraceRingData()
  Int I = 0
  While I < 3
    sbringpuzzlescript:ringdata theRing = Rings[I]
    I += 1
  EndWhile
EndFunction

Function InitializePuzzle()
  Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If PuzzleInitialized == False
      PuzzleInitialized = True
      ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword)
      If PuzzleComplete
        Return 
      EndIf
      Int instanceRumble = wRumble.Play(Game.getplayer() as ObjectReference, None, None)
      Self.GetLinkedRef(SBRumbleDebrisEnableMarkerKeyword).Enable(False)
      WwiseEvent_ShakeController_p5_p5_05.Play(Game.getplayer() as ObjectReference, None, None)
      Utility.Wait(2.0)
      If puzzleRef
        wRingsRelease.Play(puzzleRef, None, None)
        Utility.Wait(0.300000012)
        wOpenAnimation.Play(puzzleRef, None, None)
        puzzleRef.PlayAnimationAndWait("Open", "Opened")
      EndIf
      If MQ104A.IsRunning() && MQ104A.GetStageDone(MQ104APuzzleStartedStage) == False
        MQ104A.SetStage(MQ104APuzzleStartedStage)
      EndIf
      Self.InitializeRings()
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
    sbringpuzzlescript:ringdata theRing = Rings[I]
    theRing.ringToneInstance = theRing.ringToneEvent.PlayWithRTPC(puzzleRef, theRing.ringTuningSoundString, 0.0)
    I += 1
  EndWhile
  instanceAllTuning = AllRingsToneEvent.PlayWithRTPC(puzzleRef, "ArtifactPuzzle_RingsAll_Tuning", 0.0)
  instanceRingsIdling = wRingsIdleSoundEvent.PlayWithRTPC(puzzleRef, "ArtifactPuzzle_RingsAll_Tuning", 0.0)
EndFunction

Function CompletePuzzle()
  Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If MQ104A.IsRunning() && MQ104A.GetStageDone(MQ104APuzzleCompletedStage) == False
      MQ104A.SetStage(MQ104APuzzleCompletedStage)
    EndIf
    PuzzleComplete = True
    Self.DisableNoWait(False)
    If visibleSolutionRef
      visibleSolutionRef.SetAnimationVariableFloat(solutionAnimationString, 0.0)
    EndIf
    ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword)
    ObjectReference powerTriggerEnableMarkerRef = Self.GetLinkedRef(SBPowerTriggerEnableMarkerKeyword)
    Int I = 0
    While I < Rings.Length
      sbringpuzzlescript:ringdata theRing = Rings[I]
      wwiseevent.StopInstance(theRing.ringToneInstance)
      I += 1
    EndWhile
    wwiseevent.StopInstance(instanceAllTuning)
    WwiseEvent_ShakeController_p5_p5_02.Play(Game.getplayer() as ObjectReference, None, None)
    Int instanceSuccess = wSuccessEvent.Play(Game.getplayer() as ObjectReference, None, None)
    Self.RegisterForAnimationEvent(puzzleRef, "ReactionEnd")
    puzzleRef.PlayAnimation("Close")
    Int instanceCloseAnimation = wCloseAnimationEvent.Play(puzzleRef, None, None)
    Int count = 0
    ObjectReference[] myDebris = Self.GetRefsLinkedToMe(None, None)
    While count < myDebris.Length
      ObjectReference currentObjectReference = myDebris[count]
      currentObjectReference.SetMotionType(currentObjectReference.Motion_Dynamic, False)
      count += 1
    EndWhile
    WwiseEvent_ShakeController_p5_p5_05.Play(Game.getplayer() as ObjectReference, None, None)
    count = 0
    While count < myDebris.Length
      Float fRandom = Utility.RandomFloat(0.300000012, 1.399999976)
      ObjectReference currentobjectreference = myDebris[count]
      currentobjectreference.ApplyHavokImpulse(0.0, 0.0, 1.0, fRandom)
      count += 1
    EndWhile
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If asEventName == "ReactionEnd"
    If QuestToCheck as Bool && StageToSet > -1
      QuestToCheck.SetStage(StageToSet)
    EndIf
    Self.SendCustomEvent("sbringpuzzlescript_PuzzleSolvedEvent", None)
    ObjectReference powerTriggerEnableMarkerRef = Self.GetLinkedRef(SBPowerTriggerEnableMarkerKeyword)
    If powerTriggerEnableMarkerRef
      powerTriggerEnableMarkerRef.Enable(False)
    EndIf
    Utility.Wait(2.0)
    wwiseevent.StopInstance(instanceRingsIdling)
    ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword)
    Self.UnregisterForAnimationEvent(puzzleRef, "ReactionEnd")
  EndIf
EndEvent

Event OnLoad()
  Self.ResetPuzzle(False)
EndEvent

Event OnUnload()
  Self.ClearSolutionRef()
EndEvent

Function ResetPuzzle(Bool override)
  If PuzzleComplete == False || override
    Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      Self.CreateSolutionRef()
      ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword)
      puzzleRef.PlayAnimation("Reset")
      wwiseevent.StopInstance(instanceRingsIdling)
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

Function StopSounds()
  Int I = 0
  While I < Rings.Length
    wwiseevent.StopInstance(Rings[I].ringToneInstance)
    I += 1
  EndWhile
  wwiseevent.StopInstance(instanceAllTuning)
  wwiseevent.StopInstance(instanceRingsIdling)
EndFunction
