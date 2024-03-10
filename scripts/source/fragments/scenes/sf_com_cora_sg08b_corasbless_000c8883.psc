ScriptName Fragments:Scenes:SF_COM_Cora_SG08b_CorasBless_000C8883 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property COM_Companion_SamCoe Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_07_End()
  COM_Companion_SamCoe.SetStage(802)
EndFunction
