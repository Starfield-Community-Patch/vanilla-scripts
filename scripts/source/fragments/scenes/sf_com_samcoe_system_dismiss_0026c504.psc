;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_COM_SamCoe_System_Dismiss_0026C504 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE com_companionquestscript
com_companionquestscript kmyQuest = GetOwningQuest() as com_companionquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.DismissSceneEnded()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
