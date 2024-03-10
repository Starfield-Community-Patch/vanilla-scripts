ScriptName Fragments:Scenes:SF_MQ101_001_MiningScene_00005636_1 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property ElevatorStaticREF Auto Const mandatory
ObjectReference Property VecteraMineElevator Auto Const mandatory
ObjectReference Property VecteraElevatorButtonREF Auto Const mandatory
ReferenceAlias Property Heller Auto Const
ReferenceAlias Property Lin Auto Const
Armor Property Spacesuit_Miner_Backpack Auto Const mandatory
Armor Property Spacesuit_Miner_Helmet Auto Const mandatory
MusicType Property MUSGenesisSpecialCardTitleOpening Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End()
  Game.HideTitleSequenceMenu()
EndFunction

Function Fragment_Phase_07_End()
  (VecteraMineElevator as elevatormasterscript).ResetElevator()
  ElevatorStaticREF.PlayAnimation("FXLightsOff")
EndFunction

Function Fragment_Phase_09_Begin()
  Game.ShowTitleSequenceMenu()
  Game.StartTitleSequence("bgs_anim")
EndFunction

Function Fragment_Phase_09_End()
  Game.StartTitleSequence("game_logo_anim")
EndFunction

Function Fragment_Phase_10_End()
  Game.StartTitleSequence("LocationCrawl_anim")
EndFunction

Function Fragment_Phase_11_End()
  VecteraElevatorButtonREF.Activate(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function Fragment_Phase_16_Begin()
  ElevatorStaticREF.PlayAnimation("FXLightsOn")
EndFunction
