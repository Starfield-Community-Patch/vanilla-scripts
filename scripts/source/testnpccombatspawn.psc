ScriptName TestNPCCombatSpawn Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference SpawnControllerFromLink = Self.GetLinkedRef(None)
  If SpawnControllerFromLink
    (SpawnControllerFromLink as testnpcarenascript).SpawnTeams(Self as ObjectReference)
  EndIf
EndEvent
