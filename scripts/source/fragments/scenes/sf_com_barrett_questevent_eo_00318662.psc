ScriptName Fragments:Scenes:SF_COM_Barrett_QuestEvent_Eo_00318662 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property COM_WantsToTalk_UnitedColonies Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_13_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_UnitedColonies)
EndFunction
