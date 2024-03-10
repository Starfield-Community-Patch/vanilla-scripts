ScriptName Fragments:Scenes:SF_COM_SamCoe_QEvent_Freesta_000DF490 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property COM_WantsToTalk_FreestarCollective Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_10_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_FreestarCollective)
EndFunction
