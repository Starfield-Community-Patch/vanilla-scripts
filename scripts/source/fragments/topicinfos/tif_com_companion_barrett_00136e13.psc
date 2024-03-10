ScriptName Fragments:TopicInfos:TIF_COM_Companion_Barrett_00136E13 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property COM_AffinityLevel_3_Commitment Auto Const mandatory
ActorValue Property COM_StoryGatesCompleted Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.MakeRomantic()
EndFunction
