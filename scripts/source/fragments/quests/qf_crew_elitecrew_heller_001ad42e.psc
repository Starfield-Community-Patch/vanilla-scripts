ScriptName Fragments:Quests:QF_CREW_EliteCrew_Heller_001AD42E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Heller Auto Const mandatory
Faction Property PotentialCrewFaction Auto Const mandatory
Quest Property MQ104B Auto Const mandatory
Perk Property Crew_Geology Auto Const
Perk Property Crew_Outpost_Engineering Auto Const
Perk Property Crew_Outpost_Management Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ104B.SetStage(130)
  MQ104B.Stop()
  Self.SetStage(1)
  Self.SetStage(50)
  (Alias_Heller.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew()
  Alias_Heller.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  Actor HellerRef = Alias_Heller.GetActorRef()
  HellerRef.SetFactionRank(PotentialCrewFaction, 1)
  HellerRef.AddPerk(Crew_Geology, False)
  HellerRef.AddPerk(Crew_Outpost_Engineering, False)
  HellerRef.AddPerk(Crew_Outpost_Engineering, False)
  HellerRef.AddPerk(Crew_Outpost_Engineering, False)
  kmyQuest.SetCostMultAndUpdateCost(0.0)
EndFunction

Function Fragment_Stage_0050_Item_00()
  MQ104B.SetStage(125)
EndFunction

Function Fragment_Stage_0050_Item_01()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.RecruitedUnasssigned()
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  Self.SetStage(200)
  kmyQuest.StartBackstoryTimer()
EndFunction
