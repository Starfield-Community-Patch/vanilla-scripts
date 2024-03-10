ScriptName TestSpaceMineScript Extends SpaceshipReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Explosion Property SpaceMineExplosion01 Auto Const mandatory
ReferenceAlias Property PlayerShip Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForDistanceLessThanEvent(PlayerShip as ScriptObject, Self as ScriptObject, 75.0, 0)
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.Kill(None)
EndEvent
