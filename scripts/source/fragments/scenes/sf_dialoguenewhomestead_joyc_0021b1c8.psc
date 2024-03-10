ScriptName Fragments:Scenes:SF_DialogueNewHomestead_Joyc_0021B1C8 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFNewHomesteadR04Misc Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_01_End()
  FFNewHomesteadR04Misc.SetStage(10)
EndFunction
