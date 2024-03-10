ScriptName Fragments:TopicInfos:TIF_FFCydoniaR02_00224AA2 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  ffcydoniar02questscript kmyQuest = Self.GetOwningQuest() as ffcydoniar02questscript
  kmyQuest.CheckItems()
EndFunction
