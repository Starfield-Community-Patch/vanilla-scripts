ScriptName Fragments:Quests:QF_CREW_EliteCrew_AmeliaEarh_0018E24F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Amelia Auto Const
Faction Property PotentialCrewFaction Auto Const
Quest Property MS02 Auto Const
Perk Property CREW_Ship_Piloting Auto Const
Perk Property Crew_RifleCertification Auto Const
GlobalVariable Property Crew_Elite_CanHireAmelia Auto Const
FormList Property FactionSharedCrimeList_AmeliaOnly Auto Const mandatory
Faction Property CrimeFactionCrucible Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MS02.SetStage(1950)
  MS02.SetStage(2000)
  MS02.Stop()
  Self.SetStage(1)
  Self.SetStage(50)
  Amelia.GetActorRef().EnableNoWait(False)
  Amelia.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  (Amelia.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew()
  Amelia.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  Actor AmeliaRef = Amelia.GetActorRef()
  AmeliaRef.SetFactionRank(PotentialCrewFaction, 1)
  AmeliaRef.AddPerk(CREW_Ship_Piloting, False)
  AmeliaRef.AddPerk(CREW_Ship_Piloting, False)
  AmeliaRef.AddPerk(Crew_RifleCertification, False)
  AmeliaRef.AddPerk(Crew_RifleCertification, False)
  Crew_Elite_CanHireAmelia.Mod(1.0)
  kmyQuest.SetCostMultAndUpdateCost(0.0)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.RecruitedUnasssigned()
EndFunction

Function Fragment_Stage_0050_Item_01()
  FactionSharedCrimeList_AmeliaOnly.AddForm(CrimeFactionCrucible as Form)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.StartBackstoryTimer()
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.StartBackstoryTimer()
EndFunction
