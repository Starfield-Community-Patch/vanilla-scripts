ScriptName Fragments:Quests:QF_CREW_EliteCrew_RafaelAgue_001933D5 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Rafael Auto Const
Faction Property PotentialCrewFaction Auto Const
Quest Property MQ207C Auto Const
Quest Property MQ207C_RafaelPostquest Auto Const mandatory
Perk Property Crew_Outpost_Engineering Auto Const
Perk Property CREW_Ship_StarshipEngineering Auto Const
Perk Property Crew_Outpost_AneutronicFusion Auto Const
Perk Property Crew_Scavenging Auto Const
Perk Property Crew_Outpost_Management Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Rafael.GetActorRef().Enable(False)
  MQ207C.SetStage(929)
  MQ207C.Stop()
  Self.SetStage(1)
  Self.SetStage(50)
  (Rafael.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew()
  Rafael.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  Actor RafaelRef = Rafael.GetActorRef()
  RafaelRef.SetFactionRank(PotentialCrewFaction, 1)
  RafaelRef.Enable(False)
  RafaelRef.AddPerk(Crew_Outpost_Engineering, False)
  RafaelRef.AddPerk(CREW_Ship_StarshipEngineering, False)
  RafaelRef.AddPerk(CREW_Ship_StarshipEngineering, False)
  RafaelRef.AddPerk(Crew_Outpost_Management, False)
  RafaelRef.SetEssential(True)
  kmyQuest.SetCostMultAndUpdateCost(0.0)
EndFunction

Function Fragment_Stage_0020_Item_00()
  MQ207C_RafaelPostquest.SetStage(220)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.RecruitedUnasssigned()
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetStage(100)
  Self.SetStage(700)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetStage(100)
  Self.SetStage(700)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.StartBackstoryTimer()
EndFunction
