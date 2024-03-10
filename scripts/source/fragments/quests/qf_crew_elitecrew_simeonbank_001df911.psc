ScriptName Fragments:Quests:QF_CREW_EliteCrew_SimeonBank_001DF911 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Simeon Auto Const
Faction Property PotentialCrewFaction Auto Const
Faction Property CrimeFactionUC Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(1)
  Self.SetStage(50)
  (Simeon.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew()
  Simeon.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Simeon.GetActorRef().SetFactionRank(PotentialCrewFaction, 1)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.RecruitedUnasssigned()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.SetCostMultAndUpdateCost(0.5)
EndFunction

Function Fragment_Stage_0100_Item_01()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.SetCostMultAndUpdateCost(1.0)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.StartBackstoryTimer()
EndFunction
