ScriptName Fragments:Quests:QF_CREW_EliteCrew_OtherPlaye_00187431 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property OtherYou Auto Const
Faction Property PotentialCrewFaction Auto Const
Quest Property MQ401b Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  OtherYou.GetActorRef().Enable(False)
  MQ401b.SetStage(110)
  MQ401b.Stop()
  Self.SetStage(1)
  Self.SetStage(50)
  (OtherYou.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew()
  OtherYou.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  OtherYou.GetActorRef().SetFactionRank(PotentialCrewFaction, 1)
  kmyQuest.SetCostMultAndUpdateCost(0.0)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.RecruitedUnasssigned()
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.StartBackstoryTimer()
EndFunction
