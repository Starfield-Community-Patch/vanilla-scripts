ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_Coffee_001136DB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Potion Property TerraCino Auto Const
GlobalVariable Property QuestTimer Auto Const
GlobalVariable Property DaysPassed Auto Const
GlobalVariable Property QuestCompleted Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().RemoveItem(TerraCino as Form, 1, False, None)
  Self.CompleteAllObjectives()
  QuestTimer.SetValue(DaysPassed.GetValue() + 1.0)
  QuestCompleted.Mod(1.0)
  Self.Stop()
EndFunction
