ScriptName Fragments:Scenes:SF_SQ_GuardShipsSceneCOPY000_0011C0DD Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_04_End()
  guardshipquestscript kmyQuest = Self.GetOwningQuest() as guardshipquestscript
  kmyQuest.ScanForContraband()
EndFunction
