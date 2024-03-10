ScriptName Fragments:Scenes:SF_SQ_Doctors_Heal_Everythin_001895EC Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  sq_doctorsscript kmyQuest = Self.GetOwningQuest() as sq_doctorsscript
  kmyQuest.HealEverything()
EndFunction
