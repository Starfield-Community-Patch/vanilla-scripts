ScriptName Fragments:Quests:QF_DialogueCydonia_Detonatio_0009B72E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CY_DetonationCount Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  dialoguecydoniadetonationquestscript kmyQuest = __temp as dialoguecydoniadetonationquestscript
  kmyQuest.SelectCorrectDetonation()
EndFunction

Function Fragment_Stage_0999_Item_00()
  Quest __temp = Self as Quest
  dialoguecydoniadetonationquestscript kmyQuest = __temp as dialoguecydoniadetonationquestscript
  kmyQuest.DelayQuestEndForLastCall()
EndFunction

Function Fragment_Stage_10000_Item_00()
  Quest __temp = Self as Quest
  dialoguecydoniadetonationquestscript kmyQuest = __temp as dialoguecydoniadetonationquestscript
  If CY_DetonationCount.GetValue() < 1.0
    CY_DetonationCount.Mod(1.0)
  EndIf
  kmyQuest.EndKlaxons()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
