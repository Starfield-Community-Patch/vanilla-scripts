ScriptName Fragments:Scenes:SF_COM_SarahMorgan_QuestEven_001D5962 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property COM_WantsToTalk_MQ106 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_15_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_MQ106)
EndFunction
