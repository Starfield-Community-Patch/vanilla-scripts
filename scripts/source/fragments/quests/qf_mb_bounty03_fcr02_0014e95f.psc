ScriptName Fragments:Quests:QF_MB_Bounty03_FCR02_0014E95F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FC02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  missionquestscript kmyQuest = __temp as missionquestscript
  Self.SetObjectiveDisplayed(10, True, False)
  If FC02.IsRunning() && FC02.GetStageDone(160)
    FC02.SetStage(170)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  missionquestscript kmyQuest = __temp as missionquestscript
  If FC02.IsRunning() && FC02.GetStageDone(160)
    FC02.SetStage(180)
  EndIf
  kmyQuest.MissionComplete()
  fcrquestscript myFCRQuest = (kmyQuest as Quest) as fcrquestscript
  myFCRQuest.FCRMissionComplete()
EndFunction

Function Fragment_Stage_0100_Item_01()
  Quest __temp = Self as Quest
  missionquestscript kmyQuest = __temp as missionquestscript
  kmyQuest.MissionShutdown()
EndFunction
