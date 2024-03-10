ScriptName Fragments:Quests:QF_SE_KT08_000FB6BD Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property SE_KT08_DoneOnceGlobal Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  SE_KT08_DoneOnceGlobal.SetValue(1.0)
EndFunction
