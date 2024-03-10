ScriptName Fragments:Quests:QF_FFCydoniaZ07_0030270B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFCydoniaZ07Misc Auto Const mandatory
LocationAlias Property Alias_Cave Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  If FFCydoniaZ07Misc.IsRunning()
    FFCydoniaZ07Misc.SetStage(1000)
  EndIf
  Location myCave = Alias_Cave.GetLocation()
  If myCave.IsExplored()
    Self.SetStage(10)
  EndIf
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  ffcydoniaz07questscript kmyQuest = __temp as ffcydoniaz07questscript
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  kmyQuest.RegisterOre()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
