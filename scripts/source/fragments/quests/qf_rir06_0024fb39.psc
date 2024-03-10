ScriptName Fragments:Quests:QF_RIR06_0024FB39 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Imogene Auto Const mandatory
ReferenceAlias Property Alias_Masako Auto Const mandatory
ReferenceAlias Property Alias_Ularu Auto Const mandatory
ReferenceAlias Property Alias_QuestGiver Auto Const mandatory
GlobalVariable Property RI_RadiantQuestGiver Auto Const mandatory
ReferenceAlias Property Alias_RogueOperative Auto Const mandatory
Quest Property RI01 Auto Const mandatory
GlobalVariable Property RIR06_OperativeType Auto Const mandatory
GlobalVariable Property RIR06_RadiantCount Auto Const mandatory
GlobalVariable Property RI01_TomoDead Auto Const mandatory
ReferenceAlias Property Alias_OperativeMarker Auto Const mandatory
ReferenceAlias Property Alias_Tomo Auto Const mandatory
ReferenceAlias Property Alias_Operative Auto Const mandatory
ReferenceAlias Property Alias_Dalton Auto Const mandatory
ReferenceAlias Property Alias_MasakoOfficeQS Auto Const mandatory
ReferenceAlias Property Alias_UlaruOfficeQS Auto Const mandatory
Quest Property RI07 Auto Const mandatory
GlobalVariable Property RIR06_Tomo_CreditsSmall Auto Const mandatory
GlobalVariable Property RIR06_Tomo_CreditsLarge Auto Const mandatory
GlobalVariable Property RIR06_Operative_CreditsSmall Auto Const mandatory
GlobalVariable Property RIR06_Operative_CreditsLarge Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Quest Property RI06 Auto Const mandatory
ReferenceAlias Property Alias_VeenaOfficeQS Auto Const mandatory
ReferenceAlias Property Alias_MasakoRI06Marker Auto Const mandatory
ReferenceAlias Property Alias_RivalOperative Auto Const mandatory
GlobalVariable Property RI05_ImogeneDead Auto Const mandatory
GlobalVariable Property RI08_MasakoRemainedCEO Auto Const mandatory
ReferenceAlias Property Alias_DaltonRI07Marker Auto Const mandatory
GlobalVariable Property RI05_Track_BayuDispleased Auto Const mandatory
LocationAlias Property Alias_ChosenLocation Auto Const mandatory
Location Property CityNeonLocation Auto Const mandatory
Keyword Property LocTypeStarstation Auto Const mandatory
Quest Property RI_Support Auto Const mandatory
GlobalVariable Property RI_LastChosenRadiant Auto Const mandatory
GlobalVariable Property RIR06_PlayerSpokeToYuko Auto Const mandatory
ReferenceAlias Property Alias_Yuko Auto Const mandatory
ReferenceAlias Property Alias_YukoFurniture Auto Const mandatory
Scene Property RIR06_350_Yuko_CommentScene Auto Const mandatory
Quest Property RIR06_YukoFollowUp Auto Const mandatory
GlobalVariable Property RIR06_PlayerLetImogeneLive Auto Const mandatory
GlobalVariable Property RIR06_PlayerLetOperativeLive Auto Const mandatory
GlobalVariable Property RIR06_PlayerLetTomoLive Auto Const mandatory
Quest Property RI_RadiantPointerQuest Auto Const mandatory
ReferenceAlias Property Alias_ChosenMapMarker Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Medium Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property RyujinIndustriesFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  RI05_Track_BayuDispleased.SetValue(1.0)
  RI06.SetStage(15)
EndFunction

Function Fragment_Stage_0001_Item_00()
  RI05_Track_BayuDispleased.SetValue(1.0)
  Game.GetPlayer().MoveTo(Alias_VeenaOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Masako.GetRef().MoveTo(Alias_MasakoRI06Marker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Game.GetPlayer().MoveTo(Alias_UlaruOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_QuestGiver.Clear()
  Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef())
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Game.GetPlayer().MoveTo(Alias_UlaruOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_QuestGiver.Clear()
  Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef())
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Float fCheckTomo = RIR06_PlayerLetTomoLive.GetValue()
  Float fCheckImogene = RIR06_PlayerLetImogeneLive.GetValue()
  Float fCheckOperative = RIR06_PlayerLetOperativeLive.GetValue()
  If RIR06_RadiantCount.GetValue() == 0.0
    If RI01_TomoDead.GetValue() == 0.0
      Self.SetStage(11)
    Else
      Self.SetStage(13)
    EndIf
  EndIf
  If RIR06_RadiantCount.GetValue() > 0.0
    If RI01_TomoDead.GetValue() == 0.0 && fCheckTomo == -1.0
      Self.SetStage(11)
    ElseIf RI05_ImogeneDead.GetValue() == 0.0 && fCheckImogene == -1.0
      Self.SetStage(12)
    Else
      Self.SetStage(13)
    EndIf
  EndIf
  Float fMasakoCEO = RI08_MasakoRemainedCEO.GetValue()
  If fMasakoCEO == -1.0
    Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef())
  ElseIf fMasakoCEO == 0.0
    Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef())
  EndIf
