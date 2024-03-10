ScriptName Fragments:Scenes:SF_SQ_AlarmScene_002062CD Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_04_End()
  sq_alarmscript kmyQuest = Self.GetOwningQuest() as sq_alarmscript
  kmyQuest.SetAlarmed(True)
EndFunction
