ScriptName MQ206BScorpiusPuzzleControlScript Extends ObjectReference
{ Master Functions for the Scorpius Puzzle sequence. Puzzle is controlled by 4 buttons that moves a beam of light into the correct position to solve. }

;-- Variables ---------------------------------------
ObjectReference ButtonDownREF
ObjectReference ButtonLeftREF
ObjectReference ButtonRightREF
ObjectReference ButtonUpREF
Float fCurrentPosition_LeftRight
Float fCurrentPosition_UpDown

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard BeamPositionGuard
Guard PuzzleSetupGuard

;-- Properties --------------------------------------
Keyword Property MQ206BScorpius_BeamAnimHelper Auto Const mandatory
Keyword Property MQ206BScorpius_ButtonDown Auto Const mandatory
Keyword Property MQ206BScorpius_ButtonLeft Auto Const mandatory
Keyword Property MQ206BScorpius_ButtonRight Auto Const mandatory
Keyword Property MQ206BScorpius_ButtonUp Auto Const mandatory
Keyword Property MQ206BScorpius_Statue Auto Const mandatory
Keyword Property MQ206BScorpius_Trigger Auto Const mandatory
Keyword Property MQ206BScorpius_BeamLight Auto Const mandatory
Keyword Property MQ206BScorpius_LensFlareFX Auto Const mandatory
String Property sBeamOpacity = "Amount" Auto Const
Float Property fBeamStrength_Start = 0.5 Auto Const
Float Property fBeamStrength_Reset = 0.0 Auto Const
Float Property fBeamStrength_Full = 1.0 Auto Const
String Property sMovement_LeftRight = "Rotation" Auto Const
String Property sMovement_UpDown = "Position" Auto Const
Float Property fMovement_Initial = 0.5 Auto Const
Float Property fMovementUpDown_Initial = 0.5 Auto Const
String Property sStatuePuzzleAnim_Start = "Play01" Auto Const
String Property sStatuePuzzleAnim_Reset = "Reset" Auto Const
String Property sPuzzleSolutionAnim = "Stage2" Auto Const
String Property sPuzzleSolutionAnim_Reset = "Stage1" Auto Const
Float Property fSolutionPosition_LeftRight = 0.200000003 Auto Const
Float Property fSolutionPosition_UpDown = 0.400000006 Auto Const
Float Property ButtonMoveAmount = 0.100000001 Auto Const
Quest Property MQ206B Auto Const mandatory
Int Property MQ206BCompleteStage = 800 Auto Const
Int Property MQ206BPuzzleStartedStage = 720 Auto Const
wwiseevent Property WwiseEvent_QST_ScorpiusStatue_Beam_Move Auto Const mandatory
wwiseevent Property WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Down Auto Const mandatory
wwiseevent Property WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Left Auto Const mandatory
wwiseevent Property WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Right Auto Const mandatory
wwiseevent Property WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Up Auto Const mandatory
wwiseevent Property WwiseEvent_QST_ScorpiusStatue_Success Auto Const mandatory

;-- Functions ---------------------------------------

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  ; Empty function
EndEvent

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnUnload()
  Self.ResetPuzzle()
EndEvent

Function StartPuzzle()
  Guard PuzzleSetupGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    ObjectReference StatueREF = Self.GetLinkedRef(MQ206BScorpius_Statue)
    ObjectReference BeamLightREF = Self.GetLinkedRef(MQ206BScorpius_BeamLight)
    ObjectReference BeamHelperREF = Self.GetLinkedRef(MQ206BScorpius_BeamAnimHelper)
    ButtonLeftREF = Self.GetLinkedRef(MQ206BScorpius_ButtonLeft)
    ButtonRightREF = Self.GetLinkedRef(MQ206BScorpius_ButtonRight)
    ButtonUpREF = Self.GetLinkedRef(MQ206BScorpius_ButtonUp)
    ButtonDownREF = Self.GetLinkedRef(MQ206BScorpius_ButtonDown)
    Self.RegisterForRemoteEvent(ButtonLeftREF as ScriptObject, "OnActivate")
    Self.RegisterForRemoteEvent(ButtonRightREF as ScriptObject, "OnActivate")
    Self.RegisterForRemoteEvent(ButtonUpREF as ScriptObject, "OnActivate")
    Self.RegisterForRemoteEvent(ButtonDownREF as ScriptObject, "OnActivate")
    StatueREF.PlayAnimation(sStatuePuzzleAnim_Start)
    BeamLightREF.PlayAnimation(sStatuePuzzleAnim_Start)
    BeamHelperREF.SetAnimationVariableFloat(sMovement_LeftRight, fMovement_Initial)
    BeamHelperREF.SetAnimationVariableFloat(sMovement_UpDown, fMovementUpDown_Initial)
    BeamLightREF.SetAnimationVariableFloat(sBeamOpacity, fBeamStrength_Start)
    Guard BeamPositionGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      fCurrentPosition_LeftRight = fMovement_Initial
      fCurrentPosition_UpDown = fMovementUpDown_Initial
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  Self.GoToState("IdleState")
EndFunction

