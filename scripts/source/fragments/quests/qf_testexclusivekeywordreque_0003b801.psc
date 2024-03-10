ScriptName Fragments:Quests:QF_TestExclusiveKeywordReque_0003B801 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_dungeonMapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().Moveto(Alias_dungeonMapMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
EndFunction
