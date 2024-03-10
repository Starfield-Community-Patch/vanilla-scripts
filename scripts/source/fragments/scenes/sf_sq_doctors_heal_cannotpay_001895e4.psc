ScriptName Fragments:Scenes:SF_SQ_Doctors_Heal_CannotPay_001895E4 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_01_End()
  sq_doctorsscript kmyQuest = Self.GetOwningQuest() as sq_doctorsscript
  kmyQuest.CannotPay()
EndFunction