EndFunction

Function Fragment_Stage_0011_Item_00()
  Float fMasakoCEO = RI08_MasakoRemainedCEO.GetValue()
  If fMasakoCEO == -1.0
    Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef())
  ElseIf fMasakoCEO == 0.0
    Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef())
  EndIf
  Alias_Operative.ForceRefTo(Alias_Tomo.GetRef())
  Alias_Tomo.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0012_Item_00()
  Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef())
  Actor Imogene = Alias_Imogene.GetActorRef()
  Alias_Operative.ForceRefTo(Imogene as ObjectReference)
  Imogene.Enable(False)
  Imogene.SetEssential(False)
EndFunction

Function Fragment_Stage_0013_Item_00()
  Int iOperative = Utility.RandomInt(0, 1)
  RIR06_OperativeType.SetValueInt(iOperative)
  If RI01_TomoDead.GetValue() == 1.0 && RIR06_RadiantCount.GetValue() == 0.0
    Alias_RivalOperative.TryToEnable()
    Alias_Operative.ForceRefTo(Alias_RivalOperative.GetRef())
  EndIf
  If RI08_MasakoRemainedCEO.GetValue() == 0.0
    If RI05_ImogeneDead.GetValue() == 1.0 && RIR06_RadiantCount.GetValue() == 1.0 || RIR06_RadiantCount.GetValue() >= 2.0
      If RIR06_OperativeType.GetValueInt() == 0
        Alias_RogueOperative.TryToEnable()
        Alias_Operative.ForceRefTo(Alias_RogueOperative.GetRef())
      Else
        Alias_RivalOperative.TryToEnable()
        Alias_Operative.ForceRefTo(Alias_RivalOperative.GetRef())
      EndIf
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True)
  Self.SetObjectiveDisplayed(100, True, False)
  RI06.Stop()
  If RI_RadiantPointerQuest.IsRunning()
    RI_RadiantPointerQuest.SetStage(10000)
  EndIf
EndFunction

