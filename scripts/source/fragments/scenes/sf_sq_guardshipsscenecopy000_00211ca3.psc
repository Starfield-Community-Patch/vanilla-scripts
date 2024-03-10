ScriptName Fragments:Scenes:SF_SQ_GuardShipsSceneCOPY000_00211CA3 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_04_Begin()
  guardshipquestscript kmyQuest = Self.GetOwningQuest() as guardshipquestscript
  kmyQuest.ShowContrabandScanWarning(True)
EndFunction

Function Fragment_Phase_04_End()
  guardshipquestscript kmyQuest = Self.GetOwningQuest() as guardshipquestscript
  kmyQuest.ScanForContraband()
EndFunction
