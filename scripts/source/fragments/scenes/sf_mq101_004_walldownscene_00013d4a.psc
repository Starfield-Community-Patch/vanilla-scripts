ScriptName Fragments:Scenes:SF_MQ101_004_WallDownScene_00013D4A Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property MQ101_BoringCollision Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_05_End()
  MQ101_BoringCollision.Disable(False)
EndFunction
