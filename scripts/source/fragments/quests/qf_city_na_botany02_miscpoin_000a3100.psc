ScriptName Fragments:Quests:QF_City_NA_Botany02_MiscPoin_000A3100 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property TreeSap_Enabler Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  city_na_botany02pointer_wait kmyQuest = __temp as city_na_botany02pointer_wait
  Self.SetObjectiveDisplayed(10, True, False)
  kmyQuest.Wait24()
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  TreeSap_Enabler.Enable(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Self.CompleteQuest()
  Self.Stop()
EndFunction
