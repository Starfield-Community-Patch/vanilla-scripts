ScriptName Fragments:TopicInfos:TIF_CREW_EliteCrew_OtherPlay_000B395D Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property thisQuest Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  If thisQuest.GetStageDone(100) == False && thisQuest.GetStageDone(200) == False
    thisQuest.SetStage(100)
  EndIf
EndFunction
