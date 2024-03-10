ScriptName Fragments:Quests:QF_City_NA_Botany03_FlowerSt_0006D59B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property EnableMarker1 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  EnableMarker1.enable(False)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.stop()
EndFunction
