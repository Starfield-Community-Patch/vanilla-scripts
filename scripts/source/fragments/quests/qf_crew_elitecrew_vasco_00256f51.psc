ScriptName Fragments:Quests:QF_CREW_EliteCrew_Vasco_00256F51 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Vasco Auto Const
Faction Property PotentialCrewFaction Auto Const
Quest Property MQ101 Auto Const
Perk Property CREW_Ship_Shields Auto Const
Perk Property CREW_Ship_AneutronicFusion Auto Const
Perk Property Crew_Ship_Weapons_EM Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101.SetStage(312)
  MQ101.Stop()
  Self.SetStage(1)
  Self.SetStage(50)
  (Vasco.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew()
  Vasco.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  Vasco.GetActorRef().SetFactionRank(PotentialCrewFaction, 1)
  Vasco.GetActorRef().AddPerk(CREW_Ship_AneutronicFusion, False)
  Vasco.GetActorRef().AddPerk(CREW_Ship_Shields, False)
  Vasco.GetActorRef().AddPerk(CREW_Ship_Shields, False)
  Vasco.GetActorRef().AddPerk(Crew_Ship_Weapons_EM, False)
  kmyQuest.SetCostMultAndUpdateCost(0.0)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.Recruited()
EndFunction
