ScriptName Fragments:Scenes:SF_SQ_Doctors_Heal_Afflictio_001895ED Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_01_End()
  sq_doctorsscript kmyQuest = Self.GetOwningQuest() as sq_doctorsscript
  kmyQuest.HealAfflictions()
EndFunction
