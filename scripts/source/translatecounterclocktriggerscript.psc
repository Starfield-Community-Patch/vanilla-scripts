ScriptName TranslateCounterClockTriggerScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool PlayerInTrigger = True

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
wwiseevent Property sSuccess Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  PlayerInTrigger = True
  While PlayerInTrigger
    Float currentAngleX = myRing.GetAngleX()
    Float currentAngleY = myRing.GetAngleY()
    Float currentAngleZ = myRing.GetAngleZ()
    Float currentPositionX = myRing.GetPositionX()
    Float currentPositionY = myRing.GetPositionY()
    Float currentPositionZ = myRing.GetPositionZ()
    myRing.TranslateTo(currentPositionX, currentPositionY, currentPositionZ, currentAngleX, currentAngleY, currentAngleZ - 0.200000003, 250.0, 0.0)
    Utility.Wait(0.100000001)
  EndWhile
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  PlayerInTrigger = False
  myRing.StopTranslation()
  Self.CheckPositions()
EndEvent

Function CheckPositions()
  If myRing.GetAngleZ() <= 2.0 && myRing.GetAngleZ() >= -2.0 && Ring2.GetAngleZ() <= 2.0 && Ring2.GetAngleZ() >= -2.0 && Ring3.GetAngleZ() <= 2.0 && Ring3.GetAngleZ() >= -2.0
    Utility.Wait(1.0)
    sSuccess.Play(sSuccessMarker, None, None)
    Ramp.TranslateToRef(RampPositionMarker, 1.0, 0.0)
    myRing.SetScale(0.899999976)
    myRing.TranslateToRef(RingsTranslateToMarker, 1.0, 0.0)
    Ring2.SetScale(1.100000024)
    Ring2.TranslateToRef(RingsTranslateToMarker, 1.0, 0.0)
    Ring3.SetScale(0.800000012)
    Ring3.TranslateToRef(RingsTranslateToMarker, 1.0, 0.0)
    SPDoorTop.TranslateToRef(SPDoorTopMoveToMarker, 10.0, 0.0)
    SPDoorBottom.TranslateToRef(SPDoorBottomMoveToMarker, 10.0, 0.0)
  EndIf
EndFunction
