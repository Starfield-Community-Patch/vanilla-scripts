ScriptName Fragments:Scenes:SF_SQ_GuardShipsSceneCOPY000_002DFE92 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin()
  guardshipquestscript kmyQuest = Self.GetOwningQuest() as guardshipquestscript
  kmyQuest.ClearScanStatus()
EndFunction

Function Fragment_Phase_03_End()
  guardshipquestscript kmyQuest = Self.GetOwningQuest() as guardshipquestscript
  kmyQuest.ScanForContraband()
EndFunction

Function Fragment_Phase_07_Begin()
  guardshipquestscript kmyQuest = Self.GetOwningQuest() as guardshipquestscript
  kmyQuest.debugAlarmStatus()
EndFunction