Function ResetPuzzle()
  Guard PuzzleSetupGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Self.GoToState("WaitingToStart")
    ObjectReference StatueREF = Self.GetLinkedRef(MQ206BScorpius_Statue)
    ObjectReference BeamLightREF = Self.GetLinkedRef(MQ206BScorpius_BeamLight)
    ObjectReference BeamHelperREF = Self.GetLinkedRef(MQ206BScorpius_BeamAnimHelper)
    ButtonLeftREF = Self.GetLinkedRef(MQ206BScorpius_ButtonLeft)
    ButtonRightREF = Self.GetLinkedRef(MQ206BScorpius_ButtonRight)
    ButtonUpREF = Self.GetLinkedRef(MQ206BScorpius_ButtonUp)
    ButtonDownREF = Self.GetLinkedRef(MQ206BScorpius_ButtonDown)
    Self.UnRegisterForRemoteEvent(ButtonLeftREF as ScriptObject, "OnActivate")
    Self.UnRegisterForRemoteEvent(ButtonRightREF as ScriptObject, "OnActivate")
    Self.UnRegisterForRemoteEvent(ButtonUpREF as ScriptObject, "OnActivate")
    Self.UnRegisterForRemoteEvent(ButtonDownREF as ScriptObject, "OnActivate")
    ButtonLeftREF = None
    ButtonRightREF = None
    ButtonUpREF = None
    ButtonDownREF = None
    StatueREF.PlayAnimation(sStatuePuzzleAnim_Reset)
    BeamLightREF.PlayAnimation(sStatuePuzzleAnim_Reset)
    BeamLightREF.SetAnimationVariableFloat(sBeamOpacity, fBeamStrength_Reset)
    BeamHelperREF.SetAnimationVariableFloat(sMovement_LeftRight, fMovement_Initial)
    BeamHelperREF.SetAnimationVariableFloat(sMovement_UpDown, fMovement_Initial)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function MoveBeamLeft()
  Guard BeamPositionGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    ObjectReference BeamHelperREF = Self.GetLinkedRef(MQ206BScorpius_BeamAnimHelper)
    fCurrentPosition_LeftRight -= ButtonMoveAmount
    If fCurrentPosition_LeftRight < 0.0
      fCurrentPosition_LeftRight = 0.0
    ElseIf fCurrentPosition_LeftRight > 1.0
      fCurrentPosition_LeftRight = 1.0
    EndIf
    WwiseEvent_QST_ScorpiusStatue_Beam_Move.Play(BeamHelperREF, None, None)
    BeamHelperREF.SetAnimationVariableFloat(sMovement_LeftRight, fCurrentPosition_LeftRight)
    Self.CheckSolutionPosition()
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function MoveBeamRight()
  Guard BeamPositionGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    ObjectReference BeamHelperREF = Self.GetLinkedRef(MQ206BScorpius_BeamAnimHelper)
    fCurrentPosition_LeftRight += ButtonMoveAmount
    If fCurrentPosition_LeftRight < 0.0
      fCurrentPosition_LeftRight = 0.0
    ElseIf fCurrentPosition_LeftRight > 1.0
      fCurrentPosition_LeftRight = 1.0
    EndIf
    WwiseEvent_QST_ScorpiusStatue_Beam_Move.Play(BeamHelperREF, None, None)
    BeamHelperREF.SetAnimationVariableFloat(sMovement_LeftRight, fCurrentPosition_LeftRight)
    Self.CheckSolutionPosition()
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function MoveBeamUp()
  Guard BeamPositionGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    ObjectReference BeamHelperREF = Self.GetLinkedRef(MQ206BScorpius_BeamAnimHelper)
    fCurrentPosition_UpDown += ButtonMoveAmount
    If fCurrentPosition_UpDown < 0.0
      fCurrentPosition_UpDown = 0.0
    ElseIf fCurrentPosition_UpDown > 1.0
      fCurrentPosition_UpDown = 1.0
    EndIf
    WwiseEvent_QST_ScorpiusStatue_Beam_Move.Play(BeamHelperREF, None, None)
    BeamHelperREF.SetAnimationVariableFloat(sMovement_UpDown, fCurrentPosition_UpDown)
    Self.CheckSolutionPosition()
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function MoveBeamDown()
  Guard BeamPositionGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    ObjectReference BeamHelperREF = Self.GetLinkedRef(MQ206BScorpius_BeamAnimHelper)
    fCurrentPosition_UpDown -= ButtonMoveAmount
    If fCurrentPosition_UpDown < 0.0
      fCurrentPosition_UpDown = 0.0
    ElseIf fCurrentPosition_UpDown > 1.0
      fCurrentPosition_UpDown = 1.0
    EndIf
    WwiseEvent_QST_ScorpiusStatue_Beam_Move.Play(BeamHelperREF, None, None)
    BeamHelperREF.SetAnimationVariableFloat(sMovement_UpDown, fCurrentPosition_UpDown)
    Self.CheckSolutionPosition()
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function CheckSolutionPosition()
  If fCurrentPosition_LeftRight == fSolutionPosition_LeftRight && fCurrentPosition_UpDown == fSolutionPosition_UpDown
    ObjectReference BeamLightREF = Self.GetLinkedRef(MQ206BScorpius_BeamLight)
    ObjectReference StatueREF = Self.GetLinkedRef(MQ206BScorpius_Statue)
    WwiseEvent_QST_ScorpiusStatue_Success.Play(StatueREF, None, None)
    BeamLightREF.SetAnimationVariableFloat(sBeamOpacity, fBeamStrength_Full)
    Self.GetLinkedRef(MQ206BScorpius_LensFlareFX).PlayAnimation("Stage2")
    StatueREF.PlayAnimation(sPuzzleSolutionAnim)
    MQ206B.SetStage(MQ206BCompleteStage)
  EndIf
  Utility.Wait(0.100000001)
