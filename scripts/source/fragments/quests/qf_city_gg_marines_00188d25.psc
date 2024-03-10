ScriptName Fragments:Quests:QF_City_GG_Marines_00188D25 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC_GG_Marines_DropoffsCompleted Auto Const mandatory
GlobalVariable Property UC_GG_Marines_TotalDropoffs Auto Const mandatory
GlobalVariable Property UC_GG_Marines_PlayerHeardZinaidaPitch Auto Const mandatory
ObjectReference Property UC_GG_Marines_DebugMarker01 Auto Const mandatory
ObjectReference Property UC_GG_Marines_DebugMarker02 Auto Const mandatory
ObjectReference Property UC_GG_Marines_DebugMarker03 Auto Const mandatory
ObjectReference Property GG_Marker_OutdoorBar01 Auto Const mandatory
GlobalVariable Property UC_GG_Marines_ViktorBribe Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
MiscObject Property UC_GG_Marines_RecruitmentMaterials Auto Const mandatory
GlobalVariable Property UC_GG_Marines_BonusCount Auto Const mandatory
GlobalVariable Property UC_GG_Marines_LizzyBribe Auto Const mandatory
Perk Property BackgroundSoldier Auto Const mandatory
Perk Property BackgroundCombatMedic Auto Const mandatory
Perk Property TraitUnitedColoniesNative Auto Const mandatory
Quest Property UC_GG_Marines_Misc Auto Const mandatory
Quest Property DialogueGagarin_UC_GG Auto Const mandatory
RefCollectionAlias Property Alias_RecruitmentMaterials Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().Moveto(UC_GG_Marines_DebugMarker02, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().Moveto(UC_GG_Marines_DebugMarker03, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, UC_GG_Marines_ViktorBribe.GetValueInt(), False)
  Game.GetPlayer().Moveto(GG_Marker_OutdoorBar01, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(500)
  Game.GetPlayer().Moveto(UC_GG_Marines_DebugMarker01, 0.0, 0.0, 0.0, True, False)
  Self.SetObjectiveCompleted(100, True)
  Game.GetPlayer().RemoveItem(UC_GG_Marines_RecruitmentMaterials as Form, 3, False, None)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Actor PlayACT = Game.GetPlayer()
  PlayACT.AddPerk(BackgroundSoldier, False)
  PlayACT.AddPerk(BackgroundCombatMedic, False)
  PlayACT.AddPerk(TraitUnitedColoniesNative, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  If UC_GG_Marines_Misc.IsRunning()
    UC_GG_Marines_Misc.SetStage(1000)
  EndIf
  Game.GetPlayer().AddAliasedItem(UC_GG_Marines_RecruitmentMaterials as Form, Alias_RecruitmentMaterials as Alias, 3, True)
  Self.UpdateCurrentInstanceGlobal(UC_GG_Marines_LizzyBribe)
  Self.SetObjectiveDisplayedAtTop(100)
  If UC_GG_Marines_PlayerHeardZinaidaPitch.GetValue() < 1.0
    Self.SetObjectiveDisplayed(110, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(110, True)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Game.GetPlayer().RemoveItem(UC_GG_Marines_RecruitmentMaterials as Form, 1, False, None)
  UC_GG_Marines_BonusCount.Mod(1.0)
  If Self.ModObjectiveGlobal(1.0, UC_GG_Marines_DropoffsCompleted, 100, UC_GG_Marines_TotalDropoffs.GetValue(), True, True, True, False)
    Self.SetStage(500)
  EndIf
  If UC_GG_Marines_BonusCount.GetValue() >= 3.0
    Self.SetStage(499)
  EndIf
  DialogueGagarin_UC_GG.SetStage(1200)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetStage(310)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Game.GetPlayer().RemoveItem(UC_GG_Marines_RecruitmentMaterials as Form, 1, False, None)
  If Self.ModObjectiveGlobal(1.0, UC_GG_Marines_DropoffsCompleted, 100, UC_GG_Marines_TotalDropoffs.GetValue(), True, True, True, False)
    Self.SetStage(500)
  EndIf
EndFunction

Function Fragment_Stage_0310_Item_00()
  UC_GG_Marines_BonusCount.Mod(1.0)
  Self.SetStage(300)
  If UC_GG_Marines_BonusCount.GetValue() >= 3.0
    Self.SetStage(499)
  EndIf
  DialogueGagarin_UC_GG.SetStage(1210)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Game.GetPlayer().RemoveItem(UC_GG_Marines_RecruitmentMaterials as Form, 1, False, None)
  If Self.ModObjectiveGlobal(1.0, UC_GG_Marines_DropoffsCompleted, 100, UC_GG_Marines_TotalDropoffs.GetValue(), True, True, True, False)
    Self.SetStage(500)
  EndIf
EndFunction

Function Fragment_Stage_0410_Item_00()
  UC_GG_Marines_BonusCount.Mod(1.0)
  Self.SetStage(400)
  If UC_GG_Marines_BonusCount.GetValue() >= 3.0
    Self.SetStage(499)
  EndIf
  DialogueGagarin_UC_GG.SetStage(1220)
EndFunction

Function Fragment_Stage_0415_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, UC_GG_Marines_LizzyBribe.GetValueInt(), False, None)
  Self.SetStage(410)
EndFunction

Function Fragment_Stage_0420_Item_00()
  Self.SetStage(410)
EndFunction

Function Fragment_Stage_0499_Item_00()
  Self.SetObjectiveCompleted(110, True)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(500, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
