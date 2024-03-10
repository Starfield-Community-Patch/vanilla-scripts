ScriptName Fragments:TopicInfos:TIF_COM_Companion_SarahMorga_00121402 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property COM_WantsToTalk_CrimsonFleet Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_CrimsonFleet)
EndFunction
