ScriptName Fragments:Quests:QF_MB_Smuggle01_CFR0200_002BCBED_4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CF_TheKey_MissionBoardCounter Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  missioncargoquestscript kmyQuest = __temp as missioncargoquestscript
  Self.SetObjectiveCompleted(10, True)
  CF_TheKey_MissionBoardCounter.Mod(1.0)
  kmyQuest.MissionComplete()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  missioncargoquestscript kmyQuest = __temp as missioncargoquestscript
  kmyQuest.MissionFailed()
EndFunction
