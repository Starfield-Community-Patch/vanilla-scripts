ScriptName Fragments:Quests:QF_DialogueCydonia_0024AFED Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property CY_Anna_CreditsAmount Auto Const mandatory
LeveledItem Property LL_CY_HorusGift Auto Const mandatory
Scene Property DialogueCydonia_EstablishingScene01 Auto Const mandatory
Quest Property FFCydoniaZ04 Auto Const mandatory
ReferenceAlias Property ReneeShelby Auto Const mandatory
ReferenceAlias Property MitchBenjamin Auto Const mandatory
Quest Property City_CY_RedTape01 Auto Const mandatory
ReferenceAlias Property TrevorPetyarre Auto Const mandatory
Book Property City_CY_RedTape02_HurstNote Auto Const mandatory
GlobalVariable Property CY_HurstGone Auto Const mandatory
ReferenceAlias Property DenisAverin Auto Const mandatory
Quest Property FFCydoniaZ01 Auto Const mandatory
ReferenceAlias Property RivkahOvadia Auto Const mandatory
Quest Property City_CY_Runaway01 Auto Const mandatory
ReferenceAlias Property Alias_GillySeong Auto Const mandatory
Quest Property City_CY_Psych01 Auto Const mandatory
ReferenceAlias Property Alias_JaneWeller Auto Const mandatory
Quest Property City_CY_StartUp01 Auto Const mandatory
GlobalVariable Property DialogueCydonia_RedEyes Auto Const mandatory
ReferenceAlias Property Alias_SupervisorIntroMarker Auto Const mandatory
GlobalVariable Property CY_Hurst_Donation Auto Const mandatory
Potion Property Aid_MedPack Auto Const mandatory
Quest Property City_CY_Psych01Misc Auto Const mandatory
ReferenceAlias Property Alias_TrevorMarker Auto Const mandatory
MiscObject Property City_CY_Runaway01_Whiskey Auto Const mandatory
Scene Property DialogueCydonia_Rivkah_Greeting_CityCYRunaway01_Start Auto Const mandatory
Quest Property City_CY_RedTape03 Auto Const mandatory
Quest Property FFCydoniaZ04Misc Auto Const mandatory
Quest Property RAD03 Auto Const mandatory
ReferenceAlias Property Alias_SaoirseBowden Auto Const mandatory
Scene Property DialogueCydonia_EstablishingScene02 Auto Const mandatory
Quest Property City_CY_RedTape01_Misc Auto Const mandatory
Perk Property TRAIT_Extrovert Auto Const mandatory
Perk Property BackgroundIndustrialist Auto Const mandatory
Quest Property City_CY_RedTape02_Blackmail Auto Const mandatory
ReferenceAlias Property Alias_TiaWu Auto Const mandatory
Topic Property DialogueCydonia_Psych01_Tia_OverhearTopic Auto Const mandatory
Quest Property City_CY_Runaway01_Misc Auto Const mandatory
ActorValue Property City_CY_Runaway01_Foreknowledge_RivkahSickAV Auto Const mandatory
ActorValue Property FFCydoniaR03_Foreknowledge_BooksAV Auto Const mandatory
Scene Property DialogueCydonia_ErickJane_NoShip Auto Const mandatory
GlobalVariable Property UC_PlayerKnows_RedDevils Auto Const mandatory
ActorValue Property City_CY_Psych01_Foreknowledge_AV Auto Const mandatory
ReferenceAlias Property Alias_LaylahPulaski Auto Const mandatory
Quest Property FFCydoniaZ07 Auto Const mandatory
Quest Property FFCydoniaZ07Misc Auto Const mandatory
Quest Property FFCydoniaZ08Misc Auto Const mandatory
Quest Property FFCydoniaZ08 Auto Const mandatory
Quest Property RAD04 Auto Const mandatory
ReferenceAlias Property Alias_TrackerAgent Auto Const mandatory
RefCollectionAlias Property Alias_OldMiningEquipment Auto Const mandatory
Keyword Property DialogueCydoniaDetonationQuestStartKeyword Auto Const mandatory
conditionform Property CY_DetonationCountConditionForm Auto Const mandatory
Quest Property DialogueCydonia_Detonation_Helper Auto Const mandatory
RefCollectionAlias Property Alias_AllMiners Auto Const mandatory
Topic Property DialogueCydonia_Trevor_City_CY_Runaway01_Topic Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Actor myPlayer = Game.GetPlayer()
  ObjectReference myTrevor = TrevorPetyarre.GetRef()
  ObjectReference myTrevorMarker = Alias_TrevorMarker.GetRef()
  Self.SetStage(11)
  myPlayer.MoveTo(myTrevorMarker, 0.0, 0.0, 0.0, True, False)
  myPlayer.AddPerk(TRAIT_Extrovert, False)
  myPlayer.AddPerk(BackgroundIndustrialist, False)
  myTrevor.MoveTo(myTrevorMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().MoveTo(DenisAverin.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(DenisAverin.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Actor myPlayer = Game.GetPlayer()
  myPlayer.MoveTo(MitchBenjamin.GetRef(), 0.0, 0.0, 0.0, True, False)
  myPlayer.AddItem(Credits as Form, 10000, False)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Game.GetPlayer().MoveTo(ReneeShelby.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  City_CY_RedTape03.SetStage(1000)
  Game.GetPlayer().MoveTo(RivkahOvadia.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0006_Item_00()
  Game.GetPlayer().MoveTo(Alias_GillySeong.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0007_Item_00()
  Game.GetPlayer().MoveTo(Alias_JaneWeller.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0008_Item_00()
  City_CY_RedTape03.SetStage(1000)
  Game.GetPlayer().MoveTo(Alias_LaylahPulaski.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0009_Item_00()
  Game.GetPlayer().MoveTo(Alias_TrackerAgent.GetRef(), 0.0, 0.0, 0.0, True, False)
  RAD04.SetStage(1000)
EndFunction

Function Fragment_Stage_0010_Item_00()
  If !Self.GetStageDone(0)
    DialogueCydonia_EstablishingScene01.Start()
  EndIf
EndFunction

Function Fragment_Stage_0011_Item_00()
  TrevorPetyarre.GetActorRef().EvaluatePackage(False)
  DialogueCydonia_EstablishingScene02.Start()
  City_CY_RedTape01_Misc.Start()
  DialogueCydonia_Detonation_Helper.SetStage(50)
EndFunction

Function Fragment_Stage_0012_Item_00()
  TrevorPetyarre.GetRef().MoveTo(Alias_SupervisorIntroMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0013_Item_00()
  If !City_CY_Runaway01.IsRunning() && !City_CY_Runaway01.IsCompleted()
    City_CY_Runaway01_Misc.Start()
  EndIf
EndFunction

Function Fragment_Stage_0015_Item_00()
  If CY_DetonationCountConditionForm.IsTrue(None, None)
    DialogueCydoniaDetonationQuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0)
  EndIf
EndFunction

Function Fragment_Stage_0017_Item_00()
  Game.GetPlayer().MoveTo(Alias_SaoirseBowden.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  DialogueCydonia_RedEyes.SetValue(1.0)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, CY_Anna_CreditsAmount.GetValue() as Int, False, None)
EndFunction

Function Fragment_Stage_0212_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, CY_Hurst_Donation.GetValue() as Int, False, None)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Game.GetPlayer().RemoveItem(City_CY_RedTape02_HurstNote as Form, 1, False, None)
  City_CY_RedTape02_Blackmail.SetStage(1000)
EndFunction

Function Fragment_Stage_0801_Item_00()
  UC_PlayerKnows_RedDevils.SetValue(1.0)
EndFunction

Function Fragment_Stage_0810_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0900_Item_00()
  FFCydoniaZ04.Start()
EndFunction

Function Fragment_Stage_0902_Item_00()
  If !FFCydoniaZ04.IsRunning() && !FFCydoniaZ04.IsCompleted()
    FFCydoniaZ04Misc.Start()
  EndIf
EndFunction

Function Fragment_Stage_1002_Item_00()
  Game.GetPlayer().SetValue(FFCydoniaR03_Foreknowledge_BooksAV, 1.0)
EndFunction

Function Fragment_Stage_1110_Item_00()
  City_CY_RedTape01_Misc.SetStage(1000)
  City_CY_RedTape01.Start()
EndFunction

Function Fragment_Stage_1130_Item_00()
  Quest __temp = Self as Quest
  dialoguecydoniaquestscript kmyQuest = __temp as dialoguecydoniaquestscript
  Alias_OldMiningEquipment.DisableAll(False)
  kmyQuest.SwapCutters()
EndFunction

Function Fragment_Stage_1150_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_1200_Item_00()
  FFCydoniaZ01.Start()
EndFunction

Function Fragment_Stage_1300_Item_00()
  City_CY_Runaway01_Misc.SetStage(1000)
  City_CY_Runaway01.Start()
EndFunction

Function Fragment_Stage_1302_Item_00()
  Game.GetPlayer().RemoveItem(Aid_MedPack as Form, 1, False, RivkahOvadia.GetRef())
EndFunction

Function Fragment_Stage_1310_Item_00()
  Game.GetPlayer().SetValue(City_CY_Runaway01_Foreknowledge_RivkahSickAV, 1.0)
EndFunction

Function Fragment_Stage_1320_Item_00()
  Game.GetPlayer().RemoveItem(City_CY_Runaway01_Whiskey as Form, 1, False, None)
EndFunction

Function Fragment_Stage_1321_Item_00()
  Game.GetPlayer().RemoveItem(City_CY_Runaway01_Whiskey as Form, 1, False, None)
EndFunction

Function Fragment_Stage_1400_Item_00()
  City_CY_Psych01.Start()
  Game.GetPlayer().SetValue(City_CY_Psych01_Foreknowledge_AV, 1.0)
EndFunction

Function Fragment_Stage_1402_Item_00()
  If !City_CY_Psych01Misc.IsRunning() && !City_CY_Psych01.IsRunning() && !City_CY_Psych01Misc.IsCompleted() && !City_CY_Psych01.IsRunning()
    City_CY_Psych01Misc.Start()
  EndIf
EndFunction

Function Fragment_Stage_1500_Item_00()
  City_CY_StartUp01.Start()
EndFunction

Function Fragment_Stage_1501_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_1550_Item_00()
  DialogueCydonia_ErickJane_NoShip.Start()
EndFunction

Function Fragment_Stage_1700_Item_00()
  RAD03.Start()
EndFunction

Function Fragment_Stage_1800_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_2301_Item_00()
  UC_PlayerKnows_RedDevils.SetValue(1.0)
EndFunction

Function Fragment_Stage_2400_Item_00()
  FFCydoniaZ07Misc.Start()
EndFunction

Function Fragment_Stage_2405_Item_00()
  If !FFCydoniaZ07.IsRunning() && !FFCydoniaZ07.IsCompleted()
    FFCydoniaZ07Misc.Start()
  EndIf
EndFunction

Function Fragment_Stage_2410_Item_00()
  FFCydoniaZ07.Start()
EndFunction

Function Fragment_Stage_2500_Item_00()
  If !FFCydoniaZ08.IsRunning() && !FFCydoniaZ08.IsCompleted()
    FFCydoniaZ08Misc.Start()
  EndIf
EndFunction

Function Fragment_Stage_2510_Item_00()
  FFCydoniaZ08.Start()
EndFunction

Function Fragment_Stage_2600_Item_00()
  Utility.Wait(1.0)
  TrevorPetyarre.GetRef().Say(DialogueCydonia_Trevor_City_CY_Runaway01_Topic, None, False, None)
EndFunction
