ScriptName Fragments:TopicInfos:TIF_DialogueUCFactionNewAtla_000066B7 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UCR01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  UCR01.Start()
EndFunction
