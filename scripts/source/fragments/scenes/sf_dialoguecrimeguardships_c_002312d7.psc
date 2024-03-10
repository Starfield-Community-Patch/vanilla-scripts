ScriptName Fragments:Scenes:SF_DialogueCrimeGuardShips_C_002312D7 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin()
  dialoguecrimeguardsquestscript kmyQuest = Self.GetOwningQuest() as dialoguecrimeguardsquestscript
  kmyQuest.PlayerSmuggling()
EndFunction
