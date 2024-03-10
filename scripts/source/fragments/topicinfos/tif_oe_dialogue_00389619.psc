ScriptName Fragments:TopicInfos:TIF_OE_Dialogue_00389619 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  oe_dialogueavscript kmyQuest = Self.GetOwningQuest() as oe_dialogueavscript
  kmyQuest.SetCanIHelp(akSpeakerRef, 5)
EndFunction
