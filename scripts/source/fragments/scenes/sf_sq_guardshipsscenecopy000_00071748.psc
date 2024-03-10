ScriptName Fragments:Scenes:SF_SQ_GuardShipsSceneCOPY000_00071748 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin()
  guardshipquestscript kmyQuest = Self.GetOwningQuest() as guardshipquestscript
  kmyQuest.ClearScanStatus()
EndFunction

Function Fragment_Phase_04_End()
  guardshipquestscript kmyQuest = Self.GetOwningQuest() as guardshipquestscript
  kmyQuest.ScanForContraband()
EndFunction
