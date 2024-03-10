ScriptName Fragments:Scenes:SF_COM_SamCoe_QEvent_UnitedC_000DF48E Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property COM_WantsToTalk_UnitedColonies Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_07_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_UnitedColonies)
EndFunction
