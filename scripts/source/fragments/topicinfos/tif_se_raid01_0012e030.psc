ScriptName Fragments:TopicInfos:TIF_SE_Raid01_0012E030 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  se_raidscript kmyQuest = Self.GetOwningQuest() as se_raidscript
  kmyQuest.RemoveItems(6)
EndFunction