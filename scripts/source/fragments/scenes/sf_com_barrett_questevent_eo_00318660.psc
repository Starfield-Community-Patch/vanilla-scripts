ScriptName Fragments:Scenes:SF_COM_Barrett_QuestEvent_Eo_00318660 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property COM_WantsToTalk_CrimsonFleet Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_05_Begin()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_CrimsonFleet)
EndFunction

Function Fragment_Phase_10_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_CrimsonFleet)
EndFunction
