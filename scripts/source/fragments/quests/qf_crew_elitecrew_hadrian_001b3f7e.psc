ScriptName Fragments:Quests:QF_CREW_EliteCrew_Hadrian_001B3F7E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property PotentialCrewFaction Auto Const mandatory
ReferenceAlias Property Alias_Hadrian Auto Const mandatory
Quest Property UCR04_MiscPointer Auto Const mandatory
Quest Property DialogueRedDevilsHQ Auto Const
Perk Property Crew_BurnTolerance Auto Const
Perk Property Crew_PainTolerance Auto Const
Perk Property Crew_Xenosociology Auto Const
Keyword Property SQ_Followers_SandboxWhilePlayerLoiters_Allowed Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  DialogueRedDevilsHQ.SetStage(120)
  Self.SetStage(1)
  Self.SetStage(50)
  (Alias_Hadrian.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew()
  Alias_Hadrian.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  Alias_Hadrian.GetActorRef().SetFactionRank(PotentialCrewFaction, 1)
  Alias_Hadrian.GetActorRef().AddPerk(Crew_BurnTolerance, False)
  Alias_Hadrian.GetActorRef().AddPerk(Crew_PainTolerance, False)
  Alias_Hadrian.GetActorRef().AddPerk(Crew_PainTolerance, False)
  Alias_Hadrian.GetActorRef().AddPerk(Crew_Xenosociology, False)
  kmyQuest.SetCostMultAndUpdateCost(0.0)
  Alias_Hadrian.GetRef().AddKeyword(SQ_Followers_SandboxWhilePlayerLoiters_Allowed)
EndFunction

Function Fragment_Stage_0050_Item_00()
  UCR04_MiscPointer.SetStage(1000)
  ObjectReference HadREF = Alias_Hadrian.GetRef()
  If !HadREF.HasKeyword(SQ_Followers_SandboxWhilePlayerLoiters_Allowed)
    HadREF.AddKeyword(SQ_Followers_SandboxWhilePlayerLoiters_Allowed)
  EndIf
EndFunction

Function Fragment_Stage_0050_Item_01()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.RecruitedUnasssigned()
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetStage(410)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.StartBackstoryTimer()
EndFunction
