ScriptName Fragments:Quests:QF_CRWLevMotova_00014E56 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CRWLevHire Auto Const mandatory
ReferenceAlias Property Alias_LevMotova Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0150_Item_00()
  CRWLevHire.SetValue(CRWLevHire.GetValue() - 100.0)
  Self.UpdateCurrentInstanceGlobal(CRWLevHire)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  crwcrewscript kmyQuest = __temp as crwcrewscript
  kmyQuest.HireCrew(CRWLevHire.GetValue())
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  crwquestscript kmyQuest = __temp as crwquestscript
  kmyQuest.CrewFired()
EndFunction
