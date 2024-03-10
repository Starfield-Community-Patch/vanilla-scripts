ScriptName Fragments:Scenes:SF_MQ302_196_ShiftTriggerCom_0015578E Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript
  kmyQuest.SetPlayerControlsEnabled(False)
EndFunction

Function Fragment_End()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript
  kmyQuest.SetPlayerControlsEnabled(True)
EndFunction
