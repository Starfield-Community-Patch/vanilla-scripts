ScriptName Fragments:Quests:QF_FFCydoniaR03_0023E9B7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FFCydoniaR03_BookNumber Auto Const mandatory
ReferenceAlias Property Alias_BookAlias Auto Const mandatory
Quest Property FFCydoniaR03Misc Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().AddItem(Alias_BookAlias.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  FFCydoniaR03Misc.SetStage(1000)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_0301_Item_00()
  Quest __temp = Self as Quest
  ffcydoniar03questscript kmyQuest = __temp as ffcydoniar03questscript
  kmyQuest.RemoveBook()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest
  ffcydoniar03questscript kmyQuest = __temp as ffcydoniar03questscript
  Self.CompleteAllObjectives()
  kmyQuest.BookReward()
  FFCydoniaR03_BookNumber.Mod(1.0)
  Self.Stop()
EndFunction
