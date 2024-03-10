ScriptName OutpostCrewStationScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_crewscript Property SQ_Crew Auto Const mandatory

;-- Functions ---------------------------------------

Event OnWorkshopObjectRemoved(ObjectReference akReference)
  SQ_Crew.CheckCrewCountAtOutpost(akReference)
EndEvent
