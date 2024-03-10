ScriptName Fragments:Quests:QF_City_AkilaLife04_0100352C Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
