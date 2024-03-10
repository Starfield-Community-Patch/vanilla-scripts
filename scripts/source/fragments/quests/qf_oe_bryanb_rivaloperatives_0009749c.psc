ScriptName Fragments:Quests:QF_OE_BryanB_RivalOperatives_0009749C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property OE_BryanB_BrotherInNeed_TalkToSamScene Auto Const
Scene Property OE_BryanB_BrotherInNeed_SamLivesScene Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest
  oescript kmyQuest = __temp as oescript
EndFunction
