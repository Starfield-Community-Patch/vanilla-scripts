ScriptName SQ_ShipRespawnAliasScript Extends ReferenceAlias Const

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akKiller)
  spaceshipreference myShipRef = Self.GetShipRef()
  (Self.GetOwningQuest() as sq_shiprespawnscript).HandleShipDeath(Self as ReferenceAlias)
EndEvent
