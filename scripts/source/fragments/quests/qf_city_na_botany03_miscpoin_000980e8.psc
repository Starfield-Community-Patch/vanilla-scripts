ScriptName Fragments:Quests:QF_City_NA_Botany03_MiscPoin_000980E8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property TreeSoundMarker Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  botany03_waitscript kmyQuest = __temp as botany03_waitscript
  Self.SetObjectiveDisplayed(10, True, False)
  kmyQuest.Wait24()
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  TreeSoundMarker.Enable(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Self.CompleteQuest()
  Self.Stop()
EndFunction
