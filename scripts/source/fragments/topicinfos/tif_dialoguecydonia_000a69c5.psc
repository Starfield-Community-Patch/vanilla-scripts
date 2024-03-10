ScriptName Fragments:TopicInfos:TIF_DialogueCydonia_000A69C5 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  dialoguecydoniaquestscript kmyQuest = Self.GetOwningQuest() as dialoguecydoniaquestscript
  kmyQuest.HorusAid()
EndFunction
