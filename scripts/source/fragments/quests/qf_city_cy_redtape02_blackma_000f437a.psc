ScriptName Fragments:Quests:QF_City_CY_RedTape02_Blackma_000F437A Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveFailed(100, True)
  Self.Stop()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
