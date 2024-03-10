ScriptName POI026ShipCrashScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool activateOnce = False

;-- Properties --------------------------------------
ObjectReference Property ExplosionLocation Auto Const
Explosion Property ExplosionEffect Auto Const
ObjectReference Property EnableMarkerRef Auto Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If (akActionRef == Game.getplayer() as ObjectReference) && activateOnce == False
    activateOnce = True
    ExplosionLocation.PlaceAtMe(ExplosionEffect as Form, 1, False, False, True, None, None, True)
    EnableMarkerRef.Enable(False)
  EndIf
EndEvent
