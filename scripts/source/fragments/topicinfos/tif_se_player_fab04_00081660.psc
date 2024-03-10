ScriptName Fragments:TopicInfos:TIF_SE_Player_FAB04_00081660 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  se_fab04_mathcount kmyQuest = Self.GetOwningQuest() as se_fab04_mathcount
  kmyQuest.CountShipParts()
EndFunction
