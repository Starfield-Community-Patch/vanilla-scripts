ScriptName Fragments:Quests:QF_FFDenR01_Startup_0014343A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFDenR01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  FFDenR01.Start()
  Self.Stop()
EndFunction
