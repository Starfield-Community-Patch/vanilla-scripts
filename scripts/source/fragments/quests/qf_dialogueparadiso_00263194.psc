ScriptName Fragments:Quests:QF_DialogueParadiso_00263194 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PD_PlayerHasHotelRoomDiscount Auto Const mandatory
GlobalVariable Property PD_EnhanceSpecialPrice Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property PD_EnhanceSpecialVouchers Auto Const mandatory
GlobalVariable Property PD_VisitationCount Auto Const mandatory
Scene Property DialogueParadiso_PD_IntroScene Auto Const mandatory
Scene Property DialogueParadiso_PD_Keavy_Intro Auto Const mandatory
Scene Property DialogueParadiso_PD_Boardroom_Scene Auto Const mandatory
Quest Property FFParadisoZ01 Auto Const mandatory
Quest Property FFParadisoZ01Misc Auto Const mandatory
ReferenceAlias Property Alias_Emilian Auto Const mandatory
ReferenceAlias Property Alias_Dirk Auto Const mandatory
Quest Property FFparadisoZ02 Auto Const mandatory
Quest Property FFParadisoZ02Misc Auto Const mandatory
ReferenceAlias Property Alias_Kumar Auto Const mandatory
Quest Property FFParadisoZ03Misc Auto Const mandatory
Quest Property FFParadisoZ03 Auto Const mandatory
Quest Property FFParadisoZ04Misc Auto Const mandatory
Quest Property FFParadisoZ04 Auto Const mandatory
ReferenceAlias Property Alias_ChiefJiro Auto Const mandatory
Quest Property MS06 Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
Quest Property TestGoToSpaceQuest Auto Const mandatory
Perk Property Security Auto Const mandatory
ReferenceAlias Property Alias_BoardRoomDoor Auto Const mandatory
RefCollectionAlias Property Alias_NPCsToDisableExt Auto Const mandatory
RefCollectionAlias Property Alias_NPCsToEnableExt Auto Const mandatory
Faction Property ECSConstantFaction Auto Const mandatory
Faction Property ECSConstantSecurityFaction Auto Const mandatory
Faction Property ParadisoFaction Auto Const mandatory
GlobalVariable Property PD_Hotel_RoomCost_Daily Auto Const mandatory
GlobalVariable Property PD_Hotel_RoomCost_Weekly Auto Const mandatory
Faction Property CrimeFactionParadiso Auto Const mandatory
Faction Property CrimeFactionECSConstant Auto Const mandatory
RefCollectionAlias Property Alias_NamedECSNPCs Auto Const mandatory
ReferenceAlias Property Alias_ECSTransplantSlate Auto Const mandatory
ReferenceAlias Property Alias_Jacquotte Auto Const mandatory
Quest Property DialogueECSConstant Auto Const mandatory
ReferenceAlias Property Alias_Daisuke Auto Const mandatory
Faction Property Vendor_ECS_DaisukeFaction Auto Const mandatory
Faction Property Vendor_PD_GeneralGoodsFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0011_Item_00()
  Actor myPlayer = Game.GetPlayer()
  myPlayer.MoveTo(Alias_Emilian.GetRef(), 0.0, 0.0, 0.0, True, False)
  myPlayer.AddPerk(Security, False)
EndFunction

