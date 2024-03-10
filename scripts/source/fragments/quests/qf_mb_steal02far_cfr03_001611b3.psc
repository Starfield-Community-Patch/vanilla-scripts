ScriptName Fragments:Quests:QF_MB_Steal02Far_CFR03_001611B3 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CF_TheKey_MissionBoardCounter Auto Const mandatory
ReferenceAlias Property Alias_GuardSpawn Auto Const mandatory
ReferenceAlias Property Alias_TargetContainer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Alias_GuardSpawn.GetRef().EnableNoWait(False)
  Alias_TargetContainer.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  missionstealquestscript kmyQuest = __temp as missionstealquestscript
  CF_TheKey_MissionBoardCounter.Mod(1.0)
  Alias_GuardSpawn.GetRef().DisableNoWait(False)
  Alias_TargetContainer.GetRef().Disable(False)
  kmyQuest.MissionComplete()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  missionstealquestscript kmyQuest = __temp as missionstealquestscript
  kmyQuest.MissionFailed()
EndFunction
