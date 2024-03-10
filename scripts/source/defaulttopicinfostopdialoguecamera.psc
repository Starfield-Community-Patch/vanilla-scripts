ScriptName DefaultTopicInfoStopDialogueCamera Extends TopicInfo Const default
{ Stop Dialogue Cameras when this Info begins or ends }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property StopCameraOnBegin = True Auto Const
{ If True (default), stop camera when the Info begins. If False then stop camera when the info ends. }

;-- Functions ---------------------------------------

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If StopCameraOnBegin == True
    Game.StopDialogueCamera(False, False)
  EndIf
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If StopCameraOnBegin == False
    Game.StopDialogueCamera(False, False)
  EndIf
EndEvent
