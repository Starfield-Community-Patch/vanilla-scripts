ScriptName Fragments:Scenes:SF_MQ207C_730_TakeArtifact_0022653C Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ00 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  (MQ00 as mq00questscript).PlayArtifactVision()
EndFunction
