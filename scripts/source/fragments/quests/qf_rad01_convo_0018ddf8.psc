ScriptName Fragments:Quests:QF_Rad01_Convo_0018DDF8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Actor1 Auto Const mandatory
ReferenceAlias Property Alias_Actor2 Auto Const mandatory
Quest Property Rad01_LIST Auto Const mandatory
MiscObject Property Credits Auto Const
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
GlobalVariable Property Rad01_Convo_Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  If Rad01_LIST.GetStageDone(290)
    Self.SetObjectiveDisplayed(100, True, False)
  Else
    Rad01_LIST.SetStage(250)
  EndIf
  If CityCydoniaLocation == Alias_Actor1.GetActorRef().GetCurrentLocation()
    Alias_Actor1.GetActorRef().SetCrimeFaction(CrimeFactionUC)
    Alias_Actor2.GetActorRef().SetCrimeFaction(CrimeFactionUC)
  ElseIf StationTheDenLocation == Alias_Actor1.GetActorRef().GetCurrentLocation()
    Alias_Actor1.GetActorRef().SetCrimeFaction(CrimeFactionUC)
    Alias_Actor2.GetActorRef().SetCrimeFaction(CrimeFactionUC)
  ElseIf CityNewAtlantisLocation == Alias_Actor1.GetActorRef().GetCurrentLocation()
    Alias_Actor1.GetActorRef().SetCrimeFaction(CrimeFactionUC)
    Alias_Actor2.GetActorRef().SetCrimeFaction(CrimeFactionUC)
  ElseIf SettleHopeTownPitStopLocation == Alias_Actor1.GetActorRef().GetCurrentLocation()
    Alias_Actor1.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
    Alias_Actor2.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
  ElseIf CityAkilaCityStonerootInnLocation == Alias_Actor1.GetActorRef().GetCurrentLocation()
    Alias_Actor1.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
    Alias_Actor2.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
  ElseIf CityAkilaCityTheRockLocation == Alias_Actor1.GetActorRef().GetCurrentLocation()
    Alias_Actor1.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
    Alias_Actor2.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
  ElseIf SettleRedMileLocation == Alias_Actor1.GetActorRef().GetCurrentLocation()
    Alias_Actor1.GetActorRef().SetCrimeFaction(CrimeFactionRedMile)
    Alias_Actor2.GetActorRef().SetCrimeFaction(CrimeFactionRedMile)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Rad01_LIST.SetStage(299)
  If Self.GetStageDone(151)
    Game.getplayer().removeitem(Credits as Form, Rad01_Convo_Credits.GetValueInt(), False, None)
  EndIf
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveFailed(100, True)
  Rad01_LIST.SetStage(500)
EndFunction

Function Fragment_Stage_0900_Item_00()
  If Self.IsObjectiveCompleted(100) == False
    Self.SetObjectiveSkipped(100)
  EndIf
  Alias_Actor1.TryToDisable()
  Alias_Actor2.TryToDisable()
  Self.Stop()
EndFunction
