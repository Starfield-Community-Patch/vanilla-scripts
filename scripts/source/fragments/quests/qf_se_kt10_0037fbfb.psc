ScriptName Fragments:Quests:QF_SE_KT10_0037FBFB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property SE_KT10_DoneOnceGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  SE_KT10_DoneOnceGlobal.SetValue(1.0)
EndFunction
