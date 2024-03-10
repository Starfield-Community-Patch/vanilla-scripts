ScriptName Fragments:Quests:QF_CRWMarikaBoros_00014380 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property CRWMarikaHire Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0150_Item_00()
  CRWMarikaHire.SetValue(CRWMarikaHire.GetValue() - 100.0)
  Self.UpdateCurrentInstanceGlobal(CRWMarikaHire)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  crwcrewscript kmyQuest = __temp as crwcrewscript
  kmyQuest.HireCrew(CRWMarikaHire.GetValue())
EndFunction
