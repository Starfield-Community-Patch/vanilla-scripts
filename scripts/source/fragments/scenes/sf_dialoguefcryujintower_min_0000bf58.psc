ScriptName Fragments:Scenes:SF_DialogueFCRyujinTower_Min_0000BF58 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property LC044_DRONEDemoRunning Auto Const mandatory
ReferenceAlias Property DemoMiniBot Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  DemoMiniBot.GetActorRef().SetUnconscious(False)
EndFunction

Function Fragment_Phase_02_End()
  LC044_DRONEDemoRunning.SetValue(0.0)
  DemoMiniBot.GetActorRef().SetUnconscious(True)
EndFunction
