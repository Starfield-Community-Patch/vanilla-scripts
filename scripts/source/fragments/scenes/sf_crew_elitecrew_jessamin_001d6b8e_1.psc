ScriptName Fragments:Scenes:SF_CREW_EliteCrew_Jessamin_001D6B8E_1 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_03_Begin()
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript
  kmyQuest.UpdateCost()
EndFunction
