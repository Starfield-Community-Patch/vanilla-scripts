;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CREW_EliteCrew_SophiaGrac_001499EF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;SetStage on this quest to make Sophia recruitable and already hired
SetStage(1)
SetStage(50)

;Move Sophia to the player, make her the active follower, and remind her about her AI package
(Sophia.GetActorRef() as EliteCrewDebugScript).DebugMakeActiveEliteCrew()
Sophia.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;stage runs on start for non-quest reward ECs
Sophia.GetActorRef().SetFactionRank(PotentialCrewFaction, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Quest __temp = self as Quest
Crew_EliteCrewQuestScript kmyQuest = __temp as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RecruitedUnasssigned()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Quest __temp = self as Quest
Crew_EliteCrewQuestScript kmyQuest = __temp as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SetCostMultAndUpdateCost()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Quest __temp = self as Quest
Crew_EliteCrewQuestScript kmyQuest = __temp as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
;Taskmaster speech discount
kmyquest.SetCostMultAndUpdateCost(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Quest __temp = self as Quest
Crew_EliteCrewQuestScript kmyQuest = __temp as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartBackstoryTimer()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Sophia Auto Const

Faction Property PotentialCrewFaction Auto Const
