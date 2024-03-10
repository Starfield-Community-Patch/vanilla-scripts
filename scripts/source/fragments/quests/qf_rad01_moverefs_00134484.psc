ScriptName Fragments:Quests:QF_Rad01_MoveRefs_00134484 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property CrimeFactionUC Auto Const
Location Property CityCydoniaLocation Auto Const
Location Property StationTheDenLocation Auto Const
Location Property CityNewAtlantisLocation Auto Const
Location Property SettleHopeTownPitStopLocation Auto Const
Faction Property CrimeFactionFreestar Auto Const
Location Property CityAkilaCityStonerootInnLocation Auto Const
Location Property CityAkilaCityTheRockLocation Auto Const
Location Property SettleRedMileLocation Auto Const
Faction Property CrimeFactionRedMile Auto Const
ReferenceAlias Property Alias_Secretary Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  If CityCydoniaLocation == Alias_Secretary.GetActorRef().GetCurrentLocation()
    Alias_Secretary.GetActorRef().SetCrimeFaction(CrimeFactionUC)
  ElseIf StationTheDenLocation == Alias_Secretary.GetActorRef().GetCurrentLocation()
    Alias_Secretary.GetActorRef().SetCrimeFaction(CrimeFactionUC)
  ElseIf CityNewAtlantisLocation == Alias_Secretary.GetActorRef().GetCurrentLocation()
    Alias_Secretary.GetActorRef().SetCrimeFaction(CrimeFactionUC)
  ElseIf SettleHopeTownPitStopLocation == Alias_Secretary.GetActorRef().GetCurrentLocation()
    Alias_Secretary.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
  ElseIf CityAkilaCityStonerootInnLocation == Alias_Secretary.GetActorRef().GetCurrentLocation()
    Alias_Secretary.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
  ElseIf CityAkilaCityTheRockLocation == Alias_Secretary.GetActorRef().GetCurrentLocation()
    Alias_Secretary.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
  ElseIf SettleRedMileLocation == Alias_Secretary.GetActorRef().GetCurrentLocation()
    Alias_Secretary.GetActorRef().SetCrimeFaction(CrimeFactionRedMile)
  EndIf
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.stop()
EndFunction
