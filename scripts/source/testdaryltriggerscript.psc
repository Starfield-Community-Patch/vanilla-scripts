ScriptName TestDarylTriggerScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property EnemySpawnPoint Auto Const mandatory
ObjectReference Property EnemySpawnButton Auto Const mandatory
ActorBase Property EnemyToSpawn Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnLoad()
  Self.RegisterForRemoteEvent(EnemySpawnButton as ScriptObject, "OnActivate")
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  EnemySpawnPoint.PlaceActorAtMe(EnemyToSpawn, 4, None, False, False, True, None, True)
EndEvent
