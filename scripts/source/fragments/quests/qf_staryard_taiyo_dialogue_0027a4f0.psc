ScriptName Fragments:Quests:QF_Staryard_Taiyo_Dialogue_0027A4F0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SY_Taiyo_100_Intro Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Utility.Wait(8.0)
  SY_Taiyo_100_Intro.Start()
EndFunction
