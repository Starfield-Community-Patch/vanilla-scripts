ScriptName Fragments:Scenes:SF_MS03_Forcegreet_Ryujin_00197E8B Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property Juno00 Auto Const
ObjectReference Property JunoDoor Auto Const

;-- Functions ---------------------------------------

Function Fragment_End()
  Game.StopDialogueCamera(False, False)
EndFunction

Function Fragment_Phase_01_Begin()
  Juno00.PlayAnimation("Play01")
EndFunction

Function Fragment_Phase_01_End()
  JunoDoor.SetOpen(False)
  JunoDoor.Lock(True, False, True)
  JunoDoor.SetLockLevel(254)
EndFunction
