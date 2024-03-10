ScriptName RIR04_GuardAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Outfit Property Outfit_Clothes_Neon_Security_NoHelmet Auto Const mandatory
Outfit Property Outfit_Clothes_Akila_Security_NoHeadwear Auto Const mandatory
Outfit Property Outfit_Clothes_NewAtlantis_Security_NoHelmet Auto Const mandatory
Outfit Property Outfit_Clothes_Security_Guard_01_with_Helmet Auto Const mandatory
Outfit Property Outfit_Freestar_Militia_NoHat Auto Const mandatory
Keyword Property CrimeFactionNeon_Keyword Auto Const mandatory
Keyword Property CrimeFactionAkilaCity_Keyword Auto Const mandatory
Keyword Property CrimeFactionFreestar_Keyword Auto Const mandatory
Keyword Property CrimeFactionUC_Keyword Auto Const mandatory
Keyword Property CrimeFactionHopeTown_Keyword Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
Faction Property CrimeFactionFreestar Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Faction Property GuardFaction Auto Const mandatory
LocationAlias Property ChosenLocation Auto Const mandatory
Message Property RIR04_SecurityGuardName_Neon Auto Const mandatory
Message Property RIR04_SecurityGuardName_AkilaCity Auto Const mandatory
Message Property RIR04_SecurityGuardName_Freestar Auto Const mandatory
Message Property RIR04_SecurityGuardName_UC Auto Const mandatory
Message Property RIR04_SecurityGuardName_HopeTown Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Actor GuardActor = Self.GetActorRef()
  Location MyLocation = ChosenLocation.GetLocation()
  If MyLocation.HasKeyword(CrimeFactionNeon_Keyword)
    GuardActor.SetOutfit(Outfit_Clothes_Neon_Security_NoHelmet, False)
    GuardActor.AddToFaction(CrimeFactionNeon)
    GuardActor.SetCrimeFaction(CrimeFactionNeon)
    GuardActor.SetOverrideName(RIR04_SecurityGuardName_Neon)
  EndIf
  If MyLocation.HasKeyword(CrimeFactionAkilaCity_Keyword)
    GuardActor.SetOutfit(Outfit_Clothes_Akila_Security_NoHeadwear, False)
    GuardActor.AddToFaction(CrimeFactionFreestar)
    GuardActor.SetCrimeFaction(CrimeFactionFreestar)
    GuardActor.SetOverrideName(RIR04_SecurityGuardName_AkilaCity)
  EndIf
  If MyLocation.HasKeyword(CrimeFactionFreestar_Keyword)
    GuardActor.SetOutfit(Outfit_Freestar_Militia_NoHat, False)
    GuardActor.AddToFaction(CrimeFactionFreestar)
    GuardActor.SetCrimeFaction(CrimeFactionFreestar)
    GuardActor.SetOverrideName(RIR04_SecurityGuardName_Freestar)
  EndIf
  If MyLocation.HasKeyword(CrimeFactionUC_Keyword)
    GuardActor.SetOutfit(Outfit_Clothes_NewAtlantis_Security_NoHelmet, False)
    GuardActor.AddToFaction(CrimeFactionUC)
    GuardActor.SetCrimeFaction(CrimeFactionUC)
    GuardActor.SetOverrideName(RIR04_SecurityGuardName_UC)
  EndIf
  If MyLocation.HasKeyword(CrimeFactionHopeTown_Keyword)
    GuardActor.SetOutfit(Outfit_Freestar_Militia_NoHat, False)
    GuardActor.AddToFaction(CrimeFactionFreestar)
    GuardActor.SetCrimeFaction(CrimeFactionFreestar)
    GuardActor.SetOverrideName(RIR04_SecurityGuardName_HopeTown)
  EndIf
  GuardActor.AddToFaction(GuardFaction)
EndEvent
