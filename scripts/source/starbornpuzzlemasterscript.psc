ScriptName StarbornPuzzleMasterScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property AMBStarbornTempleTestTone_A1_D_p0Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_A1_D_p1Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_A1_D_p2Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_A1_D_p3Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_B2_Fs_p0Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_B2_Fs_p1Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_B2_Fs_p2Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_B2_Fs_p3Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_C3_A_p0Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_C3_A_p1Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_C3_A_p2Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_C3_A_p3Event Auto Const mandatory
ObjectReference Property Ring1Dummy Auto Const mandatory
ObjectReference Property Ring2Dummy Auto Const mandatory
ObjectReference Property Ring3Dummy Auto Const mandatory
ObjectReference Property CompletionSoundMarker Auto Const mandatory
ObjectReference Property CompletionSoundMarker2 Auto Const mandatory
ObjectReference Property PuzzleOpenMarker Auto Const mandatory
ObjectReference Property RampMoveMarker Auto Const mandatory
ObjectReference Property Ramp Auto Const mandatory
ObjectReference Property BottomRing Auto Const mandatory
Int Property Ring1Solution = 1 Auto Const mandatory
{ this is the position ring 1 needs to be in to solve this puzzle }
Int Property Ring2Solution = 1 Auto Const mandatory
{ this is the position ring 2 needs to be in to solve this puzzle }
Int Property Ring3Solution = 1 Auto Const mandatory
{ this is the position ring 3 needs to be in to solve this puzzle }
wwiseevent Property AMBStarbornTempleTestPuzzleSuccessEvent Auto Const mandatory
wwiseevent Property sFailureEvent Auto Const mandatory
wwiseevent Property sWallOpeningEvent Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  (Ring1Dummy as starbornpuzzlescript).iCurrentPosition
  (Ring2Dummy as starbornpuzzlescript).iCurrentPosition
  (Ring3Dummy as starbornpuzzlescript).iCurrentPosition
  Self.PlayTones()
  If (Ring1Dummy as starbornpuzzlescript).iCurrentPosition == 1 && (Ring2Dummy as starbornpuzzlescript).iCurrentPosition == 1 && (Ring3Dummy as starbornpuzzlescript).iCurrentPosition == 1
    Self.CorrectPattern()
  EndIf
EndEvent

Function PlayTones()
  Int iCurrentFirstTone = 1
  Int iCurrentSecondTone = 1
  Int iCurrentThirdTone = 1
  If (Ring1Dummy as starbornpuzzlescript).iCurrentPosition == 1
    iCurrentFirstTone = 1
    AMBStarbornTempleTestTone_A1_D_p0Event.Play(CompletionSoundMarker, None, None)
    Utility.Wait(2.0)
  EndIf
  If (Ring1Dummy as starbornpuzzlescript).iCurrentPosition == 2
    iCurrentFirstTone = 2
    AMBStarbornTempleTestTone_A1_D_p1Event.Play(CompletionSoundMarker, None, None)
    Utility.Wait(2.0)
  EndIf
  If (Ring1Dummy as starbornpuzzlescript).iCurrentPosition == 3
    iCurrentFirstTone = 3
    AMBStarbornTempleTestTone_A1_D_p2Event.Play(CompletionSoundMarker, None, None)
    Utility.Wait(2.0)
  EndIf
  If (Ring1Dummy as starbornpuzzlescript).iCurrentPosition == 4
    iCurrentFirstTone = 4
    AMBStarbornTempleTestTone_A1_D_p3Event.Play(CompletionSoundMarker, None, None)
    Utility.Wait(2.0)
  EndIf
  If (Ring2Dummy as starbornpuzzlescript).iCurrentPosition == 1
    iCurrentSecondTone = 1
    AMBStarbornTempleTestTone_B2_Fs_p0Event.Play(CompletionSoundMarker, None, None)
    Utility.Wait(2.0)
  EndIf
  If (Ring2Dummy as starbornpuzzlescript).iCurrentPosition == 2
    iCurrentSecondTone = 2
    AMBStarbornTempleTestTone_A1_D_p1Event.Play(CompletionSoundMarker, None, None)
    Utility.Wait(2.0)
  EndIf
  If (Ring2Dummy as starbornpuzzlescript).iCurrentPosition == 3
    iCurrentSecondTone = 3
    AMBStarbornTempleTestTone_A1_D_p2Event.Play(CompletionSoundMarker, None, None)
    Utility.Wait(2.0)
  EndIf
  If (Ring2Dummy as starbornpuzzlescript).iCurrentPosition == 4
    iCurrentSecondTone = 4
    AMBStarbornTempleTestTone_A1_D_p3Event.Play(CompletionSoundMarker, None, None)
    Utility.Wait(2.0)
  EndIf
  If (Ring3Dummy as starbornpuzzlescript).iCurrentPosition == 1
    iCurrentThirdTone = 1
    AMBStarbornTempleTestTone_C3_A_p0Event.Play(CompletionSoundMarker, None, None)
    Utility.Wait(2.0)
  EndIf
  If (Ring3Dummy as starbornpuzzlescript).iCurrentPosition == 2
    iCurrentThirdTone = 2
    AMBStarbornTempleTestTone_A1_D_p1Event.Play(CompletionSoundMarker, None, None)
    Utility.Wait(2.0)
  EndIf
  If (Ring3Dummy as starbornpuzzlescript).iCurrentPosition == 3
    iCurrentThirdTone = 3
    AMBStarbornTempleTestTone_A1_D_p2Event.Play(CompletionSoundMarker, None, None)
    Utility.Wait(2.0)
  EndIf
  If (Ring3Dummy as starbornpuzzlescript).iCurrentPosition == 4
    iCurrentThirdTone = 4
    AMBStarbornTempleTestTone_A1_D_p3Event.Play(CompletionSoundMarker, None, None)
    Utility.Wait(2.0)
  EndIf
EndFunction

Function CorrectPattern()
  AMBStarbornTempleTestPuzzleSuccessEvent.Play(CompletionSoundMarker, None, None)
  Utility.Wait(2.0)
  BottomRing.TranslateToRef(PuzzleOpenMarker, 1.0, 30.0)
  Utility.Wait(2.0)
  Ramp.TranslateToRef(RampMoveMarker, 1.0, 0.0)
EndFunction

Function IncorrectPattern()
  sFailureEvent.Play(CompletionSoundMarker, None, None)
EndFunction
