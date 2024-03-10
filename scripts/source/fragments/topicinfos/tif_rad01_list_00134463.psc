ScriptName Fragments:TopicInfos:TIF_Rad01_LIST_00134463 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  rad01_list_questscript kmyQuest = Self.GetOwningQuest() as rad01_list_questscript
  kmyQuest.PurchasePamphlets()
EndFunction
