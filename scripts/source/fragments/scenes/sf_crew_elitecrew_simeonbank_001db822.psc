ScriptName Fragments:Scenes:SF_CREW_EliteCrew_SimeonBank_001DB822 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_04_Begin()
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript
  kmyQuest.UpdateCost()
EndFunction
