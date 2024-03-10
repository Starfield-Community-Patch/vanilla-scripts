ScriptName Fragments:Quests:QF_City_NA_Viewport02_00270719 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ105 Auto Const mandatory
ReferenceAlias Property Alias_StartMarker Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Quest Property CF06 Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Quest Property City_ER_Peace Auto Const mandatory
Quest Property City_Neon_Drug03 Auto Const mandatory
Quest Property City_NA_Viewport03 Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property City_NA_Viewport01 Auto Const mandatory
GlobalVariable Property City_NA_Viewport02_InvestAmount Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  MQ105.SetStage(2000)
  City_NA_Viewport01.Stop()
  Game.GetPlayer().MoveTo(Alias_StartMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetStage(30)
EndFunction

Function Fragment_Stage_0022_Item_00()
  If Self.GetStageDone(190) == False
    Self.SetObjectiveDisplayed(22, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0023_Item_00()
  If Self.GetStageDone(190) == False
    Self.SetObjectiveDisplayed(23, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(110, True, False)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveDisplayed(120, True, False)
  If City_ER_Peace.GetStageDone(1000)
    Self.SetObjectiveDisplayed(130, True, False)
  EndIf
  If City_Neon_Drug03.GetStageDone(9000)
    Self.SetObjectiveDisplayed(140, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0130_Item_00()
  Quest __temp = Self as Quest
  city_na_viewport02questscript kmyQuest = __temp as city_na_viewport02questscript
  Self.SetObjectiveCompleted(120, True)
  Game.GetPlayer().RemoveItem(Credits as Form, City_NA_Viewport02_InvestAmount.GetValueInt(), False, None)
  If Self.IsObjectiveDisplayed(130) == True
    Self.SetObjectiveDisplayed(130, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(140)
    Self.SetObjectiveDisplayed(140, False, False)
  EndIf
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0140_Item_00()
  Quest __temp = Self as Quest
  city_na_viewport02questscript kmyQuest = __temp as city_na_viewport02questscript
  Self.SetObjectiveCompleted(130, True)
  If Self.IsObjectiveDisplayed(120)
    Self.SetObjectiveDisplayed(120, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(140)
    Self.SetObjectiveDisplayed(140, False, False)
  EndIf
  Self.SetStage(190)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Quest __temp = Self as Quest
  city_na_viewport02questscript kmyQuest = __temp as city_na_viewport02questscript
  Self.SetObjectiveCompleted(140, True)
  If Self.IsObjectiveDisplayed(120)
    Self.SetObjectiveDisplayed(120, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(130)
    Self.SetObjectiveDisplayed(130, False, False)
  EndIf
  Self.SetStage(190)
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetObjectiveDisplayed(190, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives()
EndFunction

Function Fragment_Stage_1000_Item_00()
  City_NA_Viewport03.Start()
  Self.Stop()
EndFunction
