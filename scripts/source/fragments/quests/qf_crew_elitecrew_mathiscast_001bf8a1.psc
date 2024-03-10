ScriptName Fragments:Quests:QF_CREW_EliteCrew_MathisCast_001BF8A1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Mathis Auto Const
Faction Property PotentialCrewFaction Auto Const
Quest Property CF08_Fleet Auto Const
Perk Property Crew_WeightLifting Auto Const
Perk Property Crew_Incapacitation Auto Const
Perk Property Crew_ParticleBeams Auto Const mandatory
Faction Property CrewElite_PersonalCrimeFaction_MathisCastillo Auto Const mandatory
Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
Perk Property Crew_Ballistics Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  CF08_Fleet.SetStage(2000)
  CF08_Fleet.Stop()
  Self.SetStage(1)
  Self.SetStage(50)
  (Mathis.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew()
  Mathis.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  Actor MathisRef = Mathis.GetActorRef()
  MathisRef.SetFactionRank(PotentialCrewFaction, 1)
  MathisRef.AddPerk(Crew_WeightLifting, False)
  MathisRef.AddPerk(Crew_Ballistics, False)
  MathisRef.AddPerk(Crew_Incapacitation, False)
  MathisRef.AddPerk(Crew_Incapacitation, False)
  kmyQuest.SetCostMultAndUpdateCost(0.0)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.RecruitedUnasssigned()
EndFunction

Function Fragment_Stage_0050_Item_01()
  Actor MathisRef = Mathis.GetActorRef()
  MathisRef.AddtoFaction(CrewElite_PersonalCrimeFaction_MathisCastillo)
  MathisRef.RemovefromFaction(CrimeFactionCrimsonFleet)
  MathisRef.SetCrimeFaction(CrewElite_PersonalCrimeFaction_MathisCastillo)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.StartBackstoryTimer()
EndFunction
