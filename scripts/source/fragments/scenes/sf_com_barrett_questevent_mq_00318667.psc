ScriptName Fragments:Scenes:SF_COM_Barrett_QuestEvent_MQ_00318667 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property COM_WantsToTalk_MQ204 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_17_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_MQ204)
EndFunction
