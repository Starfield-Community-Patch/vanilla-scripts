ScriptName Fragments:Quests:QF__01000815 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property TestHelpMessage Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0030_Item_00()
  TestHelpMessage.ShowAsHelpMessage("Activate", 5.0, 30.0, 3, "", 0, None)
EndFunction
