ScriptName MQ104ATempleMapMarkerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet = 405 Auto Const

;-- Functions ---------------------------------------

Event OnMapMarkerDiscovered()
  Self.GetOwningQuest().SetStage(StageToSet)
EndEvent
