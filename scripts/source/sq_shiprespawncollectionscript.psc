ScriptName SQ_ShipRespawnCollectionScript Extends RefCollectionAlias Const

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akSource, ObjectReference akKiller)
  spaceshipreference myShipRef = akSource as spaceshipreference
  (Self.GetOwningQuest() as sq_shiprespawnscript).HandleShipDeathCollection(myShipRef)
EndEvent
