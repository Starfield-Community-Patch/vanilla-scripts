ScriptName Fragments:Quests:QF_OE_BryanB_TheImposter_000E55DF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property OE_BryanB_ImposterDone Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0200_Item_00()
  OE_BryanB_ImposterDone.SetValue(1.0)
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest
  oescript kmyQuest = __temp as oescript
EndFunction
