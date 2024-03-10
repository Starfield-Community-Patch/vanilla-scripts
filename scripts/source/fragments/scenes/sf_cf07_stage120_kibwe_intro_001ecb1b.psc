ScriptName Fragments:Scenes:SF_CF07_Stage120_Kibwe_Intro_001ECB1B Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF_Main Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_06_End()
  CF_Main.SetStage(250)
EndFunction

Function Fragment_Phase_12_End()
  CF_Main.SetStage(250)
EndFunction
