ScriptName Fragments:Quests:QF_RIR04_002A8319 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Device Auto Const mandatory
ReferenceAlias Property Alias_HoldingCellMarker Auto Const mandatory
MiscObject Property RIR04_Device Auto Const mandatory
ReferenceAlias Property Alias_Imogene Auto Const mandatory
GlobalVariable Property RI_RadiantQuestGiver Auto Const mandatory
Quest Property RI02 Auto Const mandatory
Quest Property RI01 Auto Const mandatory
GlobalVariable Property RIR04_RadiantAvailable Auto Const mandatory
Quest Property RI01_JobAdRadio Auto Const mandatory
Quest Property RIR05 Auto Const mandatory
Location Property CityNeonLocation Auto Const mandatory
LocationAlias Property Alias_ChosenLocation Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
Quest Property LC044 Auto Const mandatory
ReferenceAlias Property Alias_ImogeneQS Auto Const mandatory
Keyword Property RIR05_QuestStartKeyword Auto Const mandatory
ReferenceAlias Property Alias_LocationMarker Auto Const mandatory
ReferenceAlias Property Alias_DevicePlacementTrigger Auto Const mandatory
ReferenceAlias Property Alias_DevicePlanted Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
Keyword Property CrimeFactionNeon_Keyword Auto Const mandatory
ReferenceAlias Property Alias_PlacedDevice Auto Const mandatory
Keyword Property LocTypeStarstationInterior Auto Const mandatory
ReferenceAlias Property Alias_ChosenMapMarker Auto Const mandatory
Keyword Property CrimeFactionUC_Keyword Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Faction Property CrimeFactionFreestar Auto Const mandatory
Keyword Property CrimeFactionFreestar_Keyword Auto Const mandatory
ReferenceAlias Property Alias_LocationMarkerLinkedRef Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
Keyword Property CrimeFactionHopeTown_Keyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  RI01.CompleteQuest()
  RI01_JobAdRadio.Stop()
  RI02.Start()
  RI02.SetStage(600)
  LC044.SetStage(350)
  LC044.SetStage(400)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_ImogeneQS.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  RI01.CompleteQuest()
  RI01_JobAdRadio.Stop()
  RI02.CompleteQuest()
  Self.SetStage(100)
  LC044.SetStage(350)
  LC044.SetStage(400)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_ImogeneQS.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  RI01.CompleteQuest()
  RI01_JobAdRadio.Stop()
  RI02.CompleteQuest()
  Self.SetStage(300)
  LC044.SetStage(350)
  LC044.SetStage(400)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_ImogeneQS.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  RI01.CompleteQuest()
  RI01_JobAdRadio.Stop()
  RI02.CompleteQuest()
  Self.SetStage(100)
  Self.SetStage(150)
  Self.SetStage(200)
  LC044.SetStage(350)
  LC044.SetStage(400)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_Imogene.GetRef().AddItem(Alias_Device.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True)
  Self.SetObjectiveDisplayed(100, True, False)
  RI02.Stop()
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Game.GetPlayer().AddItem(Alias_Device.GetRef() as Form, 1, False)
  Location ChosenLocation = Alias_ChosenLocation.GetLocation()
  If ChosenLocation != CityNeonLocation && !CityNeonLocation.IsChild(ChosenLocation)
    Self.SetObjectiveDisplayed(150, True, False)
    If ChosenLocation.HasKeyword(LocTypeStarstationInterior)
      Self.SetStage(155)
    EndIf
    Alias_ChosenMapMarker.GetRef().SetMarkerVisibleOnStarMap(True)
    Alias_ChosenMapMarker.GetRef().AddToMapScanned(False)
  Else
    Self.SetStage(200)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  ObjectReference TriggerRef = Alias_DevicePlacementTrigger.GetRef()
  ObjectReference MarkerRef = Alias_LocationMarker.GetRef()
  TriggerRef.MoveTo(MarkerRef, 0.0, 0.0, 0.0, True, False)
  Location MyLocation = MarkerRef.GetCurrentLocation()
  If MyLocation.HasKeyword(CrimeFactionNeon_Keyword)
    TriggerRef.SetFactionOwner(CrimeFactionNeon, False)
  EndIf
  If MyLocation.HasKeyword(CrimeFactionFreestar_Keyword) || MyLocation.HasKeyword(CrimeFactionHopeTown_Keyword)
    TriggerRef.SetFactionOwner(CrimeFactionFreestar, False)
  EndIf
  If MyLocation.HasKeyword(CrimeFactionUC_Keyword)
    TriggerRef.SetFactionOwner(CrimeFactionUC, False)
  EndIf
  Alias_LocationMarkerLinkedRef.ForceRefTo(MarkerRef.GetLinkedRef(None))
  Alias_Guard.GetRef().MoveTo(Alias_LocationMarkerLinkedRef.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  Game.GetPlayer().RemoveItem(Alias_Device.GetRef() as Form, 1, False, None)
  Alias_PlacedDevice.GetRef().MoveTo(Alias_LocationMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  RIR05_QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(300, True)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Quest __temp = Self as Quest
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
  kmyQuest.AddFinalValues()
EndFunction
