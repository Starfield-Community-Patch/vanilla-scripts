ScriptName Fragments:Quests:QF_RIR07_0017AA9A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RIR07_Bribe Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_RivalExecutive Auto Const mandatory
ReferenceAlias Property Alias_MasakoOfficeQS Auto Const mandatory
Quest Property LC044 Auto Const mandatory
Faction Property RyujinIndustriesFaction Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
Perk Property Manipulation Auto Const mandatory
Perk Property Crippling Auto Const mandatory
Perk Property Intimidation Auto Const mandatory
Perk Property SniperCertification Auto Const mandatory
GlobalVariable Property RI08_MasakoRemainedCEO Auto Const mandatory
ReferenceAlias Property Alias_Masako Auto Const mandatory
ReferenceAlias Property Alias_QuestGiver Auto Const mandatory
ReferenceAlias Property Alias_Ularu Auto Const mandatory
ReferenceAlias Property Alias_UlaruOfficeQS Auto Const mandatory
Quest Property RI_Support Auto Const mandatory
GlobalVariable Property RI_LastChosenRadiant Auto Const mandatory
LocationAlias Property Alias_ChosenLocation Auto Const mandatory
Keyword Property LocTypeStarStation Auto Const mandatory
Location Property CityNeonLocation Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_ChosenLocation_MapMarker Auto Const mandatory
Quest Property RI_RadiantPointerQuest Auto Const mandatory
GlobalVariable Property RIR07_RadiantCount Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  LC044.SetStage(1000)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddToFaction(RyujinIndustriesFaction)
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.AddPerk(Manipulation, False)
  PlayerRef.AddPerk(Crippling, False)
  PlayerRef.AddPerk(Intimidation, False)
  PlayerRef.AddPerk(SniperCertification, False)
  PlayerRef.AddItem(Credits as Form, 10000, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  RI08_MasakoRemainedCEO.SetValue(1.0)
  Game.GetPlayer().MoveTo(Alias_MasakoOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(0)
  Self.SetStage(10)
EndFunction

Function Fragment_Stage_0002_Item_00()
  RI08_MasakoRemainedCEO.SetValue(0.0)
  Game.GetPlayer().MoveTo(Alias_UlaruOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(0)
  Self.SetStage(10)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(0)
  Self.SetStage(200)
  Utility.Wait(10.0)
EndFunction

Function Fragment_Stage_0004_Item_00()
  RI08_MasakoRemainedCEO.SetValue(1.0)
  Game.GetPlayer().MoveTo(Alias_MasakoOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(0)
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0005_Item_00()
  RI08_MasakoRemainedCEO.SetValue(0.0)
  Game.GetPlayer().MoveTo(Alias_UlaruOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(0)
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0010_Item_00()
  If RI08_MasakoRemainedCEO.GetValue() == 0.0
    Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef())
  Else
    Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef())
    RI08_MasakoRemainedCEO.SetValue(1.0)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True)
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
    If ChosenLocation.HasKeyword(LocTypeStarStation)
      Self.SetStage(155)
    EndIf
    Alias_ChosenLocation_MapMarker.GetRef().SetMarkerVisibleOnStarMap(True)
    Alias_ChosenLocation_MapMarker.GetRef().AddToMapScanned(False)
  Else
    Self.SetStage(200)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  If Self.IsObjectiveDisplayed(150)
    Self.SetObjectiveCompleted(150, True)
  EndIf
  Self.SetObjectiveDisplayed(200, True, False)
  Alias_RivalExecutive.TryToEnable()
EndFunction

Function Fragment_Stage_0250_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, RIR07_Bribe.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0270_Item_00()
  If RI08_MasakoRemainedCEO.GetValue() == 1.0
    Self.SetObjectiveFailed(200, True)
  Else
    Self.SetObjectiveCompleted(200, True)
  EndIf
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(300, True)
  (RI_Support as ri_radiantsupportquestscript).ResetMBCount()
  RI_LastChosenRadiant.SetValue(3.0)
  RIR07_RadiantCount.SetValue(RIR07_RadiantCount.GetValue() + 1.0)
  Self.Stop()
EndFunction

Function Fragment_Stage_9000_Item_00()
  Quest __temp = Self as Quest
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
  kmyQuest.AddFinalValues()
EndFunction
