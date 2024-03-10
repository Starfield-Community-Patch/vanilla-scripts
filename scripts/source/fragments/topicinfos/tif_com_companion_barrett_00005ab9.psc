ScriptName Fragments:TopicInfos:TIF_COM_Companion_Barrett_00005AB9 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property BQ01_PQ_LockedInReminder Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  BQ01_PQ_LockedInReminder.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None)
EndFunction
