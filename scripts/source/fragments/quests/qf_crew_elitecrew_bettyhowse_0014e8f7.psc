ScriptName Fragments:Quests:QF_CREW_EliteCrew_BettyHowse_0014E8F7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Betty Auto Const
Faction Property PotentialCrewFaction Auto Const
Quest Property BettyEncounterQuest Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(1)
  Self.SetStage(50)
  (Betty.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew()
  Betty.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  Betty.GetActorRef().SetFactionRank(PotentialCrewFaction, 1)
  kmyQuest.SetCostMultAndUpdateCost(0.0)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  If !Self.GetStageDone(50)
    kmyQuest.Recruited()
    Self.SetStage(50)
  EndIf
EndFunction

Function Fragment_Stage_0045_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.RecruitedUnasssigned()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  BettyEncounterQuest.SetStage(30)
  If BettyEncounterQuest.GetStageDone(40)
    BettyEncounterQuest.SetStage(2000)
  EndIf
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.StartBackstoryTimer()
EndFunction
