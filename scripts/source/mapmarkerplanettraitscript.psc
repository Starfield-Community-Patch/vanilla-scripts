ScriptName MapMarkerPlanetTraitScript Extends ObjectReference
{ temp script for showing message about a planet trait when this location is entered }

;-- Variables ---------------------------------------
Bool TraitOverrideInitDone = False

;-- Properties --------------------------------------
sq_parentscript Property SQ_Parent Auto Const mandatory
{ use to get planet trait data }
Int Property DiscoveryTimerID = 1 Auto Const
Float Property DiscoveryTimeSeconds = 0.5 Auto Const
{ how long after discovery to show the message }
Keyword Property LocationTraitOverride Auto hidden
{ set by HandleTraitEnabling, if this map marker has any trait enable linked refs
    if this is set, use this trait instead of looking for a trait keyword on the Location }

;-- Functions ---------------------------------------

Event OnLoad()
  If TraitOverrideInitDone == False
    Self.HandleTraitEnabling()
  EndIf
  sq_parentscript:planettraitdata theData = SQ_Parent.GetPlanetTraitData(Self as ObjectReference)
  If theData
    Location traitLocation = Self.GetCurrentLocation()
    planet planetToCheck = Self.GetCurrentPlanet()
    If planetToCheck.IsTraitKnown(theData.PlanetTrait)
      traitLocation.SetExplored(True)
    Else
      Int scanCountNeeded = traitLocation.GetRefTypeAliveCount(SQ_Parent.PlanetTraitScanTargetLocRef)
      traitLocation.SetValue(SQ_Parent.PlanetTraitLocationScanCountRequired, scanCountNeeded as Float)
    EndIf
  EndIf
EndEvent

Event OnMapMarkerDiscovered()
  Self.StartTimer(DiscoveryTimeSeconds, DiscoveryTimerID)
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == DiscoveryTimerID
    SQ_Parent.DiscoverMatchingPlanetTraits(Self as ObjectReference, False)
  EndIf
EndEvent

Function HandleTraitEnabling()
  If TraitOverrideInitDone == False
    If LocationTraitOverride == None
      Keyword[] matchingTraits = new Keyword[0]
      Keyword[] planetTraits = Self.GetCurrentPlanet().GetKeywordTypeList(SQ_Parent.KeywordType_PlanetTrait)
      Int planetTraitsIndex = 0
      While planetTraitsIndex < planetTraits.Length
        Keyword currentKeyword = planetTraits[planetTraitsIndex]
        If Self.GetRefsLinkedToMe(currentKeyword, None).Length > 0
          matchingTraits.add(currentKeyword, 1)
        EndIf
        planetTraitsIndex += 1
      EndWhile
      If matchingTraits.Length > 0
        Int traitToEnable = Utility.RandomInt(0, matchingTraits.Length - 1)
        LocationTraitOverride = matchingTraits[traitToEnable]
        Self.GetRefsLinkedToMe(LocationTraitOverride, None)[0].EnableNoWait(False)
      EndIf
    EndIf
  EndIf
  TraitOverrideInitDone = True
EndFunction
