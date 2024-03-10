ScriptName Fragments:TopicInfos:TIF_SE_DB_04_005F18DD Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  se_db_04_script kmyQuest = Self.GetOwningQuest() as se_db_04_script
  kmyQuest.DropLoot()
EndFunction
