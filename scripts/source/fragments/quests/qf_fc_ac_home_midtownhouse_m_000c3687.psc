ScriptName Fragments:Quests:QF_FC_AC_Home_MidtownHouse_M_000C3687 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.Stop()
EndFunction
