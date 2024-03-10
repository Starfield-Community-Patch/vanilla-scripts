ScriptName Fragments:Quests:QF_City_Neon_Drug02_00235C27 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property Drug02_275_ValentinaLibby Auto Const mandatory
Scene Property Drug02_325_ValentinaWalkAndTalk Auto Const mandatory
Scene Property Drug02_450_BreakTime Auto Const mandatory
ReferenceAlias Property Alias_CleanSuit Auto Const mandatory
ReferenceAlias Property Alias_BenjaminBayu Auto Const mandatory
ReferenceAlias Property Alias_Yannick Auto Const mandatory
ReferenceAlias Property Alias_Robie Auto Const mandatory
Quest Property City_Neon_Drug03 Auto Const mandatory
ReferenceAlias Property Alias_Valentina Auto Const mandatory
Quest Property City_Neon_Drug_Game Auto Const mandatory
Scene Property Drug02_575_GuardAlert Auto Const mandatory
RefCollectionAlias Property Alias_BayuGuards Auto Const mandatory
ObjectReference Property Drug02_FinaleMarker_Bayu Auto Const mandatory
ObjectReference Property Drug02_FinaleMarker_Yannick Auto Const mandatory
LeveledItem Property Drug02_AmpResearch Auto Const mandatory
ActorValue Property Drug02_Foreknowledge_YannickBayuAV Auto Const mandatory
Cell Property LC168Xenofresh Auto Const mandatory
ReferenceAlias Property Alias_ConveyorBelt Auto Const mandatory
RefCollectionAlias Property Alias_ShopPatrons Auto Const mandatory
ReferenceAlias Property Alias_JobTerminal Auto Const mandatory
Armor Property Clothes_Hazmat_Xenofresh_Suit_01 Auto Const mandatory
Message Property Drug02_AuroraMessage Auto Const mandatory
Scene Property Drug02_425a_Aurora Auto Const mandatory
researchproject Property Drug_Research_PerformanceEnhancement_01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().AddItem(Drug02_AmpResearch as Form, 1, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(100)
  Self.SetStage(150)
  Self.SetStage(200)
  Self.SetStage(250)
  Self.SetStage(260)
  Game.GetPlayer().MoveTo(Alias_Valentina.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(100, True)
  If Game.IsResearchComplete(Drug_Research_PerformanceEnhancement_01) == False
    Self.SetObjectiveDisplayed(150, True, False)
  ElseIf Game.IsResearchComplete(Drug_Research_PerformanceEnhancement_01) == True
    Self.SetObjectiveDisplayed(200, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(260, True, False)
  Alias_JobTerminal.GetRef().Activate(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function Fragment_Stage_0260_Item_00()
  Self.SetObjectiveCompleted(260, True)
  Self.SetObjectiveDisplayed(300, True, False)
  LC168Xenofresh.SetPublic(True)
EndFunction

Function Fragment_Stage_0275_Item_00()
  Drug02_275_ValentinaLibby.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(325, True, False)
  Game.GetPlayer().AddAliasedItem(Clothes_Hazmat_Xenofresh_Suit_01 as Form, Alias_CleanSuit as Alias, 1, True)
  Drug02_AuroraMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0325_Item_00()
  Self.SetObjectiveCompleted(325, True)
  Self.SetObjectiveDisplayed(350, True, False)
  Drug02_325_ValentinaWalkAndTalk.Start()
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(350, True)
  Self.SetObjectiveDisplayed(375, True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(375, True)
  Self.SetObjectiveDisplayed(410, True, False)
  Alias_Valentina.GetActorRef().EvaluatePackage(False)
  Utility.Wait(10.0)
  Self.SetStage(405)
EndFunction

Function Fragment_Stage_0405_Item_00()
  Quest __temp = Self as Quest
  city_neon_drug02_script kmyQuest = __temp as city_neon_drug02_script
  kmyQuest.AddItemsToHopper()
  Alias_ConveyorBelt.GetRef().PlayAnimation("play01")
  Drug02_425a_Aurora.Start()
EndFunction

Function Fragment_Stage_0410_Item_00()
  Self.SetObjectiveCompleted(410, True)
  Self.SetObjectiveDisplayed(420, True, False)
EndFunction

Function Fragment_Stage_0420_Item_00()
  Self.SetObjectiveCompleted(420, True)
  Self.SetObjectiveDisplayed(430, True, False)
EndFunction

Function Fragment_Stage_0430_Item_00()
  Self.SetObjectiveCompleted(430, True)
  Self.SetObjectiveDisplayed(440, True, False)
  Alias_ConveyorBelt.GetRef().PlayAnimation("play02")
  Utility.Wait(5.0)
  Self.SetStage(440)
EndFunction

Function Fragment_Stage_0440_Item_00()
  City_Neon_Drug_Game.Start()
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetObjectiveCompleted(450, True)
  Self.SetObjectiveDisplayed(500, True, False)
  Drug02_450_BreakTime.Start()
EndFunction

Function Fragment_Stage_0460_Item_00()
  Alias_Robie.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(575, True, False)
  Alias_BayuGuards.EnableAll(False)
  Alias_ShopPatrons.DisableAll(False)
  Alias_BenjaminBayu.GetRef().MoveTo(Drug02_FinaleMarker_Bayu, 0.0, 0.0, 0.0, True, False)
  Alias_Yannick.GetRef().MoveTo(Drug02_FinaleMarker_Yannick, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0575_Item_00()
  Self.SetObjectiveCompleted(575, True)
  Self.SetObjectiveDisplayed(600, True, False)
  Drug02_575_GuardAlert.Start()
EndFunction

Function Fragment_Stage_0585_Item_00()
  Alias_BenjaminBayu.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest
  city_neon_drug02_script kmyQuest = __temp as city_neon_drug02_script
  Self.CompleteAllObjectives()
  Alias_BenjaminBayu.GetActorRef().EvaluatePackage(False)
  City_Neon_Drug03.Start()
  City_Neon_Drug03.SetActive(True)
  Alias_BayuGuards.EvaluateAll()
  Alias_BenjaminBayu.GetActorRef().EvaluatePackage(False)
  Game.GetPlayer().SetValue(Drug02_Foreknowledge_YannickBayuAV, 1.0)
  kmyQuest.ReleasePlayer()
EndFunction

Function Fragment_Stage_9000_Item_00()
  Alias_BayuGuards.EnableAll(False)
  Alias_ShopPatrons.EnableAll(False)
  Self.Stop()
EndFunction
