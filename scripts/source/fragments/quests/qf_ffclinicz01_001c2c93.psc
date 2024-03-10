ScriptName Fragments:Quests:QF_FFClinicZ01_001C2C93 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Potion Property Food_RS_DawnsRoost_SteerLiverPate Auto Const mandatory
GlobalVariable Property GameDaysPassed Auto Const
GlobalVariable Property FFClinicZ01Timer Auto Const
GlobalVariable Property StoryManager_ClinicLoad Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  StoryManager_ClinicLoad.Mod(1.0)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.CompleteAllObjectives()
  Game.GetPlayer().RemoveItem(Food_RS_DawnsRoost_SteerLiverPate as Form, 1, False, None)
  FFClinicZ01Timer.SetValue(GameDaysPassed.GetValue() + 1.0)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.Stop()
EndFunction
