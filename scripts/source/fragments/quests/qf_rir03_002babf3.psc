ScriptName Fragments:Quests:QF_RIR03_002BABF3 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RI_RadiantQuestGiver Auto Const mandatory
ReferenceAlias Property Alias_QuestGiver Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
MiscObject Property RIR03_Keycard Auto Const mandatory
ReferenceAlias Property Alias_Imogene Auto Const mandatory
ReferenceAlias Property Alias_Masako Auto Const mandatory
ReferenceAlias Property Alias_Ularu Auto Const mandatory
ReferenceAlias Property Alias_Keycard Auto Const mandatory
Quest Property RI01 Auto Const mandatory
Quest Property RIR01 Auto Const mandatory
Quest Property RIR02 Auto Const mandatory
Quest Property RI01_JobAdRadio Auto Const mandatory
GlobalVariable Property RIR03_RadiantCount Auto Const mandatory
Armor Property Clothes_UCPolice Auto Const mandatory
Armor Property Clothes_BusinessFashionable_Male_01 Auto Const mandatory
Quest Property RI02 Auto Const mandatory
Quest Property LC044 Auto Const mandatory
LocationAlias Property Alias_ChosenLocation Auto Const mandatory
Location Property CityNeonLocation Auto Const mandatory
Quest Property RIR03 Auto Const mandatory
Quest Property RI_RadiantSupport Auto Const mandatory
GlobalVariable Property RI_LastChosenRadiant Auto Const mandatory
Quest Property RI_RadiantPointerQuest Auto Const mandatory
GlobalVariable Property RI07_PlayerHasInternalNeuroamp Auto Const mandatory
Perk Property Manipulation Auto Const mandatory
ReferenceAlias Property Alias_UlaruQS Auto Const mandatory
Quest Property RI08 Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
ReferenceAlias Property Alias_ImogeneQS Auto Const mandatory
ReferenceAlias Property Alias_MasakoQS Auto Const mandatory
ReferenceAlias Property Alias_KeyCardSafe Auto Const mandatory
ReferenceAlias Property Alias_ChosenMapMarker Auto Const mandatory
Keyword Property LocTypeStarstationInterior Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  RI01.CompleteQuest()
  RI01_JobAdRadio.Stop()
  RIR01.CompleteQuest()
  RIR02.SetStage(100)
  RIR02.SetStage(150)
  RIR02.SetStage(200)
  RIR02.SetStage(300)
  LC044.SetStage(350)
  LC044.SetStage(400)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.MoveTo(Alias_ImogeneQS.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.AddItem(Clothes_UCPolice as Form, 1, False)
  PlayerRef.AddItem(Clothes_BusinessFashionable_Male_01 as Form, 1, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  RI01.CompleteQuest()
  RI01_JobAdRadio.Stop()
  RIR01.CompleteQuest()
  RIR02.CompleteQuest()
  Self.SetStage(100)
  LC044.SetStage(350)
  LC044.SetStage(400)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.MoveTo(Alias_ImogeneQS.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.AddItem(Clothes_UCPolice as Form, 1, False)
  PlayerRef.AddItem(Clothes_BusinessFashionable_Male_01 as Form, 1, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  RI01.CompleteQuest()
  RI01_JobAdRadio.Stop()
  Alias_QuestGiver.Clear()
  Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef())
  RIR03_RadiantCount.SetValue(1.0)
  Self.SetStage(100)
  LC044.SetStage(1000)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.MoveTo(Alias_MasakoQS.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.AddItem(Clothes_UCPolice as Form, 1, False)
  PlayerRef.AddItem(Clothes_BusinessFashionable_Male_01 as Form, 1, False)
  PlayerRef.AddPerk(Manipulation, False)
  RI07_PlayerHasInternalNeuroamp.SetValue(1.0)
EndFunction

Function Fragment_Stage_0003_Item_00()
  RI01.CompleteQuest()
  RI01_JobAdRadio.Stop()
  Alias_QuestGiver.Clear()
  Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef())
  RIR03_RadiantCount.SetValue(1.0)
  Self.SetStage(100)
  LC044.SetStage(1000)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.MoveTo(Alias_UlaruQS.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.AddItem(Clothes_UCPolice as Form, 1, False)
  PlayerRef.AddItem(Clothes_BusinessFashionable_Male_01 as Form, 1, False)
  PlayerRef.AddPerk(Manipulation, False)
  RI07_PlayerHasInternalNeuroamp.SetValue(1.0)
EndFunction

Function Fragment_Stage_0004_Item_00()
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  PlayerRef.AddItem(Clothes_UCPolice as Form, 1, False)
  PlayerRef.AddItem(Clothes_BusinessFashionable_Male_01 as Form, 1, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Float fQuestGiver = RI_RadiantQuestGiver.GetValue()
  If fQuestGiver == 0.0
    Alias_QuestGiver.ForceRefTo(Alias_Imogene.GetRef())
  ElseIf fQuestGiver == 1.0
    Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef())
  ElseIf fQuestGiver == 2.0
    Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef())
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True)
  Self.SetObjectiveDisplayed(100, True, False)
  If RIR03_RadiantCount.GetValueInt() == 0
    RIR02.Stop()
  Else
    RI_RadiantPointerQuest.SetStage(10000)
  EndIf
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(110, True)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Quest __temp = Self as Quest
  rir03_questscript kmyQuest = __temp as rir03_questscript
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
  Self.SetObjectiveDisplayed(110, True, False)
  kmyQuest.CheckPlayer()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveDisplayedAtTop(200)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Game.GetPlayer().AddItem(Alias_Keycard.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  If Self.IsObjectiveDisplayed(110)
    Self.SetObjectiveDisplayed(110, False, False)
  EndIf
  RI02.Start()
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.RemoveItem(Alias_Keycard.GetRef() as Form, 1, True, None)
  PlayerRef.AddItem(Alias_KeyCardSafe.GetRef() as Form, 1, True)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.RemoveItem(Alias_KeyCardSafe.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Float fCurrentRadiantCount = RIR03_RadiantCount.GetValue()
  If fCurrentRadiantCount >= 1.0
    (RI_RadiantSupport as ri_radiantsupportquestscript).ResetMBCount()
    RI_LastChosenRadiant.SetValue(1.0)
    RIR03_RadiantCount.SetValue(fCurrentRadiantCount + 1.0)
    Self.Stop()
  EndIf
  If fCurrentRadiantCount == 0.0
    RI02.SetStage(100)
    RIR03_RadiantCount.SetValue(1.0)
  EndIf
EndFunction

Function Fragment_Stage_9000_Item_00()
  Quest __temp = Self as Quest
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
  kmyQuest.AddFinalValues()
EndFunction
