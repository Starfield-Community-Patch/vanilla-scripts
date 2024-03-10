ScriptName TestNPCChangeType Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorBase[] Property NPCTypes Auto Const mandatory
ObjectReference Property SpawnController Auto Const mandatory

;-- Functions ---------------------------------------

Function CycleNPCType()
  Int index = NPCTypes.find((SpawnController as testnpcsimplespawn).ActorToSpawn, 0)
  If index + 1 >= NPCTypes.Length - 1
    index = 0
  Else
    index += 1
  EndIf
  (SpawnController as testnpcsimplespawn).ActorToSpawn = NPCTypes[index]
EndFunction
