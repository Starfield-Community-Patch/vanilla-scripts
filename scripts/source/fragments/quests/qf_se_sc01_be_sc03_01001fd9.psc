ScriptName Fragments:Quests:QF_SE_SC01_BE_SC03_01001FD9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property BE_SC03_McGrathEncounterStateGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  BE_SC03_McGrathEncounterStateGlobal.SetValue(2.0)
EndFunction
