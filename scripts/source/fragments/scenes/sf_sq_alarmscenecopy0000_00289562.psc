ScriptName Fragments:Scenes:SF_SQ_AlarmSceneCOPY0000_00289562 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_04_End()
  sq_alarmscript kmyQuest = Self.GetOwningQuest() as sq_alarmscript
  kmyQuest.SetAlarmed(True)
EndFunction
