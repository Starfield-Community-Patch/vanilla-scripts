ScriptName Fragments:Quests:QF_FC06Post_010087B5 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property FC06Post_EnableMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  FC06Post_EnableMarker.Enable(False)
EndFunction
