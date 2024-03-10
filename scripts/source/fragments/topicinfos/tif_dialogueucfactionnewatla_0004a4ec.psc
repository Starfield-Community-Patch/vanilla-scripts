ScriptName Fragments:TopicInfos:TIF_DialogueUCFactionNewAtla_0004A4EC Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UCR01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  uc01_orientationdisplayquestscript kmyQuest = Self.GetOwningQuest() as uc01_orientationdisplayquestscript
  UCR01.Start()
EndFunction
