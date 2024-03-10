ScriptName Fragments:TopicInfos:TIF_DialogueRedMile_002E0BCF Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFRedMileR01Misc Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  If FFRedMileR01Misc.IsRunning()
    FFRedMileR01Misc.SetStage(110)
  EndIf
EndFunction
