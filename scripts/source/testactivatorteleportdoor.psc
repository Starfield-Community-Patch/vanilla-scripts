ScriptName TestActivatorTeleportDoor Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property TeleportTargetRef Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  akActionRef.moveto(TeleportTargetRef, 0.0, 0.0, 0.0, True, False)
EndEvent
