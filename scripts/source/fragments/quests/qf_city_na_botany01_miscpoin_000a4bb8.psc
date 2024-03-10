ScriptName Fragments:Quests:QF_City_NA_Botany01_MiscPoin_000A4BB8 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Self.CompleteQuest()
  Self.Stop()
EndFunction
