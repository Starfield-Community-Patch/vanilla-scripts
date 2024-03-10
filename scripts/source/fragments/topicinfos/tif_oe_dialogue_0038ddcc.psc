ScriptName Fragments:TopicInfos:TIF_OE_Dialogue_0038DDCC Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  oe_dialogueavscript kmyQuest = Self.GetOwningQuest() as oe_dialogueavscript
  kmyQuest.SetCanIHelp(akSpeakerRef, 2)
EndFunction
