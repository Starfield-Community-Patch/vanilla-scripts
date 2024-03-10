ScriptName Fragments:Scenes:SF_COM_SamCoe_QEvent_MQ104A_000D3AED Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property COM_WantsToTalk_MQ104A Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_07_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_MQ104A)
EndFunction
