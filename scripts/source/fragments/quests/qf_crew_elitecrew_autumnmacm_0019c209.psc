ScriptName Fragments:Quests:QF_CREW_EliteCrew_AutumnMacM_0019C209 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Autumn Auto Const
Faction Property PotentialCrewFaction Auto Const
Quest Property FC08 Auto Const
Perk Property Crew_PistolCertification Auto Const
Perk Property Crew_Botany Auto Const
Perk Property Crew_Ship_Payloads Auto Const
Perk Property Crew_Sharpshooting Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Autumn.GetActorRef().Enable(False)
  FC08.SetStage(1000)
  FC08.Stop()
  Self.SetStage(1)
  Self.SetStage(50)
  (Autumn.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew()
  Autumn.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  Autumn.GetActorRef().SetFactionRank(PotentialCrewFaction, 1)
  Autumn.GetActorRef().AddPerk(Crew_PistolCertification, False)
  Autumn.GetActorRef().AddPerk(Crew_PistolCertification, False)
  Autumn.GetActorRef().AddPerk(Crew_Botany, False)
  Autumn.GetActorRef().AddPerk(Crew_Sharpshooting, False)
  kmyQuest.SetCostMultAndUpdateCost(0.0)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.RecruitedUnasssigned()
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetStage(800)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetStage(800)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.StartBackstoryTimer()
EndFunction

Function Fragment_Stage_0900_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  Self.SetStage(450)
  kmyQuest.StartBackstoryTimer()
EndFunction
