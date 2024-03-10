ScriptName Fragments:Quests:QF_CREW_EliteCrew_AdoringFan_000078DE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property AdoringFan Auto Const
Faction Property PotentialCrewFaction Auto Const
Message Property Trait_UH_WarningMessageEssentialEnd Auto Const mandatory
Scene Property CREW_EliteCrew_AdoringFan_AttackedByPlayer Auto Const mandatory
sq_crewscript Property SQ_Crew Auto Const mandatory
Quest Property TraitUnwantedHero Auto Const mandatory
GlobalVariable Property Trait_UH_FanClubFee Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
MiscObject Property ToiletPaperRoll01Empty Auto Const mandatory
Scene Property CREW_EliteCrew_AdoringFan_Kill01 Auto Const mandatory
Scene Property CREW_EliteCrew_AdoringFan_Kill02 Auto Const mandatory
Scene Property CREW_EliteCrew_AdoringFan_Kill03 Auto Const mandatory
Faction Property AvailableCrewFaction Auto Const mandatory
Faction Property CurrentCrewFaction Auto Const mandatory
RefCollectionAlias Property DisembarkingCrew Auto Const mandatory
RefCollectionAlias Property DismissedCrew Auto Const mandatory
RefCollectionAlias Property CrewGoingToOutposts Auto Const mandatory
ActorValue Property CrewReassignDisabled Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  TraitUnwantedHero.SetStage(75)
  TraitUnwantedHero.SetStage(80)
  TraitUnwantedHero.SetStage(5)
  Self.SetStage(1)
  Self.SetStage(50)
  Actor FanRef = AdoringFan.GetActorRef()
  (FanRef as elitecrewdebugscript).DebugMakeActiveEliteCrew()
  FanRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  AdoringFan.GetActorRef().SetFactionRank(PotentialCrewFaction, 1)
EndFunction

Function Fragment_Stage_0015_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.DismissSceneEnded()
  Actor FanRef = AdoringFan.GetActorRef()
  FanRef.SetEssential(False)
  SQ_Crew.SetRoleUnavailable(FanRef, True)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  Actor FanRef = AdoringFan.GetActorRef()
  kmyQuest.SetCostMultAndUpdateCost(0.0)
  kmyQuest.Recruited()
  FanRef.SetProtected(False)
  FanRef.SetEssential(True)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddItem(ToiletPaperRoll01Empty as Form, 1, False)
  PlayerRef.AddItem(Credits as Form, Trait_UH_FanClubFee.GetValueInt(), False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.SetCostMultAndUpdateCost(0.5)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  Self.SetStage(550)
  kmyQuest.StartBackstoryTimer()
EndFunction

Function Fragment_Stage_0650_Item_00()
  CREW_EliteCrew_AdoringFan_Kill01.Stop()
  CREW_EliteCrew_AdoringFan_Kill02.Stop()
  CREW_EliteCrew_AdoringFan_Kill03.Stop()
EndFunction

Function Fragment_Stage_0666_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  Trait_UH_WarningMessageEssentialEnd.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None)
  kmyQuest.DismissSceneEnded()
  Actor FanRef = AdoringFan.GetActorRef()
  FanRef.SetEssential(False)
  FanRef.SetProtected(True)
  FanRef.RemoveFromFaction(AvailableCrewFaction)
  FanRef.RemoveFromFaction(CurrentCrewFaction)
  FanRef.RemoveFromFaction(PotentialCrewFaction)
  SQ_Crew.SetRoleInactive(FanRef, False, True, False)
  DisembarkingCrew.RemoveRef(FanRef as ObjectReference)
  CrewGoingToOutposts.RemoveRef(FanRef as ObjectReference)
  DismissedCrew.RemoveRef(FanRef as ObjectReference)
  FanRef.SetValue(CrewReassignDisabled, 1.0)
EndFunction

Function Fragment_Stage_0667_Item_00()
  Self.SetStage(9999)
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  Trait_UH_WarningMessageEssentialEnd.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None)
  kmyQuest.DismissSceneEnded()
  Actor FanRef = AdoringFan.GetActorRef()
  FanRef.SetEssential(False)
  FanRef.SetProtected(True)
  FanRef.RemoveFromFaction(AvailableCrewFaction)
  FanRef.RemoveFromFaction(CurrentCrewFaction)
  FanRef.RemoveFromFaction(PotentialCrewFaction)
  SQ_Crew.SetRoleInactive(FanRef, False, True, False)
  DisembarkingCrew.RemoveRef(FanRef as ObjectReference)
  CrewGoingToOutposts.RemoveRef(FanRef as ObjectReference)
  DismissedCrew.RemoveRef(FanRef as ObjectReference)
  FanRef.SetValue(CrewReassignDisabled, 1.0)
  FanRef.SetCrimeFaction(CrimeFactionUC)
EndFunction
