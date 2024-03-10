ScriptName RIR06_OperativeAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property CrimeFactionNeon_Keyword Auto Const mandatory
Keyword Property CrimeFactionFreestar_Keyword Auto Const mandatory
Keyword Property CrimeFactionUC_Keyword Auto Const mandatory
Keyword Property CrimeFactionParadiso_Keyword Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
Faction Property CrimeFactionFreestar Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Faction Property CrimeFactionParadiso Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasInit()
  Actor Operative = Self.GetActorRef()
  Location MyLocation = Self.GetRef().GetCurrentLocation()
  If MyLocation.HasKeyword(CrimeFactionNeon_Keyword)
    Operative.AddToFaction(CrimeFactionNeon)
    Operative.SetCrimeFaction(CrimeFactionNeon)
  EndIf
  If MyLocation.HasKeyword(CrimeFactionFreestar_Keyword)
    Operative.AddToFaction(CrimeFactionFreestar)
    Operative.SetCrimeFaction(CrimeFactionFreestar)
  EndIf
  If MyLocation.HasKeyword(CrimeFactionUC_Keyword)
    Operative.AddToFaction(CrimeFactionUC)
    Operative.SetCrimeFaction(CrimeFactionUC)
  EndIf
  If MyLocation.HasKeyword(CrimeFactionParadiso_Keyword)
    Operative.AddToFaction(CrimeFactionParadiso)
    Operative.SetCrimeFaction(CrimeFactionParadiso)
  EndIf
EndEvent
