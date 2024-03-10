ScriptName Fragments:Quests:QF_SE_AF07_00134535 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SE_AF07_001_SpawnScene Auto Const
ReferenceAlias Property Alias_TestBeacon Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  se_af07script kmyQuest = __temp as se_af07script
  Self.SetObjectiveDisplayed(10, True, False)
  kmyQuest.StartWaves()
  Alias_TestBeacon.getref().BlockActivation(True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True)
EndFunction
