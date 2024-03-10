ScriptName DefaultSurveyTraitQuestScript Extends Quest default
{ default script to set a stage when planet traits are surveyed }

;-- Structs -----------------------------------------
Struct PlanetTraitData
  Keyword PlanetTrait
  Bool traitFound = False
  Int StageToSet = -1
  Int ObjectiveToUpdate = -1
  GlobalVariable discoverCountCurrent
  GlobalVariable discoverCountRequired
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
defaultsurveytraitquestscript:planettraitdata[] Property PlanetTraits Auto Const
{ planet traits this quest is looking for in target system }
sq_parentscript Property SQ_Parent Auto Const mandatory
{ autofill }
LocationAlias Property TargetPlanetLocation Auto Const
{ autofill - optional - planet where player is surveying traits 
    If this is not filled in, surveying a trait on any planet in the target system will qualify }
LocationAlias Property TargetSystemLocation Auto Const
{ autofill - system location where player is looking for planet traits }
Keyword Property LocTypeMajorOrbital Auto Const mandatory
{ autofill - used to check if something is a planet or moon }
Keyword Property LocTypeStarSystem Auto Const mandatory
Int Property PlanetTraitsCompleteStage = -1 Auto Const
{ optional - stage to set when all planet traits have been surveyed }

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_PlanetTraitDiscovered")
  Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_PlanetTraitUpdated")
EndEvent

Event SQ_ParentScript.SQ_PlanetTraitDiscovered(sq_parentscript akSender, Var[] akArgs)
  Self.HandlePlanetTraitEvent(akArgs, True)
EndEvent

Event SQ_ParentScript.SQ_PlanetTraitUpdated(sq_parentscript akSender, Var[] akArgs)
  Self.HandlePlanetTraitEvent(akArgs, False)
EndEvent

Function HandlePlanetTraitEvent(Var[] akArgs, Bool isDiscoveredEvent)
  planet traitPlanet = akArgs[0] as planet
  Keyword discoveredTrait = akArgs[1] as Keyword
  Int discoverCountCurrent = akArgs[2] as Int
  Int discoverCountRequired = akArgs[3] as Int
  If isDiscoveredEvent
    
  EndIf
  planet currentPlanet = Game.GetPlayer().GetCurrentPlanet()
  Actor playerRef = Game.GetPlayer()
  Location currentLocation = playerRef.GetCurrentLocation()
  If currentLocation.IsSameLocation(TargetSystemLocation.GetLocation(), LocTypeStarSystem) && (TargetPlanetLocation == None || currentLocation.IsSameLocation(TargetPlanetLocation.GetLocation(), LocTypeStarSystem))
    Int I = 0
    Int traitsFoundCount = 0
    While I < PlanetTraits.Length
      defaultsurveytraitquestscript:planettraitdata theTraitData = PlanetTraits[I]
      If discoveredTrait == theTraitData.PlanetTrait && theTraitData.traitFound == False
        If theTraitData.ObjectiveToUpdate > -1
          If theTraitData.discoverCountCurrent
            theTraitData.discoverCountCurrent.SetValue(discoverCountCurrent as Float)
            Self.UpdateCurrentInstanceGlobal(theTraitData.discoverCountCurrent)
          EndIf
          If theTraitData.discoverCountRequired
            theTraitData.discoverCountRequired.SetValue(discoverCountRequired as Float)
            Self.UpdateCurrentInstanceGlobal(theTraitData.discoverCountRequired)
          EndIf
          Self.SetObjectiveDisplayed(theTraitData.ObjectiveToUpdate, True, False)
        EndIf
        If isDiscoveredEvent
          theTraitData.traitFound = True
          If theTraitData.StageToSet > -1
            Self.setStage(theTraitData.StageToSet)
          EndIf
        EndIf
      EndIf
      If theTraitData.traitFound
        traitsFoundCount += 1
      EndIf
      I += 1
    EndWhile
    If traitsFoundCount >= PlanetTraits.Length
      If Self.GetStageDone(PlanetTraitsCompleteStage) == False
        Self.setStage(PlanetTraitsCompleteStage)
        Self.UnregisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_PlanetTraitDiscovered")
        Self.UnregisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_PlanetTraitUpdated")
      EndIf
    EndIf
  EndIf
EndFunction
