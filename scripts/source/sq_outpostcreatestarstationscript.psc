ScriptName sq_outpostcreatestarstationscript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property planetLocation Auto Const mandatory
ReferenceAlias Property CreatedOrbitalMarker Auto Const mandatory
ReferenceAlias Property CreatedOrbitalPatrolStart Auto Const mandatory
ReferenceAlias Property CreatedOrbitalMapMarker Auto Const mandatory
ReferenceAlias Property Starstation Auto Const mandatory
RefCollectionAlias Property Ships Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  ; Empty function
EndEvent
