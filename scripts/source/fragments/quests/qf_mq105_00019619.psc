ScriptName Fragments:Quests:QF_MQ105_00019619 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property TestMQ105MSG01 Auto Const mandatory
Message Property TestMQ105MSG02 Auto Const mandatory
Scene Property MQ105_001_LodgeScene Auto Const mandatory
Scene Property MQ105_002_NeonArrivalScene Auto Const mandatory
Message Property TestMQ105MSG03 Auto Const mandatory
Scene Property MQ105_003_IssaEklundIntroScene Auto Const mandatory
Message Property TestMQ105MSG04 Auto Const mandatory
Message Property TestMQ105MSG05 Auto Const mandatory
Message Property TestMQ105MSG06 Auto Const mandatory
Scene Property MQ105_004_OutsideStroudEklundScene Auto Const mandatory
Message Property TestMQ105MSG07 Auto Const mandatory
Message Property TestMQ105MSG08 Auto Const mandatory
Message Property TestMQ105MSG09 Auto Const mandatory
Scene Property MQ105_007_NegotiationScene Auto Const mandatory
Message Property TestMQ105MSG10 Auto Const mandatory
Message Property TestMQ105MSG11 Auto Const mandatory
Message Property TestMQ105MSG12 Auto Const mandatory
Message Property TestMQ105MSG13 Auto Const mandatory
Message Property TestMQ105MSG14 Auto Const mandatory
Scene Property MQ105_008a_PeacefulResolutionScene Auto Const mandatory
Scene Property MQ105_009a_ViolentResolutionScene Auto Const mandatory
Message Property TestMQ105MSG15 Auto Const mandatory
Message Property TestMQ105MSG16 Auto Const mandatory
Message Property TestMQ105MSG17 Auto Const mandatory
Message Property TestMQ105MSG18 Auto Const mandatory
Message Property TestMQ105MSG19 Auto Const mandatory
Message Property TestMQ105MSG20 Auto Const mandatory
Message Property TestMQ105MSG21 Auto Const mandatory
Scene Property MQ105_010_PeacefulEntryScene Auto Const mandatory
Message Property TestMQ105MSG22 Auto Const mandatory
Message Property TestMQ105MSG23 Auto Const mandatory
ObjectReference Property TestMQ105ReceptionistMarker Auto Const mandatory
Message Property TestMQ105MSG24 Auto Const mandatory
Message Property TestMQ105MSG25 Auto Const mandatory
Message Property TestMQ105MSG26 Auto Const mandatory
Message Property TestMQ105MSG27 Auto Const mandatory
Scene Property MQ105_011b_BreakInEntryScene Auto Const mandatory
Message Property TestMQ105MSG28 Auto Const mandatory
Scene Property MQ105_011b_AccessPointScene Auto Const mandatory
Message Property TestMQ105MSG29 Auto Const mandatory
Message Property TestMQ105MSG30 Auto Const mandatory
Message Property TestMQ105MSG31 Auto Const mandatory
Message Property TestMQ105MSG33 Auto Const mandatory
Scene Property MQ105_006_GreetingMusgroveScene Auto Const mandatory
RefCollectionAlias Property Alias_MusgroveEncounter Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Musgrove Auto Const mandatory
Scene Property MQ105_005_EnteringBarScene Auto Const mandatory
Scene Property MQ105_012_AlexSlaytonScene Auto Const mandatory
Message Property TestMQ105MSG12b Auto Const mandatory
Message Property TestMQ105MSG12c Auto Const mandatory
Scene Property MQ105_009b_ViolentResolutionScene Auto Const mandatory
Quest Property MQ106 Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(2000)
  Self.SetStage(10)
EndFunction

Function Fragment_Stage_0010_Item_00()
  MQ105_001_LodgeScene.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  TestMQ105MSG03.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0400_Item_00()
  MQ105_003_IssaEklundIntroScene.Start()
EndFunction

Function Fragment_Stage_0420_Item_00()
  TestMQ105MSG05.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0500_Item_00()
  TestMQ105MSG06.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_0600_Item_00()
  MQ105_004_OutsideStroudEklundScene.Start()
