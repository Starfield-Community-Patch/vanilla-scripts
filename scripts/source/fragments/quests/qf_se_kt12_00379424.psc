ScriptName Fragments:Quests:QF_SE_KT12_00379424 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property SE_KT12_DoneOnceGlobal Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  SE_KT12_DoneOnceGlobal.SetValue(1.0)
EndFunction
