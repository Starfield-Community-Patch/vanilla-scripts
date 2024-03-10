ScriptName Fragments:Quests:QF_SE_KT09_00382392 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property SE_KT09_DoneOnceGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  SE_KT09_DoneOnceGlobal.SetValue(1.0)
EndFunction
