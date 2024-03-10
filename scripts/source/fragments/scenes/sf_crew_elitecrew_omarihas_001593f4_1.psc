ScriptName Fragments:Scenes:SF_CREW_EliteCrew_OmariHas_001593F4_1 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_03_Begin()
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript
  kmyQuest.UpdateCost()
EndFunction
