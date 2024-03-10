ScriptName StarbornCylinderPuzzleMasterScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool PlayerInTrigger = False
Float currentAngleX
Float currentAngleY
Float currentAngleZ
Float currentPositionX
Float currentPositionY
Float currentPositionZ

;-- Properties --------------------------------------
ObjectReference Property myRing Auto Const mandatory
ObjectReference Property Ring2 Auto Const mandatory
ObjectReference Property Ring3 Auto Const mandatory
ObjectReference Property sSuccessMarker Auto Const mandatory
ObjectReference Property Ramp Auto Const mandatory
ObjectReference Property RampPositionMarker Auto Const mandatory
ObjectReference Property RingsTranslateToMarker Auto Const
ObjectReference Property SPDoorTop Auto Const
ObjectReference Property SPDoorBottom Auto Const
ObjectReference Property SPDoorTopMoveToMarker Auto Const
ObjectReference Property SPDoorBottomMoveToMarker Auto Const
wwiseevent Property Tone1Event Auto Const
wwiseevent Property Tone2Event Auto Const
wwiseevent Property Tone3Event Auto Const
Bool Property bCounterClockwise = False Auto Const
Bool Property bCylinderPuzzle = False Auto Const
Bool Property bVertRingsPuzzle = False Auto Const
Bool Property bFiveRingsSuccess = False Auto Const
wwiseevent Property sSuccessEvent Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  PlayerInTrigger = True
  While PlayerInTrigger
    currentAngleY = myRing.GetAngleY()
    currentAngleX = myRing.GetAngleX()
    currentAngleZ = myRing.GetAngleZ()
    currentPositionX = myRing.GetPositionX()
    currentPositionY = myRing.GetPositionY()
    currentPositionZ = myRing.GetPositionZ()
    If bCylinderPuzzle
      If bCounterClockwise == True
        myRing.TranslateTo(currentPositionX, currentPositionY, currentPositionZ, currentAngleX, currentAngleY - 0.5, currentAngleZ, 0.0, 1.0)
      Else
        myRing.TranslateTo(currentPositionX, currentPositionY, currentPositionZ, currentAngleX, currentAngleY + 0.5, currentAngleZ, 0.0, 1.0)
      EndIf
    ElseIf bVertRingsPuzzle == True
      If bCounterClockwise
        myRing.TranslateTo(currentPositionX, currentPositionY, currentPositionZ, currentAngleX - 0.400000006, currentAngleY, currentAngleZ, 100.0, 0.0)
      Else
        myRing.TranslateTo(currentPositionX, currentPositionY, currentPositionZ, currentAngleX + 0.400000006, currentAngleY, currentAngleZ, 100.0, 0.0)
      EndIf
    EndIf
    Utility.Wait(0.200000003)
  EndWhile
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  PlayerInTrigger = False
  myRing.StopTranslation()
  If bVertRingsPuzzle
    Self.VRingsCheckPosition()
  ElseIf bCylinderPuzzle && bFiveRingsSuccess
    Self.FiveRingsCheckPosition()
  ElseIf bCylinderPuzzle
    Self.CylinderCheckPosition()
  EndIf
EndEvent

Function CylinderCheckPosition()
  If myRing.GetAngleY() <= 2.0 && myRing.GetAngleY() >= -2.0 && Ring2.GetAngleY() <= 2.0 && Ring2.GetAngleY() >= -2.0 && Ring3.GetAngleY() <= 2.0 && Ring3.GetAngleY() >= -2.0
    Utility.Wait(1.0)
    Tone1Event.Play(sSuccessMarker, None, None)
    Utility.Wait(1.0)
    Tone2Event.Play(sSuccessMarker, None, None)
    Utility.Wait(1.0)
    Tone3Event.Play(sSuccessMarker, None, None)
    Utility.Wait(2.0)
    sSuccessEvent.Play(sSuccessMarker, None, None)
    Ramp.TranslateToRef(RampPositionMarker, 1.0, 0.0)
    myRing.SetScale(0.899999976)
    myRing.TranslateToRef(RingsTranslateToMarker, 1.0, 0.0)
    Ring2.SetScale(1.100000024)
    Ring2.TranslateToRef(RingsTranslateToMarker, 1.0, 0.0)
    Ring3.SetScale(0.800000012)
    Ring3.TranslateToRef(RingsTranslateToMarker, 1.0, 0.0)
  EndIf
EndFunction

Function VRingsCheckPosition()
  If myRing.GetAngleX() <= 2.0 && myRing.GetAngleX() >= -2.0 && Ring2.GetAngleX() <= 2.0 && Ring2.GetAngleX() >= -2.0 && Ring3.GetAngleX() <= 2.0 && Ring3.GetAngleX() >= -2.0
    Utility.Wait(1.0)
    sSuccessEvent.Play(sSuccessMarker, None, None)
    SPDoorTop.TranslateToRef(SPDoorTopMoveToMarker, 10.0, 0.0)
    SPDoorBottom.TranslateToRef(SPDoorBottomMoveToMarker, 10.0, 0.0)
    Ramp.TranslateToRef(RampPositionMarker, 8.0, 0.0)
  EndIf
EndFunction

Function FiveRingsCheckPosition()
  If myRing.GetAngleY() <= 2.0 && myRing.GetAngleY() >= -2.0 && Ring2.GetAngleY() <= 2.0 && Ring2.GetAngleY() >= -2.0 && Ring3.GetAngleY() <= 2.0 && Ring3.GetAngleY() >= -2.0
    Utility.Wait(1.0)
    sSuccessEvent.Play(sSuccessMarker, None, None)
    myRing.TranslateToRef(RingsTranslateToMarker, 1.0, 0.0)
    Ring2.TranslateToRef(RingsTranslateToMarker, 1.0, 0.0)
    Ring3.TranslateToRef(RingsTranslateToMarker, 1.0, 0.0)
  EndIf
EndFunction
