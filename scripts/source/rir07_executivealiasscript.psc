ScriptName RIR07_ExecutiveAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property CrimeFactionNeon_Keyword Auto Const mandatory
Keyword Property CrimeFactionFreestar_Keyword Auto Const mandatory
Keyword Property CrimeFactionUC_Keyword Auto Const mandatory
Keyword Property CrimeFactionParadiso_Keyword Auto Const mandatory
Keyword Property CrimeFactionHopeTown_Keyword Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
Faction Property CrimeFactionFreestar Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Faction Property CrimeFactionParadiso Auto Const mandatory
Outfit Property Outfit_Clothes_Neon_BusinessSuit_02 Auto Const mandatory
Outfit Property Outfit_Clothes_Business_Any_NoRyujin Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasInit()
  Actor Executive = Self.GetActorRef()
  Location MyLocation = Self.GetRef().GetCurrentLocation()
  If MyLocation.HasKeyword(CrimeFactionNeon_Keyword)
    Executive.SetOutfit(Outfit_Clothes_Neon_BusinessSuit_02, False)
    Executive.AddToFaction(CrimeFactionNeon)
    Executive.SetCrimeFaction(CrimeFactionNeon)
  EndIf
  If MyLocation.HasKeyword(CrimeFactionFreestar_Keyword) || MyLocation.HasKeyword(CrimeFactionHopeTown_Keyword)
    Executive.SetOutfit(Outfit_Clothes_Business_Any_NoRyujin, False)
    Executive.AddToFaction(CrimeFactionFreestar)
    Executive.SetCrimeFaction(CrimeFactionFreestar)
  EndIf
  If MyLocation.HasKeyword(CrimeFactionUC_Keyword)
    Executive.SetOutfit(Outfit_Clothes_Business_Any_NoRyujin, False)
    Executive.AddToFaction(CrimeFactionUC)
    Executive.SetCrimeFaction(CrimeFactionUC)
  EndIf
  If MyLocation.HasKeyword(CrimeFactionParadiso_Keyword)
    Executive.SetOutfit(Outfit_Clothes_Business_Any_NoRyujin, False)
    Executive.AddToFaction(CrimeFactionParadiso)
    Executive.SetCrimeFaction(CrimeFactionParadiso)
  EndIf
EndEvent
