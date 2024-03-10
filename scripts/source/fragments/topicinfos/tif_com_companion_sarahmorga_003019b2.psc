ScriptName Fragments:TopicInfos:TIF_COM_Companion_SarahMorga_003019B2 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.MakeRomantic()
EndFunction
