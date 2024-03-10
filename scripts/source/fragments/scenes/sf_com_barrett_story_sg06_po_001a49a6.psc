ScriptName Fragments:Scenes:SF_COM_Barrett_Story_SG06_Po_001A49A6 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property COM_AffinityLevel_2_Affection Auto Const mandatory
ActorValue Property COM_WantsToTalk_COM_Barrett_PersonalQuestFollowup Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_20_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_COM_Barrett_PersonalQuestFollowup)
EndFunction
