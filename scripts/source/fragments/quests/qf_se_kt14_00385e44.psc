ScriptName Fragments:Quests:QF_SE_KT14_00385E44 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property SE_KT14_DoneOnceGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  SE_KT14_DoneOnceGlobal.SetValue(1.0)
EndFunction
