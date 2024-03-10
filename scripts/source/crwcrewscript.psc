ScriptName CRWCrewScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group THIS_SCRIPT_IS_OBSOLETE_AND_SHOULD_BE_REMOVED
  sq_crewscript Property SQ_Crew Auto Const mandatory
  { master crew quest }
  ReferenceAlias Property CrewmanAlias Auto Const mandatory
  { The alias for this crewmember }
EndGroup


;-- Functions ---------------------------------------

Function HireCrew(Float fhiredcost)
  ; Empty function
EndFunction
