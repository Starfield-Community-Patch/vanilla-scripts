ScriptName Fragments:Quests:QF_CREW_EliteCrew_RosieTanne_001D65C0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Rosie Auto Const
Faction Property PotentialCrewFaction Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(1)
  Self.SetStage(50)
  (Rosie.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew()
  Rosie.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Rosie.GetActorRef().SetFactionRank(PotentialCrewFaction, 1)
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
