ScriptName Fragments:TopicInfos:TIF_FC02_00201B23 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property FC02_EmmaReportToBlakeScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  FC02_EmmaReportToBlakeScene.Start()
EndFunction
