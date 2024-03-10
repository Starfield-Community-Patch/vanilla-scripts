ScriptName Fragments:Quests:QF_Staryard_Trident_Z_Fuelin_002E57DF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property Staryard_Trident_Z_FuelingGreatness_Timer Auto Const
GlobalVariable Property GameDaysPassed Auto Const
GlobalVariable Property StoryManager_TridentLoad Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  StoryManager_TridentLoad.Mod(1.0)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Staryard_Trident_Z_FuelingGreatness_Timer.SetValue(GameDaysPassed.GetValue() + 1.0)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
