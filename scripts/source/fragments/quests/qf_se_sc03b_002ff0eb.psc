ScriptName Fragments:Quests:QF_SE_SC03b_002FF0EB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property BE_SC03_McGrathEncounterStateGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  BE_SC03_McGrathEncounterStateGlobal.SetValue(2.0)
EndFunction
