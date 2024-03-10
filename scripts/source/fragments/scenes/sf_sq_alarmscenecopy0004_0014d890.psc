ScriptName Fragments:Scenes:SF_SQ_AlarmSceneCOPY0004_0014D890 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_04_End()
  sq_alarmscript kmyQuest = Self.GetOwningQuest() as sq_alarmscript
  kmyQuest.SetAlarmed(True)
EndFunction