EndFunction

;-- State -------------------------------------------
State IdleState

  Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
    If akSender == ButtonLeftREF
      Self.GoToState("MovingBeamState")
      WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Left.Play(ButtonLeftREF, None, None)
      Self.MoveBeamLeft()
    ElseIf akSender == ButtonRightREF
      Self.GoToState("MovingBeamState")
      WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Right.Play(ButtonRightREF, None, None)
      Self.MoveBeamRight()
    ElseIf akSender == ButtonUpREF
      Self.GoToState("MovingBeamState")
      WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Up.Play(ButtonUpREF, None, None)
      Self.MoveBeamUp()
    ElseIf akSender == ButtonDownREF
      Self.GoToState("MovingBeamState")
      WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Down.Play(ButtonDownREF, None, None)
      Self.MoveBeamDown()
    EndIf
    Self.GoToState("IdleState")
  EndEvent
EndState

;-- State -------------------------------------------
Auto State InitialLoadState

  Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
    ObjectReference StatueTriggerREF = Self.GetLinkedRef(MQ206BScorpius_Trigger)
    If akSender == StatueTriggerREF && (akActionRef == Game.GetPlayer() as ObjectReference)
      Self.UnRegisterForRemoteEvent(StatueTriggerREF as ScriptObject, "OnTriggerEnter")
      Self.StartPuzzle()
      MQ206B.SetStage(MQ206BPuzzleStartedStage)
    EndIf
  EndEvent

  Event OnLoad()
    ObjectReference StatueTriggerREF = Self.GetLinkedRef(MQ206BScorpius_Trigger)
    Self.RegisterForRemoteEvent(StatueTriggerREF as ScriptObject, "OnTriggerEnter")
  EndEvent
EndState

;-- State -------------------------------------------
State MovingBeamState
EndState

;-- State -------------------------------------------
State WaitingToStart

  Event OnLoad()
    Self.StartPuzzle()
  EndEvent
EndState
