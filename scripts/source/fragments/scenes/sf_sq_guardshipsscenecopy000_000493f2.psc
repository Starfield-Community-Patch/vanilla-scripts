ScriptName Fragments:Scenes:SF_SQ_GuardShipsSceneCOPY000_000493F2 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_05_Begin()
  guardshipquestscript kmyQuest = Self.GetOwningQuest() as guardshipquestscript
  kmyQuest.ShowContrabandScanWarning(True)
EndFunction

Function Fragment_Phase_05_End()
  guardshipquestscript kmyQuest = Self.GetOwningQuest() as guardshipquestscript
  kmyQuest.ScanForContraband()
EndFunction
