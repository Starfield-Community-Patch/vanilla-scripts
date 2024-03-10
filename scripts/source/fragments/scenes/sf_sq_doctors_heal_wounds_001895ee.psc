ScriptName Fragments:Scenes:SF_SQ_Doctors_Heal_Wounds_001895EE Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_01_End()
  sq_doctorsscript kmyQuest = Self.GetOwningQuest() as sq_doctorsscript
  kmyQuest.HealWounds()
EndFunction
