;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ302_100_Space_InitialCo_00187143 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_07_End
Function Fragment_Phase_07_End()
;BEGIN AUTOCAST TYPE LC165SpaceQuestScript
LC165SpaceQuestScript kmyQuest = GetOwningQuest() as LC165SpaceQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.ForceCloakStarbornShips()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_09_End
Function Fragment_Phase_09_End()
;BEGIN AUTOCAST TYPE LC165SpaceQuestScript
LC165SpaceQuestScript kmyQuest = GetOwningQuest() as LC165SpaceQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.ForceCloakStarbornShips()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
