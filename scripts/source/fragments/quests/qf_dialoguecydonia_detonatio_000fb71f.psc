ScriptName Fragments:Quests:QF_DialogueCydonia_Detonatio_000FB71F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property DialogueCydoniaDetonationQuestStartKeyword Auto Const mandatory
GlobalVariable Property CY_DetonationCount Auto Const mandatory
RefCollectionAlias Property Alias_DetonationFirstTimeTriggers Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  cydetonationhelperquestscript kmyQuest = __temp as cydetonationhelperquestscript
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_DetonationFirstTimeTriggers.DisableAll(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