EndFunction

Function Fragment_Stage_0610_Item_00()
  TestMQ105MSG07.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Self.SetStage(700)
EndFunction

Function Fragment_Stage_0700_Item_00()
  MQ105_005_EnteringBarScene.Start()
EndFunction

Function Fragment_Stage_0710_Item_00()
  TestMQ105MSG08.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  MQ105_006_GreetingMusgroveScene.Start()
EndFunction

Function Fragment_Stage_0800_Item_00()
  TestMQ105MSG09.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  MQ105_007_NegotiationScene.Start()
EndFunction

Function Fragment_Stage_0910_Item_00()
  TestMQ105MSG10.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0930_Item_00()
  TestMQ105MSG12.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0932_Item_00()
  TestMQ105MSG12b.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0934_Item_00()
  TestMQ105MSG12c.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0940_Item_00()
  TestMQ105MSG13.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0960_Item_00()
  Alias_MusgroveEncounter.AddtoFaction(PlayerEnemyFaction)
EndFunction

Function Fragment_Stage_0970_Item_00()
  TestMQ105MSG14.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Alias_Musgrove.GetActorRef().Kill(None)
  Self.SetStage(960)
EndFunction

Function Fragment_Stage_0980_Item_00()
  MQ105_008a_PeacefulResolutionScene.Start()
EndFunction

Function Fragment_Stage_0990_Item_00()
  MQ105_009a_ViolentResolutionScene.Start()
EndFunction

Function Fragment_Stage_1100_Item_00()
  TestMQ105MSG21.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Self.SetStage(1300)
EndFunction

Function Fragment_Stage_1200_Item_00()
  TestMQ105MSG15.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Self.SetStage(1210)
EndFunction

Function Fragment_Stage_1210_Item_00()
  MQ105_009b_ViolentResolutionScene.Start()
EndFunction

Function Fragment_Stage_1220_Item_00()
  TestMQ105MSG16.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_1230_Item_00()
  TestMQ105MSG17.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_1240_Item_00()
  TestMQ105MSG18.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_1250_Item_00()
  TestMQ105MSG19.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_1260_Item_00()
  TestMQ105MSG20.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_1300_Item_00()
  MQ105_010_PeacefulEntryScene.Start()
EndFunction

Function Fragment_Stage_1310_Item_00()
  TestMQ105MSG22.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Game.GetPlayer().Moveto(TestMQ105ReceptionistMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_1320_Item_00()
  TestMQ105MSG24.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Self.SetStage(1500)
EndFunction

Function Fragment_Stage_1330_Item_00()
  TestMQ105MSG25.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Self.SetStage(1500)
EndFunction

Function Fragment_Stage_1340_Item_00()
  TestMQ105MSG26.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Self.SetStage(1500)
EndFunction

Function Fragment_Stage_1350_Item_00()
  TestMQ105MSG23.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_1360_Item_00()
  Self.SetStage(1500)
EndFunction

Function Fragment_Stage_1400_Item_00()
  TestMQ105MSG27.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Self.SetStage(1410)
EndFunction

Function Fragment_Stage_1410_Item_00()
  MQ105_011b_BreakInEntryScene.Start()
EndFunction

Function Fragment_Stage_1420_Item_00()
  TestMQ105MSG28.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Self.SetStage(1450)
EndFunction

Function Fragment_Stage_1450_Item_00()
  MQ105_011b_AccessPointScene.Start()
EndFunction

Function Fragment_Stage_1460_Item_00()
  TestMQ105MSG29.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Self.SetStage(1500)
EndFunction

Function Fragment_Stage_1500_Item_00()
  MQ105_012_AlexSlaytonScene.Start()
EndFunction

Function Fragment_Stage_1510_Item_00()
  TestMQ105MSG30.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_1520_Item_00()
  TestMQ105MSG31.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_1550_Item_00()
  TestMQ105MSG33.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_1600_Item_00()
  MQ106.SetStage(10)
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
