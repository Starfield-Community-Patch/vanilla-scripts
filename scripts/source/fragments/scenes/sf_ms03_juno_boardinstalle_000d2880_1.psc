ScriptName Fragments:Scenes:SF_MS03_Juno_BoardInstalle_000D2880_1 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property Juno00 Auto Const

;-- Functions ---------------------------------------

Function Fragment_End()
  Game.StopDialogueCamera(False, False)
EndFunction

Function Fragment_Phase_02_Begin()
  Juno00.PlayAnimation("SequenceA02")
EndFunction
