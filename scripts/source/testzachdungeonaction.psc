ScriptName TestZachDungeonAction Extends ObjectReference

;-- Variables ---------------------------------------
Int hasRun = 0

;-- Properties --------------------------------------
Keyword Property SpawnLink Auto Const mandatory
ActorBase Property EnemyType Auto Const mandatory
Int Property MaxEnemies Auto Const mandatory
ObjectReference Property OptionAMarker Auto Const mandatory
ObjectReference Property OptionBMarker Auto Const mandatory
ObjectReference Property SpawnPoint Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If hasRun == 0
    Self.SetLevelState()
    Self.SpawnEnemies()
  EndIf
EndEvent

Function SpawnEnemies()
  ObjectReference[] Spawnpoints = Self.GetLinkedRefChain(SpawnLink, 100)
  Int numEnemies = Utility.RandomInt(1, MaxEnemies)
  Int I = 0
  While I < numEnemies
    Int l = Spawnpoints.Length
    Int r = Utility.RandomInt(0, l - 1)
    ObjectReference m = Spawnpoints[r]
    SpawnPoint.PlaceActorAtMe(EnemyType, 1, None, False, False, True, None, True)
    Spawnpoints.remove(r, 1)
    I += 1
  EndWhile
EndFunction

Function SetLevelState()
  OptionAMarker.Enable(False)
  OptionBMarker.Enable(False)
  If Utility.RandomInt(0, 1) == 1
    OptionAMarker.Disable(False)
  EndIf
  If Utility.RandomInt(0, 1) == 1
    OptionBMarker.Disable(False)
  EndIf
EndFunction
