ScriptName Fragments:TopicInfos:TIF_FFCydoniaR02_001E61A7 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  ffcydoniar02questscript kmyQuest = Self.GetOwningQuest() as ffcydoniar02questscript
  kmyQuest.CheckItems()
EndFunction
