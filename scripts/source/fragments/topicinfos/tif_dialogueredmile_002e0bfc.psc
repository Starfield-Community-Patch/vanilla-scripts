ScriptName Fragments:TopicInfos:TIF_DialogueRedMile_002E0BFC Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFRedMileR01Misc Auto Const mandatory
Quest Property FFRedMileR01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  If !FFRedMileR01.IsRunning() && !FFRedMileR01Misc.IsRunning()
    FFRedMileR01Misc.Start()
  EndIf
EndFunction
