ScriptName MissionSurveyTraitScript Extends MissionQuestScript conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group MissionTypeData
  sq_parentscript Property SQ_Parent Auto Const mandatory
  Keyword Property PlanetTrait Auto Const mandatory
  { planet trait this quest is looking for in target system }
  Keyword Property MissionStoryKeywordGetAllPlanets Auto Const mandatory
  { keyword to use to start this quest's "get all planets" quest }
  ReferenceAlias Property TraitCategory Auto Const mandatory
  { holds trait category marker for text replacement }
  Int Property MissionAcceptTutorialID = 2 Auto Const
  { tutorial ID when accepting this mission - see SQ_Parent.TutorialMessages }
  Int Property MissionLandTutorialID = 3 Auto Const
  { tutorial ID when landing on the target planet - see SQ_Parent.TutorialMessages }
  GlobalVariable Property RewardXPAmountGlobalActual Auto Const mandatory
  { The actual amount of XP we're going to reward the player with - possibly adjusted by specific mission factors }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_PlanetTraitDiscovered")
  Parent.OnQuestStarted()
EndEvent

Event SQ_ParentScript.SQ_PlanetTraitDiscovered(sq_parentscript akSender, Var[] akArgs)
  planet traitPlanet = akArgs[0] as planet
  Keyword discoveredTrait = akArgs[1] as Keyword
  Location currentLocation = traitPlanet.GetLocation()
  If currentLocation.IsSameLocation(TargetSystemLocation.GetLocation(), MissionParent.LocTypeStarSystem)
    If discoveredTrait == PlanetTrait
      Self.MissionComplete()
    EndIf
  EndIf
EndEvent

Int Function GetActualReward()
  Float reward = RewardAmountGlobal.GetValue()
  planet targetPlanet = TargetPlanetLocation.GetLocation().GetCurrentPlanet()
  sq_parentscript:planettraitdata theTraitData = SQ_Parent.FindMatchingPlanetTraitForKeyword(PlanetTrait, targetPlanet)
  If theTraitData
    TraitCategory.ForceRefTo(theTraitData.TraitCategoryMarker)
  EndIf
  missiongetallplanetsscript getAllPlanetsQuest = None
  missiongetallplanetsscript[] startedQuests = MissionStoryKeywordGetAllPlanets.SendStoryEventAndWait(TargetPlanetLocation.GetLocation(), None, None, 0, 0) as missiongetallplanetsscript[]
  If startedQuests.Length > 0
    getAllPlanetsQuest = startedQuests[0]
    Int systemTraitValue = getAllPlanetsQuest.GetSystemTraitValue()
    Float systemTraitReward = MissionParent.MissionBoardSurveyTraitSystemValueMult.GetValue() * systemTraitValue as Float
    reward += systemTraitReward
    getAllPlanetsQuest.Stop()
    Int I = 0
    GlobalVariable rewardXP = None
    While I < MissionParent.MissionBoardSurveyTraitXPRewards.Length && rewardXP == None
      missionparentscript:missionboardsurveytraitdata theRewardData = MissionParent.MissionBoardSurveyTraitXPRewards[I]
      If systemTraitValue >= theRewardData.minTraitValue
        rewardXP = theRewardData.rewardXP
      EndIf
      I += 1
    EndWhile
    RewardXPAmountGlobalActual.SetValueInt(rewardXP.GetValueInt())
  EndIf
  Return reward as Int
EndFunction

Function MissionAccepted(Bool bAccepted)
  Parent.MissionAccepted(bAccepted)
  If bAccepted
    SQ_Parent.ShowTutorialMessage(MissionAcceptTutorialID)
  EndIf
EndFunction

Function HandlePlayerShipLanding()
  If PlayerAcceptedQuest
    Location targetSystem = TargetSystemLocation.GetLocation()
    Location currentLocation = PlayerShip.GetShipRef().GetCurrentLocation()
    If currentLocation.IsSameLocation(targetSystem, SQ_Parent.LocTypeStarSystem)
      SQ_Parent.ShowTutorialMessage(MissionLandTutorialID)
    EndIf
  EndIf
EndFunction
