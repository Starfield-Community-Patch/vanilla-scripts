ScriptName rq_scantraitscript Extends RQScript

;-- Variables ---------------------------------------
sq_parentscript:planettraitdata targetTraitData

;-- Properties --------------------------------------
Group Scan_Properties
  sq_parentscript Property SQ_Parent Auto Const mandatory
  Int Property ObjectiveToDisplayForScanning = 500 Auto Const
  { Objective for scanning }
  Int Property StageToSetOnCompletelyScanned = 600 Auto Const
  { Stage to set when scanning target base object's GetPercentageKnown() >= 1 }
  GlobalVariable Property PercentageScannedTextDisplay Auto Const mandatory
  { Quest instance global to use to display percentage in quest objective }
  ReferenceAlias Property TargetMapMarker Auto Const mandatory
  { target location map marker - use to get planet trait from location }
  ReferenceAlias Property Trait Auto Const mandatory
  { used for text replacement for trait name }
  LocationAlias Property Alias_Planet Auto Const mandatory
  { planet location }
  GlobalVariable Property CreditsRewardRadiantQuestLarge Auto Const mandatory
  { base value for quest reward }
  GlobalVariable Property RQ_ScanQuestReward Auto Const mandatory
  { actual value for quest reward - modified by number of trait overlays needed to discover trait }
  Float Property RewardTraitOverlayMult = 500.0 Auto Const
  { multiplier based on total number of overlays needed to be explored for this trait }
EndGroup


;-- Functions ---------------------------------------

Function QuestStartedSpecific()
  If Self.InitializeScanTarget()
    Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerScannedObject")
    Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_PlanetTraitDiscovered")
    Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_PlanetTraitUpdated")
  Else
    Self.Shutdown()
  EndIf
EndFunction

Bool Function InitializeScanTarget()
  Bool foundTrait = False
  ObjectReference targetRef = TargetMapMarker.GetRef()
  sq_parentscript:planettraitdata theData = SQ_Parent.GetPlanetTraitData(targetRef)
  If theData
    targetTraitData = theData
    If targetRef.GetCurrentPlanet().IsTraitKnown(targetTraitData.PlanetTrait) == False
      foundTrait = True
      Trait.ForceRefTo(targetTraitData.TraitNameMarker)
      Int surveyingBonus = Game.GetPlayer().GetValueInt(SQ_Parent.SurveyingTraitBonus)
      Int discoverCountRequiredActual = Math.Max(1.0, (targetTraitData.discoverCountRequired - surveyingBonus) as Float) as Int
      Location planetLocation = Alias_Planet.GetLocation()
      Int discoverCountCurrent = planetLocation.GetValue(targetTraitData.PlanetTraitAV) as Int
      Self.UpdateScanPercentage(discoverCountCurrent as Float, discoverCountRequiredActual as Float)
      Float reward = CreditsRewardRadiantQuestLarge.GetValue() + (targetTraitData.discoverCountRequired as Float * RewardTraitOverlayMult)
      RQ_ScanQuestReward.SetValueInt(reward as Int)
    EndIf
  EndIf
  Return foundTrait
EndFunction

Event SQ_ParentScript.SQ_PlanetTraitDiscovered(sq_parentscript akSender, Var[] akArgs)
  planet traitPlanet = akArgs[0] as planet
  Keyword discoveredTrait = akArgs[1] as Keyword
  If Self.IsMatchingDiscoveryEvent(discoveredTrait)
    Self.SetStage(StageToSetOnCompletelyScanned)
  EndIf
EndEvent

Event SQ_ParentScript.SQ_PlanetTraitUpdated(sq_parentscript akSender, Var[] akArgs)
  planet traitPlanet = akArgs[0] as planet
  Keyword discoveredTrait = akArgs[1] as Keyword
  If Self.IsMatchingDiscoveryEvent(discoveredTrait)
    Int discoverCountCurrent = akArgs[2] as Int
    Int discoverCountRequired = akArgs[3] as Int
    Self.UpdateScanPercentage(discoverCountCurrent as Float, discoverCountRequired as Float)
  EndIf
EndEvent

Bool Function IsMatchingDiscoveryEvent(Keyword discoveredTrait)
  Bool isMatching = False
  If discoveredTrait == targetTraitData.PlanetTrait
    ObjectReference targetRef = TargetMapMarker.GetRef()
    Actor playerRef = Game.GetPlayer()
    planet currentPlanet = playerRef.GetCurrentPlanet()
    planet targetPlanet = targetRef.GetCurrentPlanet()
    isMatching = currentPlanet == targetPlanet
  EndIf
  Return isMatching
EndFunction

Function UpdateScanPercentage(Float discoverCountCurrent, Float discoverCountRequired)
  Float percentageKnown = discoverCountCurrent / discoverCountRequired
  Int precentAsInt = (percentageKnown * 100.0) as Int
  PercentageScannedTextDisplay.SetValue(precentAsInt as Float)
  Self.UpdateCurrentInstanceGlobal(PercentageScannedTextDisplay)
EndFunction