Function Fragment_Stage_0150_Item_03()
  Self.SetObjectiveCompleted(100, True)
  Location ChosenLocation = Alias_ChosenLocation.GetLocation()
  If ChosenLocation != CityNeonLocation && !CityNeonLocation.IsChild(ChosenLocation)
    Self.SetObjectiveDisplayed(150, True, False)
    If ChosenLocation.HasKeyword(LocTypeStarstation)
      Self.SetStage(155)
    EndIf
    Alias_ChosenMapMarker.GetRef().SetMarkerVisibleOnStarMap(True)
    Alias_ChosenMapMarker.GetRef().AddToMapScanned(False)
  Else
    Self.SetStage(200)
  EndIf
  Alias_Masako.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveCompleted(155, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Alias_Operative.GetRef().MoveTo(Alias_OperativeMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0200_Item_01()
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveCompleted(155, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Alias_Operative.GetRef().MoveTo(Alias_OperativeMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0200_Item_02()
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveCompleted(155, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Alias_Operative.GetRef().MoveTo(Alias_OperativeMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Actor OperativeActorRef = Alias_Operative.GetActorRef()
  OperativeActorRef.SetEssential(False)
  OperativeActorRef.RemoveFromFaction(RyujinIndustriesFaction)
  OperativeActorRef.RemoveFromFaction(PlayerFriendFaction)
  OperativeActorRef.AddToFaction(PlayerEnemyFaction)
  OperativeActorRef.SetValue(Aggression, 2.0)
  OperativeActorRef.StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetStage(300)
  If Self.GetStageDone(11)
    RI01_TomoDead.SetValue(1.0)
  EndIf
  If Self.GetStageDone(12)
    RI05_ImogeneDead.SetValue(1.0)
  EndIf
EndFunction

Function Fragment_Stage_0270_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, RIR06_Tomo_CreditsSmall.GetValueInt(), False)
EndFunction

Function Fragment_Stage_0275_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, RIR06_Tomo_CreditsLarge.GetValueInt(), False)
EndFunction

Function Fragment_Stage_0280_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, RIR06_Operative_CreditsSmall.GetValueInt(), False)
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0285_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, RIR06_Operative_CreditsLarge.GetValueInt(), False)
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0297_Item_00()
  Int LargeAmount = NPCDemandMoney_Large.GetValue() as Int
  Alias_Player.GetActorRef().RemoveItem(Credits as Form, LargeAmount, False, None)
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0298_Item_00()
  Int MediumAmount = NPCDemandMoney_Medium.GetValue() as Int
  Alias_Player.GetActorRef().RemoveItem(Credits as Form, MediumAmount, False, None)
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(400, True, False)
  RI07.SetStage(150)
  Alias_Dalton.GetRef().MoveTo(Alias_DaltonRI07Marker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0300_Item_01()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(400, True, False)
  RI07.SetStage(150)
  Alias_Dalton.GetRef().MoveTo(Alias_DaltonRI07Marker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0300_Item_02()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  If RIR06_PlayerSpokeToYuko.GetValue() == 0.0 && RI05_ImogeneDead.GetValue() == 0.0
    Actor YukoRef = Alias_Yuko.GetActorRef()
    YukoRef.Enable(False)
    YukoRef.MoveTo(Alias_YukoFurniture.GetRef(), 0.0, 0.0, 0.0, True, False)
    YukoRef.EvaluatePackage(False)
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_03()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  If RIR06_PlayerSpokeToYuko.GetValue() == 0.0
    Actor YukoRef = Alias_Yuko.GetActorRef()
    YukoRef.Enable(False)
    YukoRef.MoveTo(Alias_YukoFurniture.GetRef(), 0.0, 0.0, 0.0, True, False)
    YukoRef.EvaluatePackage(False)
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_04()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  If RIR06_PlayerSpokeToYuko.GetValue() == 0.0 && RI01_TomoDead.GetValue() == 0.0
    Actor YukoRef = Alias_Yuko.GetActorRef()
    YukoRef.Enable(False)
    YukoRef.MoveTo(Alias_YukoFurniture.GetRef(), 0.0, 0.0, 0.0, True, False)
    YukoRef.EvaluatePackage(False)
  EndIf
EndFunction

Function Fragment_Stage_0340_Item_00()
  If RIR06_PlayerSpokeToYuko.GetValue() == 0.0 && RI08_MasakoRemainedCEO.GetValue() == 0.0 && !Self.GetStageDone(220)
    Self.SetStage(350)
  EndIf
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveDisplayed(350, True, False)
  Self.SetObjectiveDisplayed(300, False, False)
  RIR06_350_Yuko_CommentScene.Start()
EndFunction

Function Fragment_Stage_0355_Item_00()
  Self.SetObjectiveCompleted(350, True)
  Self.SetObjectiveDisplayed(300, True, False)
  RIR06_PlayerSpokeToYuko.SetValue(1.0)
  Alias_Yuko.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(300, True)
  If Self.GetStageDone(220)
    RIR06_PlayerLetTomoLive.SetValue(0.0)
  Else
    RIR06_PlayerLetTomoLive.SetValue(1.0)
  EndIf
  Self.SetStage(10000)
EndFunction

Function Fragment_Stage_0900_Item_01()
  Self.SetObjectiveCompleted(300, True)
  Self.SetStage(10000)
EndFunction

Function Fragment_Stage_0900_Item_02()
  Self.SetObjectiveCompleted(300, True)
  If Self.IsObjectiveDisplayed(350)
    Self.SetObjectiveDisplayed(350, False, False)
  EndIf
  If Self.GetStageDone(220)
    RIR06_PlayerLetImogeneLive.SetValue(0.0)
  Else
    RIR06_PlayerLetImogeneLive.SetValue(1.0)
  EndIf
  Self.SetStage(10000)
EndFunction

Function Fragment_Stage_0900_Item_03()
  Self.SetObjectiveCompleted(300, True)
  If Self.IsObjectiveDisplayed(350)
    Self.SetObjectiveDisplayed(350, False, False)
  EndIf
  Float fOperativeCount = RIR06_PlayerLetOperativeLive.GetValue()
  If !Self.GetStageDone(220) && fOperativeCount == -1.0
    RIR06_PlayerLetOperativeLive.SetValue(1.0)
  ElseIf !Self.GetStageDone(220) && fOperativeCount >= 1.0
    RIR06_PlayerLetOperativeLive.SetValue(fOperativeCount + 1.0)
  EndIf
  Self.SetStage(10000)
EndFunction

Function Fragment_Stage_0900_Item_04()
  Self.SetObjectiveCompleted(300, True)
  If Self.IsObjectiveDisplayed(350)
    Self.SetObjectiveDisplayed(350, False, False)
  EndIf
  If Self.GetStageDone(220)
    RIR06_PlayerLetTomoLive.SetValue(0.0)
  Else
    RIR06_PlayerLetTomoLive.SetValue(1.0)
  EndIf
  Self.SetStage(10000)
EndFunction

Function Fragment_Stage_10000_Item_00()
  If RIR06_PlayerSpokeToYuko.GetValue() == 0.0 && RI08_MasakoRemainedCEO.GetValue() == 0.0 && !Self.GetStageDone(220)
    RIR06_YukoFollowUp.SetStage(100)
  EndIf
  If Self.IsObjectiveDisplayed(350)
    Self.SetObjectiveDisplayed(350, False, False)
  EndIf
  Float fCurrentRadiantCount = RIR06_RadiantCount.GetValue()
  If RI_RadiantQuestGiver.GetValue() == 2.0
    (RI_Support as ri_radiantsupportquestscript).ResetMBCount()
    RI_LastChosenRadiant.SetValue(2.0)
    RIR06_RadiantCount.SetValue(fCurrentRadiantCount + 1.0)
    Self.Stop()
  EndIf
  If fCurrentRadiantCount == 0.0 && !RI07.IsCompleted()
    RI07.SetStage(200)
    RIR06_RadiantCount.SetValue(1.0)
  EndIf
EndFunction
