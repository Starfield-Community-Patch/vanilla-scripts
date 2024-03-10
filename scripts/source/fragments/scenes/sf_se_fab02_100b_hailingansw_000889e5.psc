ScriptName Fragments:Scenes:SF_SE_FAB02_100b_HailingAnsw_000889E5 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PSE_FAB02_RunOnce Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_01_End()
  PSE_FAB02_RunOnce.SetValue(1.0)
EndFunction
