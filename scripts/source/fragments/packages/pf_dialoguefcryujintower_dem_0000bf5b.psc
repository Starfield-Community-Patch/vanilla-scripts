ScriptName Fragments:Packages:PF_DialogueFCRyujinTower_Dem_0000BF5B Extends Package Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property LC044_DRONEDemoRunning Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  akActor.SetUnconscious(True)
  LC044_DRONEDemoRunning.SetValue(0.0)
EndFunction
