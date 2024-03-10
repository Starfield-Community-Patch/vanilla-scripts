ScriptName Fragments:Scenes:SF_MS03_Juno_Main_00197E89_1 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property MS03_DecicsionDialogueGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_11_End()
  MS03_DecicsionDialogueGlobal.Mod(1.0)
EndFunction
