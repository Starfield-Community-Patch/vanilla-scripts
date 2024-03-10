ScriptName Fragments:Quests:QF_LC088_002BF36A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
lc082_vigilancequestscript Property LC082 Auto Const mandatory
Quest Property CF01 Auto Const mandatory
Quest Property CF02 Auto Const mandatory
Quest Property LC088_Space Auto Const mandatory
Quest Property LC088_Vigilance Auto Const mandatory
Quest Property LC088_Key Auto Const mandatory
Quest Property CF03 Auto Const mandatory
Quest Property CF04 Auto Const mandatory
Quest Property CF05 Auto Const mandatory
Quest Property CF06 Auto Const mandatory
Location Property LC082VigilanceCF07Location Auto Const mandatory
Location Property LC082VigilanceLocation Auto Const mandatory
Location Property StationTheKeyParentLocation Auto Const mandatory
Location Property StationTheKeyInteriorLocation Auto Const mandatory
Quest Property CF_Main Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest
  lc088questscript kmyQuest = __temp as lc088questscript
  kmyQuest.QuickstartSpace(33, 0, 0, 0, 0, 0, 0, 0, 0)
  LC088_Space.SetStage(4)
EndFunction

Function Fragment_Stage_0010_Item_00()
  LC082.SetStage(11)
  If !CF_Main.GetStageDone(300)
    CF_Main.SetStage(20)
  EndIf
  CF01.Stop()
  CF02.Stop()
  CF03.Stop()
  CF04.Stop()
  CF05.Stop()
  CF06.Stop()
  LC082VigilanceCF07Location.Reset()
  LC082VigilanceLocation.Reset()
  StationTheKeyParentLocation.Reset()
  StationTheKeyInteriorLocation.Reset()
EndFunction

Function Fragment_Stage_2000_Item_00()
  LC088_Space.SetStage(2000)
  If LC088_Vigilance.IsRunning()
    LC088_Vigilance.SetStage(2000)
  EndIf
  If LC088_Key.IsRunning()
    LC088_Key.SetStage(2000)
  EndIf
  Self.Stop()
EndFunction
