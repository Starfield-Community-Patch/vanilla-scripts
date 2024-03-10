ScriptName Fragments:Quests:QF_RIR05_002A3945 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RI01 Auto Const mandatory
Quest Property RIR04 Auto Const mandatory
ReferenceAlias Property Alias_Imogene Auto Const mandatory
ReferenceAlias Property Alias_PrototypeSchematic Auto Const mandatory
GlobalVariable Property RIR05_RadiantCount Auto Const mandatory
Quest Property RI03 Auto Const mandatory
MiscObject Property RIR05_Schematic Auto Const mandatory
Quest Property LC044 Auto Const mandatory
Quest Property RI01_JobAdRadio Auto Const mandatory
ReferenceAlias Property Alias_ImogeneQS Auto Const mandatory
ReferenceAlias Property Alias_MasakoQS Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
ReferenceAlias Property Alias_ChosenContainer Auto Const mandatory
LocationAlias Property Alias_ChosenLocation Auto Const mandatory
Keyword Property LocTypeStarstationInterior Auto Const mandatory
Location Property CityNeonLocation Auto Const mandatory
LocationAlias Property Alias_ChosenLocation_System Auto Const mandatory
Keyword Property LocSystemFactionFreestarCollective Auto Const mandatory
Keyword Property LocSystemFactionUnitedColonies Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Faction Property CrimeFactionFreestar Auto Const mandatory
ReferenceAlias Property Alias_ChosenMapMarker Auto Const mandatory
Perk Property Manipulation Auto Const mandatory
GlobalVariable Property RI_RadiantQuestGiver Auto Const mandatory
ReferenceAlias Property Alias_Masako Auto Const mandatory
Quest Property RI_Support Auto Const mandatory
Quest Property RI08 Auto Const mandatory
GlobalVariable Property RI_LastChosenRadiant Auto Const mandatory
ReferenceAlias Property Alias_QuestGiver Auto Const mandatory
Quest Property RI_RadiantPointerQuest Auto Const mandatory
ReferenceAlias Property Alias_ChosenContainerRef Auto Const mandatory
MiscObject Property Digipick Auto Const mandatory
LocationAlias Property Alias_TridentLuxuryLinesLocation Auto Const mandatory
Keyword Property LocTypeRadiantsNotAllowed Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  RI01_JobAdRadio.Stop()
  RI01.CompleteQuest()
  RIR04.Start()
  RIR04.SetStage(100)
  RIR04.SetStage(200)
  RIR04.SetStage(300)
  LC044.SetStage(350)
  LC044.SetStage(400)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_ImogeneQS.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  RI01_JobAdRadio.Stop()
  RI01.CompleteQuest()
  Self.SetStage(100)
  LC044.SetStage(350)
  LC044.SetStage(400)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_ImogeneQS.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  RI01_JobAdRadio.Stop()
  RI01.CompleteQuest()
  Self.SetStage(100)
  LC044.SetStage(1000)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_MasakoQS.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddPerk(Manipulation, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Float fQuestGiver = RI_RadiantQuestGiver.GetValue()
  If fQuestGiver == 0.0
    Alias_QuestGiver.ForceRefTo(Alias_Imogene.GetRef())
  ElseIf fQuestGiver == 1.0
    Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef())
  EndIf
  ObjectReference ContainerRef = Alias_ChosenContainer.GetRef()
  ContainerRef.Enable(False)
  ContainerRef.Lock(True, False, True)
  ContainerRef.SetLockLevel(25)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True)
  Self.SetObjectiveDisplayed(100, True, False)
  If RIR05_RadiantCount.GetValueInt() == 0
    RIR04.Stop()
  Else
    RI_RadiantPointerQuest.SetStage(10000)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_01()
  Self.SetObjectiveDisplayed(100, True, False)
  If RI_RadiantPointerQuest.IsRunning()
    RI_RadiantPointerQuest.SetStage(10000)
  EndIf
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True)
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
  Game.GetPlayer().AddItem(Digipick as Form, 2, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveCompleted(155, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Alias_ChosenContainer.GetRef().AddAliasedItem(RIR05_Schematic as Form, Alias_PrototypeSchematic as Alias, 1, True)
  Location ChosenSystem = Alias_ChosenLocation_System.GetLocation()
  ObjectReference Schematic = Alias_PrototypeSchematic.GetRef()
  If ChosenSystem.HasKeyword(LocSystemFactionUnitedColonies)
    Schematic.SetFactionOwner(CrimeFactionUC, False)
  ElseIf ChosenSystem.HasKeyword(LocSystemFactionFreestarCollective)
    Schematic.SetFactionOwner(CrimeFactionFreestar, False)
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  Alias_ChosenContainer.Clear()
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.RemoveItem(RIR05_Schematic as Form, 99, True, None)
  PlayerRef.AddAliasedItem(RIR05_Schematic as Form, Alias_PrototypeSchematic as Alias, 1, True)
EndFunction

Function Fragment_Stage_0310_Item_00()
  Game.GetPlayer().RemoveItem(RIR05_Schematic as Form, 99, False, None)
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Alias_ChosenContainerRef.GetRef().Disable(False)
  Float fCurrentRadiantCount = RIR05_RadiantCount.GetValue()
  If fCurrentRadiantCount >= 1.0
    (RI_Support as ri_radiantsupportquestscript).ResetMBCount()
    RI_LastChosenRadiant.SetValue(2.0)
    RIR05_RadiantCount.SetValue(fCurrentRadiantCount + 1.0)
    Self.Stop()
  EndIf
  If fCurrentRadiantCount == 0.0
    RI03.SetStage(100)
    RIR05_RadiantCount.SetValue(1.0)
    Alias_TridentLuxuryLinesLocation.GetLocation().RemoveKeyword(LocTypeRadiantsNotAllowed)
  EndIf
EndFunction

Function Fragment_Stage_9000_Item_00()
  Quest __temp = Self as Quest
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
  kmyQuest.AddFinalValues()
EndFunction
