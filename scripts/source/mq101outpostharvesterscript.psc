ScriptName MQ101OutpostHarvesterScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Location Property SystemNarionPlanetAnselonMoonNexum Auto Const mandatory
Quest Property MQ101 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnWorkshopObjectPlaced(ObjectReference akReference)
  If Game.GetPlayer().IsInLocation(SystemNarionPlanetAnselonMoonNexum) && MQ101.GetStageDone(900) == False
    MQ101.SetStage(740)
  EndIf
EndEvent
