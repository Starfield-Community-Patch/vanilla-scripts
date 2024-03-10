ScriptName defaultSpawnOnActivateSCRIPT Extends ObjectReference hidden

;-- Variables ---------------------------------------
Bool done = False

;-- Properties --------------------------------------
ActorBase Property ActorToSpawn Auto
ObjectReference Property SpawnAtReference Auto
Bool Property PlayerActivateOnly Auto
Bool Property DoOnce Auto

;-- Functions ---------------------------------------

Event onACTIVATE(ObjectReference akActionRef)
  If !done
    If PlayerActivateOnly
      If akActionRef == Game.getPlayer() as ObjectReference
        SpawnAtReference.placeAtMe(ActorToSpawn as Form, 1, False, False, True, None, None, True)
      EndIf
    ElseIf !PlayerActivateOnly
      SpawnAtReference.placeAtMe(ActorToSpawn as Form, 1, False, False, True, None, None, True)
    EndIf
    If DoOnce
      done = True
    EndIf
  EndIf
EndEvent
