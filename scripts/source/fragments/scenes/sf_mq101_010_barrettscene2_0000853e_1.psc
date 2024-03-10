ScriptName Fragments:Scenes:SF_MQ101_010_BarrettScene2_0000853E_1 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin()
  mq101script kmyQuest = Self.GetOwningQuest() as mq101script
  kmyQuest.VSEnableLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False)
EndFunction

Function Fragment_End()
  mq101script kmyQuest = Self.GetOwningQuest() as mq101script
  kmyQuest.VSEnableLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True)
EndFunction

Function Fragment_Phase_02_Begin()
  Game.StopDialogueCamera(False, False)
  Game.ForceFirstPerson()
EndFunction
