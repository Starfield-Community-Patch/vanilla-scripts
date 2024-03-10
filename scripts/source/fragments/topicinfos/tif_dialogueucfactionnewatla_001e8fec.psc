ScriptName Fragments:TopicInfos:TIF_DialogueUCFactionNewAtla_001E8FEC Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UCR01 Auto Const mandatory
Quest Property UCR03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  UCR03.Start()
EndFunction
