ScriptName Fragments:Quests:QF_MB_Piracy02Far_CFR01_001611BB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CF_TheKey_MissionBoardCounter Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  missionpiracyquestscript kmyQuest = __temp as missionpiracyquestscript
  Self.SetObjectiveCompleted(40, True)
  CF_TheKey_MissionBoardCounter.Mod(1.0)
  kmyQuest.MissionComplete()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  missionpiracyquestscript kmyQuest = __temp as missionpiracyquestscript
  kmyQuest.MissionFailed()
EndFunction
