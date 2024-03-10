ScriptName StarbornPuzzleScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property FirstPositionMarker Auto Const mandatory
ObjectReference Property SecondPositionMarker Auto Const mandatory
ObjectReference Property ThirdPositionMarker Auto Const mandatory
ObjectReference Property FourthPositionMarker Auto Const mandatory
ObjectReference Property Ring Auto Const mandatory
ObjectReference Property OtherRing1 Auto Const mandatory
ObjectReference Property OtherRing2 Auto Const mandatory
ObjectReference Property mySoundMarker Auto Const mandatory
ObjectReference Property MasterDummy Auto Const mandatory
wwiseevent Property sTurning Auto Const mandatory
Int Property iCurrentPosition = 1 Auto

;-- Functions ---------------------------------------

Function Shake()
  Game.ShakeCamera(None, 0.200000003, 3.0)
EndFunction

Function ShrinkOtherRings()
  OtherRing1.SetScale(0.980000019)
  OtherRing2.SetScale(0.980000019)
  Utility.Wait(0.050000001)
  OtherRing1.SetScale(0.959999979)
  OtherRing2.SetScale(0.959999979)
  Utility.Wait(0.050000001)
  OtherRing1.SetScale(0.939999998)
  OtherRing2.SetScale(0.939999998)
  Utility.Wait(0.050000001)
  OtherRing1.SetScale(0.920000017)
  OtherRing2.SetScale(0.920000017)
  Utility.Wait(0.050000001)
  OtherRing1.SetScale(0.899999976)
  OtherRing2.SetScale(0.899999976)
  Utility.Wait(0.050000001)
EndFunction

Function GrowOtherRings()
  OtherRing1.SetScale(0.920000017)
  OtherRing2.SetScale(0.920000017)
  Utility.Wait(0.050000001)
  OtherRing1.SetScale(0.939999998)
  OtherRing2.SetScale(0.939999998)
  Utility.Wait(0.050000001)
  OtherRing1.SetScale(0.959999979)
  OtherRing2.SetScale(0.959999979)
  Utility.Wait(0.050000001)
  OtherRing1.SetScale(0.980000019)
  OtherRing2.SetScale(0.980000019)
  Utility.Wait(0.050000001)
  OtherRing1.SetScale(1.0)
  OtherRing2.SetScale(1.0)
  Utility.Wait(0.050000001)
EndFunction

;-- State -------------------------------------------
Auto State FirstPosition

  Event OnActivate(ObjectReference akActionRef)
    iCurrentPosition = 2
    Self.GotoState("Waiting")
    Ring.TranslateToRef(SecondPositionMarker, 20.0, 20.0)
    Self.Shake()
    sTurning.Play(mySoundMarker, None, None)
    Utility.Wait(4.5)
    Self.GotoState("SecondPosition")
  EndEvent
EndState

;-- State -------------------------------------------
State FourthPosition

  Event OnActivate(ObjectReference akActionRef)
    iCurrentPosition = 1
    Self.GotoState("Waiting")
    Ring.TranslateToRef(FirstPositionMarker, 20.0, 20.0)
    Self.Shake()
    sTurning.Play(mySoundMarker, None, None)
    Utility.Wait(4.5)
    Self.GotoState("FirstPosition")
  EndEvent
EndState

;-- State -------------------------------------------
State SecondPosition

  Event OnActivate(ObjectReference akActionRef)
    iCurrentPosition = 3
    Self.GotoState("Waiting")
    Ring.TranslateToRef(ThirdPositionMarker, 20.0, 20.0)
    Self.Shake()
    sTurning.Play(mySoundMarker, None, None)
    Utility.Wait(4.5)
    Self.GotoState("ThirdPosition")
  EndEvent
EndState

;-- State -------------------------------------------
State ThirdPosition

  Event OnActivate(ObjectReference akActionRef)
    iCurrentPosition = 4
    Self.GotoState("Waiting")
    Ring.TranslateToRef(FourthPositionMarker, 20.0, 20.0)
    Self.Shake()
    sTurning.Play(mySoundMarker, None, None)
    Utility.Wait(4.5)
    Self.GotoState("FourthPosition")
  EndEvent
EndState

;-- State -------------------------------------------
State Waiting
EndState
