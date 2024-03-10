ScriptName Fragments:TopicInfos:TIF_OE_Dialogue_000A662D Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  oe_dialogueavscript kmyQuest = Self.GetOwningQuest() as oe_dialogueavscript
  kmyQuest.SetTopic04(akSpeakerRef, 4)
EndFunction
