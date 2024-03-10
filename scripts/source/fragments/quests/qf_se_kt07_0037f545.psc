ScriptName Fragments:Quests:QF_SE_KT07_0037F545 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property SE_KT07_DoneOnceGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  SE_KT07_DoneOnceGlobal.SetValue(1.0)
EndFunction
