ScriptName Fragments:Scenes:SF_CREW_EliteCrew_SophiaGrac_00147952 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_05_Begin()
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript
  kmyQuest.UpdateCost()
EndFunction
