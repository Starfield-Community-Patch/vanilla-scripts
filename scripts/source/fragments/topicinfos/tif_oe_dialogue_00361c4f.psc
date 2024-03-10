ScriptName Fragments:TopicInfos:TIF_OE_Dialogue_00361C4F Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  oe_dialogueavscript kmyQuest = Self.GetOwningQuest() as oe_dialogueavscript
  kmyQuest.SetCanIHelp(akSpeakerRef, 1)
  kmyQuest.ShowMissionTerminalObjective(akSpeakerRef)
EndFunction
