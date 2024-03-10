ScriptName Fragments:Quests:QF_CREW_EliteCrew_Lin_001A8D9C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Lin Auto Const
Faction Property PotentialCrewFaction Auto Const
Quest Property MQ104B Auto Const mandatory
Perk Property Crew_Outpost_Management Auto Const
Perk Property Crew_WeightLifting Auto Const
Perk Property Crew_Demolitions Auto Const
ReferenceAlias Property Alias_LinNoSupervisor Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ104B.SetStage(110)
  MQ104B.Stop()
  Self.SetStage(1)
  Self.SetStage(50)
  (Lin.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew()
  Lin.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  Lin.GetActorRef().SetFactionRank(PotentialCrewFaction, 1)
  Lin.GetActorRef().AddPerk(Crew_Demolitions, False)
  Lin.GetActorRef().AddPerk(Crew_Outpost_Management, False)
  Lin.GetActorRef().AddPerk(Crew_Outpost_Management, False)
  Lin.GetActorRef().AddPerk(Crew_Outpost_Management, False)
  kmyQuest.SetCostMultAndUpdateCost(0.0)
EndFunction

Function Fragment_Stage_0050_Item_00()
  MQ104B.SetStage(112)
  Alias_LinNoSupervisor.ForceRefTo(Lin.GetRef())
EndFunction

Function Fragment_Stage_0050_Item_01()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.RecruitedUnasssigned()
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.StartBackstoryTimer()
EndFunction
