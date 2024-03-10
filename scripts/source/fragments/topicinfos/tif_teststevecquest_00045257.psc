ScriptName Fragments:TopicInfos:TIF_TestSteveCQuest_00045257 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  teststevecquestscript kmyQuest = Self.GetOwningQuest() as teststevecquestscript
  kmyQuest.TestGivingFood()
EndFunction
