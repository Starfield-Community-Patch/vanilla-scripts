ScriptName PlanetTraitEnableHandler Extends ObjectReference

;-- Variables ---------------------------------------
Keyword ChosenTraitToEnable

;-- Properties --------------------------------------
Keyword Property PlanetTrait13GaseousFont Auto Const mandatory
Keyword Property PlanetTrait17PrimordialNetwork Auto Const mandatory
planet Property TestPlanet Auto mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Self.HandleTraitEnabling()
EndEvent

Function HandleTraitEnabling()
  Keyword[] ThisPlanetsTraits = None
  Keyword[] MatchingTraitsWithThisPlanet = new Keyword[0]
  If ChosenTraitToEnable == None
    ThisPlanetsTraits = Self.GetCurrentPlanet().GetKeywordTypeList(44)
    Int CountMatchingTraits = 0
    While CountMatchingTraits < ThisPlanetsTraits.Length
      Keyword currentKeyword = ThisPlanetsTraits[CountMatchingTraits]
      If Self.GetRefsLinkedToMe(currentKeyword, None).Length > 0
        MatchingTraitsWithThisPlanet.add(currentKeyword, 1)
      EndIf
      CountMatchingTraits += 1
    EndWhile
    If MatchingTraitsWithThisPlanet.Length > 1
      Int RandomlySelectedTrait = Utility.RandomInt(MatchingTraitsWithThisPlanet.Length, 100)
      ChosenTraitToEnable = MatchingTraitsWithThisPlanet[RandomlySelectedTrait]
    Else
      Self.GetRefsLinkedToMe(MatchingTraitsWithThisPlanet[0], None)[0].EnableNoWait(False)
    EndIf
  EndIf
EndFunction
