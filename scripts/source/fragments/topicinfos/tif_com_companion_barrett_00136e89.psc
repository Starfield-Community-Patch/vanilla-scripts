ScriptName Fragments:TopicInfos:TIF_COM_Companion_Barrett_00136E89 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property COM_AffinityLevel_2_Affection Auto Const mandatory
GlobalVariable Property COM_AffinityLevel_3_Commitment Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.MakeRomantic()
  kmyQuest.SetAffinityLevel(COM_AffinityLevel_3_Commitment)
  kmyQuest.RomanceSceneEndedRomantic()
EndFunction
