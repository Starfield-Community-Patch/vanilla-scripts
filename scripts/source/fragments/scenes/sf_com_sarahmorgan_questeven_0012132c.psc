;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_COM_SarahMorgan_QuestEven_0012132C Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_10_Begin
Function Fragment_Phase_10_Begin()
;BEGIN AUTOCAST TYPE com_companionquestscript
com_companionquestscript kmyQuest = GetOwningQuest() as com_companionquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_CrimsonFleet)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_21_End
Function Fragment_Phase_21_End()
;BEGIN AUTOCAST TYPE com_companionquestscript
com_companionquestscript kmyQuest = GetOwningQuest() as com_companionquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_CrimsonFleet)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property COM_WantsToTalk_CrimsonFleet Auto Const Mandatory
