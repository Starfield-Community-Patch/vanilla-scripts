ScriptName Fragments:Quests:QF_DialogueFCNeon_0022DAD6 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RAD03 Auto Const mandatory
ReferenceAlias Property Alias_FCNeonKolmanLang Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property Neon_VoliiHotel_PermCost Auto Const mandatory
GlobalVariable Property Neon_VoliiHotel_RentCount Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
Quest Property FFNeonZ04 Auto Const mandatory
Quest Property FFNeonZ03 Auto Const mandatory
Quest Property FFNeonZ01 Auto Const mandatory
Quest Property FFNeonZ02 Auto Const mandatory
ObjectReference Property FCNeon_EuphorikaMembersDoorRef Auto Const mandatory
Quest Property FFNeonZ05 Auto Const
Quest Property FFNeonZ06 Auto Const
Quest Property FFNeonZ07 Auto Const
Quest Property FFNeonZ08 Auto Const
Quest Property FFNeonZ09 Auto Const mandatory
GlobalVariable Property FC_Neon_BeggarDonationGlobal Auto Const mandatory
GlobalVariable Property FC_Neon_BeggarDonationCountGlobal Auto Const mandatory
Quest Property FFNeonZ10 Auto Const mandatory
Quest Property FFNeonZ12 Auto Const mandatory
ReferenceAlias Property Alias_FCNeonMiguelReeves Auto Const mandatory
Quest Property DialogueFCNeon_PlayerHomeQuest Auto Const mandatory
Quest Property FFNeonZ06_Controller Auto Const
Key Property City_NE_EuphorikaMemberPass Auto Const mandatory
GlobalVariable Property Neon_Euphorika_LoungeCost Auto Const mandatory
Quest Property FFNeonZ11 Auto Const mandatory
Quest Property CF06 Auto Const mandatory
ReferenceAlias Property Alias_FCNeonFranchescaMoore Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0370_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0031_Item_00()
  Game.GetPlayer().MoveTo(Alias_FCNeonKolmanLang.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0101_Item_00()
  DialogueFCNeon_PlayerHomeQuest.SetStage(30)
EndFunction

Function Fragment_Stage_0115_Item_00()
  FFNeonZ01.Start()
EndFunction

Function Fragment_Stage_0135_Item_00()
  FFNeonZ02.SetStage(10)
EndFunction

Function Fragment_Stage_0195_Item_00()
  FFNeonZ03.Start()
EndFunction

Function Fragment_Stage_0222_Item_00()
  FFNeonZ04.Start()
EndFunction

Function Fragment_Stage_0275_Item_00()
  FFNeonZ05.Start()
  FFNeonZ05.SetStage(10)
EndFunction

Function Fragment_Stage_0293_Item_00()
  FFNeonZ06_Controller.Start()
  FFNeonZ06_Controller.SetStage(10)
EndFunction

Function Fragment_Stage_0294_Item_00()
  FFNeonZ06_Controller.Stop()
EndFunction

Function Fragment_Stage_0295_Item_00()
  FFNeonZ06.Start()
  FFNeonZ06.SetStage(0)
EndFunction

Function Fragment_Stage_0315_Item_00()
  RAD03.Start()
EndFunction

Function Fragment_Stage_0360_Item_00()
  FFNeonZ12.Start()
EndFunction

Function Fragment_Stage_0380_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, Neon_VoliiHotel_PermCost.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Game.GetPlayer().AddItem(City_NE_EuphorikaMemberPass as Form, 1, False)
  If CF06.GetStageDone(46) == False
    Game.GetPlayer().RemoveItem(Credits as Form, Neon_Euphorika_LoungeCost.GetValueInt(), False, None)
  EndIf
EndFunction

Function Fragment_Stage_0420_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0445_Item_00()
  FFNeonZ04.SetObjectiveCompleted(15, True)
EndFunction

Function Fragment_Stage_0455_Item_00()
  FFNeonZ07.Start()
  FFNeonZ07.SetStage(10)
EndFunction

Function Fragment_Stage_0475_Item_00()
  FFNeonZ08.Start()
  FFNeonZ08.SetStage(10)
EndFunction

Function Fragment_Stage_0476_Item_00()
  FFNeonZ10.SetStage(10)
EndFunction

Function Fragment_Stage_0482_Item_00()
  Self.SetStage(481)
  Game.GetPlayer().RemoveItem(Credits as Form, FC_Neon_BeggarDonationGlobal.GetValueInt(), False, None)
  FC_Neon_BeggarDonationCountGlobal.Mod(1.0)
EndFunction

Function Fragment_Stage_0485_Item_00()
  FFNeonZ11.Start()
EndFunction

Function Fragment_Stage_0498_Item_00()
  FFNeonZ09.Start()
EndFunction

Function Fragment_Stage_0499_Item_00()
  FFNeonZ09.Stop()
EndFunction

Function Fragment_Stage_0579_Item_00()
  FFNeonZ12.SetStage(12)
EndFunction

Function Fragment_Stage_0581_Item_00()
  FFNeonZ12.SetStage(10)
EndFunction

Function Fragment_Stage_0582_Item_00()
  FFNeonZ12.Start()
EndFunction

Function Fragment_Stage_0620_Item_00()
  DialogueFCNeon_PlayerHomeQuest.SetStage(10)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Alias_FCNeonFranchescaMoore.Clear()
EndFunction