Function Fragment_Stage_0012_Item_00()
  Game.GetPlayer().MoveTo(Alias_Dirk.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0013_Item_00()
  Game.GetPlayer().MoveTo(Alias_Kumar.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0014_Item_00()
  Game.GetPlayer().MoveTo(Alias_ChiefJiro.GetRef(), 0.0, 0.0, 0.0, True, False)
  TestGoToSpaceQuest.SetStage(20)
  MS06.SetStage(1710)
EndFunction

Function Fragment_Stage_0025_Item_00()
  DialogueParadiso_PD_IntroScene.Start()
EndFunction

Function Fragment_Stage_0050_Item_00()
  PD_VisitationCount.SetValue(2.0)
EndFunction

Function Fragment_Stage_0101_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, PD_EnhanceSpecialPrice.GetValue() as Int, False, None)
  PD_EnhanceSpecialVouchers.SetValue(2.0)
EndFunction

Function Fragment_Stage_0300_Item_00()
  DialogueParadiso_PD_Keavy_Intro.Start()
  If MS06.IsRunning()
    MS06.SetStage(690)
  EndIf
EndFunction

Function Fragment_Stage_0305_Item_00()
  If MS06.GetStageDone(690) && !MS06.GetStageDone(691)
    MS06.SetStage(691)
  EndIf
  ObjectReference myDoor = Alias_BoardRoomDoor.GetRef()
  myDoor.SetOpen(True)
EndFunction

Function Fragment_Stage_0401_Item_00()
  PD_PlayerHasHotelRoomDiscount.SetValue(1.0)
  PD_Hotel_RoomCost_Daily.SetValue(PD_Hotel_RoomCost_Daily.GetValue() * 0.800000012)
  PD_Hotel_RoomCost_Weekly.SetValue(PD_Hotel_RoomCost_Weekly.GetValue() * 0.800000012)
EndFunction

Function Fragment_Stage_0600_Item_00()
  DialogueParadiso_PD_Boardroom_Scene.Start()
EndFunction

Function Fragment_Stage_1101_Item_00()
  If !FFParadisoZ01.IsRunning() && !FFParadisoZ01.IsCompleted()
    FFParadisoZ01Misc.Start()
  EndIf
EndFunction

Function Fragment_Stage_1103_Item_00()
  Alias_Jacquotte.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1110_Item_00()
  FFParadisoZ01.Start()
EndFunction

Function Fragment_Stage_1200_Item_00()
  If !FFparadisoZ02.IsRunning() && !FFparadisoZ02.IsCompleted()
    FFParadisoZ02Misc.Start()
  EndIf
EndFunction

Function Fragment_Stage_1210_Item_00()
  FFParadisoZ02Misc.Start()
EndFunction

Function Fragment_Stage_1301_Item_00()
  If !FFParadisoZ03.IsRunning() && !FFParadisoZ03.IsCompleted()
    FFParadisoZ03Misc.Start()
  EndIf
EndFunction

Function Fragment_Stage_1310_Item_00()
  FFParadisoZ03.Start()
EndFunction

Function Fragment_Stage_1320_Item_00()
  FFParadisoZ03.Start()
  FFParadisoZ03.SetStage(200)
EndFunction

Function Fragment_Stage_1402_Item_00()
  If !FFParadisoZ04.IsRunning() && !FFParadisoZ04.IsCompleted()
    FFParadisoZ04Misc.Start()
  EndIf
EndFunction

Function Fragment_Stage_1410_Item_00()
  FFParadisoZ04.Start()
EndFunction

Function Fragment_Stage_2010_Item_00()
  DialogueECSConstant.SetStage(1000)
  Alias_NPCsToDisableExt.DisableAll(False)
  Alias_NPCsToEnableExt.EnableAll(False)
  Alias_ECSTransplantSlate.GetRef().Enable(False)
  Alias_NPCsToEnableExt.AddRefCollection(Alias_NamedECSNPCs)
  Actor myDaisuke = Alias_Daisuke.GetActorRef()
  Alias_NPCsToEnableExt.RemoveFromFaction(ECSConstantSecurityFaction)
  Alias_NPCsToEnableExt.RemoveFromFaction(CrimeFactionECSConstant)
  myDaisuke.RemoveFromFaction(Vendor_ECS_DaisukeFaction)
  Alias_NPCsToEnableExt.AddToFaction(CrimeFactionParadiso)
  Alias_NPCsToEnableExt.AddToFaction(ParadisoFaction)
  myDaisuke.AddToFaction(Vendor_PD_GeneralGoodsFaction)
  Int I = 0
  Int iCount = Alias_NPCsToEnableExt.GetCount()
  While I < iCount
    Actor myNPCToEnable = Alias_NPCsToEnableExt.GetAt(I) as Actor
    myNPCToEnable.SetCrimeFaction(CrimeFactionParadiso)
    I += 1
  EndWhile
EndFunction
