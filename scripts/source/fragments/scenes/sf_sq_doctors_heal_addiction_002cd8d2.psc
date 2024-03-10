ScriptName Fragments:Scenes:SF_SQ_Doctors_Heal_Addiction_002CD8D2 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_01_End()
  sq_doctorsscript kmyQuest = Self.GetOwningQuest() as sq_doctorsscript
  kmyQuest.HealAddictions()
EndFunction
