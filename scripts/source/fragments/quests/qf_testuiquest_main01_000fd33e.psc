ScriptName Fragments:Quests:QF_TestUIQuest_Main01_000FD33E Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.setobjectivedisplayed(10, True, False)
  Self.setobjectivedisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.setobjectivecompleted(10, True)
  Self.setobjectivecompleted(20, True)
EndFunction
