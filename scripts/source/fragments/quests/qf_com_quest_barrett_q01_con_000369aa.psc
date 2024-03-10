ScriptName Fragments:Quests:QF_COM_Quest_Barrett_Q01_Con_000369AA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory
ReferenceAlias Property Alias_Wendy Auto Const mandatory
ReferenceAlias Property Alias_XMarker_Wendy_GagarinOffice Auto Const mandatory
Book Property Wendy_DataSlate Auto Const mandatory
Perk Property Perk01 Auto Const mandatory
Perk Property Perk02 Auto Const mandatory
Perk Property Perk00 Auto Const mandatory
Perk Property Perk03 Auto Const mandatory
Perk Property Perk04 Auto Const mandatory
Perk Property Perk05 Auto Const mandatory
Perk Property Perk06 Auto Const mandatory
Perk Property Perk07 Auto Const mandatory
ReferenceAlias Property Alias_XMarker_Wendy_NewAtlantis Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
Potion Property MedPack Auto Const mandatory
Perk Property Perk08 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(1)
  Self.SetStage(2)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor Player = Game.GetPlayer()
  Player.AddPerk(Perk00, False)
  Player.AddPerk(Perk01, False)
  Player.AddPerk(Perk02, False)
  Player.AddPerk(Perk03, False)
  Player.AddPerk(Perk04, False)
  Player.AddPerk(Perk05, False)
  Player.AddPerk(Perk06, False)
  Player.AddPerk(Perk07, False)
  Player.AddPerk(Perk08, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, NPCDemandMoney_Large.GetValueInt(), False)
  Game.GetPlayer().AddItem(Credits as Form, NPCDemandMoney_Large.GetValueInt(), False)
  Game.GetPlayer().AddItem(MedPack as Form, 1, False)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveDisplayed(125, True, False)
  Game.GetPlayer().AddItem(Wendy_DataSlate as Form, 1, False)
  Alias_Wendy.GetRef().MoveTo(Alias_XMarker_Wendy_NewAtlantis.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0131_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Large.GetValueInt(), False, None)
  Self.SetStage(142)
  Self.SetStage(130)
EndFunction

Function Fragment_Stage_0132_Item_00()
  Self.SetStage(142)
  Self.SetStage(130)
EndFunction

Function Fragment_Stage_0133_Item_00()
  Self.SetStage(130)
EndFunction

Function Fragment_Stage_0134_Item_00()
  Self.SetStage(133)
EndFunction

Function Fragment_Stage_0135_Item_00()
  Self.SetStage(142)
EndFunction

Function Fragment_Stage_0136_Item_00()
  Self.SetStage(141)
EndFunction

Function Fragment_Stage_0137_Item_00()
  Actor Player = Game.GetPlayer()
  If Player.GetItemCount(Wendy_DataSlate as Form) >= 1
    Player.RemoveItem(Wendy_DataSlate as Form, 1, False, None)
  EndIf
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetObjectiveCompleted(125, True)
  Self.SetObjectiveDisplayed(150, True, False)
  Self.SetStage(130)
EndFunction

Function Fragment_Stage_0141_Item_00()
  Self.SetStage(140)
EndFunction

Function Fragment_Stage_0142_Item_00()
  Self.SetStage(140)
EndFunction

Function Fragment_Stage_0145_Item_00()
  If Self.GetStageDone(141) && Self.GetStageDone(138)
    Self.SetStage(148)
  ElseIf Self.GetStageDone(141) && !Self.GetStageDone(138)
    Self.SetStage(146)
  ElseIf Self.GetStageDone(142) && Self.GetStageDone(138)
    Self.SetStage(149)
  Else
    Self.SetStage(147)
  EndIf
  Self.SetStage(150)
EndFunction

Function Fragment_Stage_0146_Item_00()
  Self.SetStage(145)
EndFunction

Function Fragment_Stage_0147_Item_00()
  Self.SetStage(145)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(125, True)
  Self.SetObjectiveCompleted(150, True)
  Self.SetStage(144)
EndFunction

Function Fragment_Stage_0160_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0170_Item_00()
  If Self.GetStageDone(140)
    Self.SetStage(175)
  EndIf
EndFunction

Function Fragment_Stage_0175_Item_00()
  Alias_Wendy.GetRef().MoveTo(Alias_XMarker_Wendy_GagarinOffice.GetRef(), 0.0, 0.0, 0.0, True, False)
  (Alias_Wendy.GetRef() as Actor).EvaluatePackage(False)
EndFunction
