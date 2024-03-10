ScriptName Fragments:Quests:QF_MB_BountySpace03_FCR03_0014E95A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FC02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  If FC02.IsRunning() && FC02.GetStageDone(160)
    FC02.SetStage(170)
  EndIf
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  missionbountyspacescript kmyQuest = __temp as missionbountyspacescript
  If FC02.IsRunning() && FC02.GetStageDone(160)
    FC02.SetStage(180)
  EndIf
  kmyQuest.MissionComplete()
  fcrquestscript myFCRQuest = (kmyQuest as Quest) as fcrquestscript
  myFCRQuest.FCRMissionComplete()
EndFunction
