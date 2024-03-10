ScriptName Fragments:Quests:QF_RAD03_0021710A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property Alias_MissionBoardLoc Auto Const mandatory
Keyword Property Mission_LocationPriorityCargoMission Auto Const mandatory
missionparentscript Property MB_Parent Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  rad03questscript kmyQuest = __temp as rad03questscript
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
