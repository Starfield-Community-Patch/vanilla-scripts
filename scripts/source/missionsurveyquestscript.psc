ScriptName MissionSurveyQuestScript Extends MissionQuestScript conditional

;-- Variables ---------------------------------------
Float fCheckSurveyPollingTimeSeconds = 15.0 Const
Float fScanObjectTimeSeconds = 1.0 Const
Int iCheckSurveyProgressTimerID = 1 Const
Float lastSurveyPercentage = 0.0
planet targetPlanet

;-- Properties --------------------------------------
Group MissionTypeData
  sq_parentscript Property SQ_Parent Auto Const mandatory
  ReferenceAlias Property PlanetTarget Auto Const mandatory
  { target ref in planet orbit - used to get target Planet }
  Float Property RewardPlanetTraitMult = 1000.0 Auto Const
  { multiplier based on total trait value on planet for total reward }
  Float Property RewardPlanetAbundanceMult = 1000.0 Auto Const
  { multiplier based on total abundance value on planet for total reward }
  Int Property SurveyObjective = 10 Auto Const
  { objective for surveying }
  Int Property MissionAcceptTutorialID = 0 Auto Const
  { tutorial ID when accepting this mission - see SQ_Parent.TutorialMessages }
  Int Property MissionLandTutorialID = 1 Auto Const
  { tutorial ID when landing on the target planet - see SQ_Parent.TutorialMessages }
  GlobalVariable Property RewardXPAmountGlobalActual Auto Const mandatory
  { The actual amount of XP we're going to reward the player with - possibly adjusted by specific mission factors }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  targetPlanet = PlanetTarget.GetRef().GetCurrentPlanet()
  MissionIntValue01.SetValue(0.0)
  Self.UpdateCurrentInstanceGlobal(MissionIntValue01)
  Parent.OnQuestStarted()
EndEvent

Event Actor.OnPlayerScannedObject(Actor akSource, ObjectReference akScannedRef)
  Self.StartTimer(fScanObjectTimeSeconds, iCheckSurveyProgressTimerID)
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == iCheckSurveyProgressTimerID
    Self.CheckSurveyProgress(True)
  EndIf
EndEvent

Function CheckSurveyProgress(Bool restartTimer)
  planet currentPlayerPlanet = Game.GetPlayer().GetCurrentPlanet()
  spaceshipreference playershipRef = PlayerShip.GetShipRef()
  planet currentShipPlanet = playershipRef.GetCurrentPlanet()
  If currentShipPlanet == targetPlanet || currentPlayerPlanet == targetPlanet
    Self.UpdateSurveyPercent()
    If restartTimer && PlayerCompletedQuest == False
      Self.StartTimer(fCheckSurveyPollingTimeSeconds, iCheckSurveyProgressTimerID)
    EndIf
  EndIf
EndFunction

Event Actor.OnPlayerPlanetSurveyComplete(Actor akSource, planet akPlanet)
  spaceshipreference playershipRef = PlayerShip.GetShipRef()
  planet currentShipPlanet = playershipRef.GetCurrentPlanet()
  If currentShipPlanet == targetPlanet
    Self.MissionComplete()
  EndIf
EndEvent

Int Function GetActualReward()
  Float reward = RewardAmountGlobal.GetValue()
  Int planetTraitValue = SQ_Parent.GetPlanetTraitValue(targetPlanet)
  Float planetAbundanceValue = SQ_Parent.GetPlanetAbundanceValue(targetPlanet)
  Int planetRewardValue = planetTraitValue + planetAbundanceValue as Int
  sq_parentscript:planetsurveyslatedata theData = SQ_Parent.GetSurveySlateData(planetRewardValue, 1.0)
  Int XPReward = MissionParent.MissionBoardSurveyXPRewardBase.GetValueInt()
  If theData
    XPReward += theData.RewardXP.GetValueInt()
  EndIf
  RewardXPAmountGlobalActual.SetValueInt(XPReward)
  reward = reward + (planetTraitValue as Float * RewardPlanetTraitMult) + planetAbundanceValue * RewardPlanetAbundanceMult
  Return reward as Int
EndFunction

Function MissionAccepted(Bool bAccepted)
  Parent.MissionAccepted(bAccepted)
  If bAccepted
    SQ_Parent.ShowTutorialMessage(MissionAcceptTutorialID)
    Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerPlanetSurveyComplete")
    Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipScan")
    Self.UpdateSurveyPercent()
  EndIf
EndFunction

Function HandlePlayerShipLanding()
  If PlayerAcceptedQuest
    planet currentShipPlanet = PlayerShip.GetShipRef().GetCurrentPlanet()
    If currentShipPlanet == targetPlanet
      SQ_Parent.ShowTutorialMessage(MissionLandTutorialID)
      Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerScannedObject")
      Self.StartTimer(fCheckSurveyPollingTimeSeconds, iCheckSurveyProgressTimerID)
    EndIf
  EndIf
EndFunction

Function HandlePlayerShipTakeOff()
  Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerScannedObject")
  Self.CancelTimer(iCheckSurveyProgressTimerID)
EndFunction

Event ReferenceAlias.OnShipScan(ReferenceAlias akSource, Location aPlanet, ObjectReference[] aMarkersArray)
  planet currentShipPlanet = PlayerShip.GetShipRef().GetCurrentPlanet()
  If currentShipPlanet == targetPlanet
    Self.CheckSurveyProgress(False)
  EndIf
EndEvent

Function UpdateSurveyPercent()
  Float currentSurveyPercentage = targetPlanet.GetSurveyPercent()
  If currentSurveyPercentage > lastSurveyPercentage
    Float modValue = (currentSurveyPercentage - lastSurveyPercentage) * 100.0
    lastSurveyPercentage = currentSurveyPercentage
    Self.ModObjectiveGlobal(modValue, MissionIntValue01, SurveyObjective, 100.0, True, True, True, False)
  EndIf
EndFunction
