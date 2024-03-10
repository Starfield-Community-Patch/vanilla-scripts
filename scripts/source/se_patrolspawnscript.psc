ScriptName SE_PatrolSpawnScript Extends Quest
{ Handles spawning ships for SE_Patrol encounters.  Deadcounts must be defined in SEScript and RECollectionAlias scripts for each group }

;-- Variables ---------------------------------------
sescript SEQuestScript
Float percentMaxSpeed = 1.0

;-- Properties --------------------------------------
FormList Property PatrollerShipList Auto Const mandatory
{ Formlists that contain all of the ships that can spawn for this encounter }
ReferenceAlias Property Alias_PatrolMarker03 Auto Const mandatory
{ Path the ships will patrol at }
ReferenceAlias[] Property PatrolShips Auto Const
{ Array of individual ReferenceAliases that each ship will go into }
RefCollectionAlias Property Alias_AttackersRC Auto Const mandatory
{ RefCol for holding the ships once spawned }
Int Property minShips = 2 Auto Const
{ The min and max number of ships that can spawn in the patrol }
Int Property offsetDistance = 300 Auto Const
{ How far apart the ships spawn from each other within the group }

;-- Functions ---------------------------------------

Event OnQuestInit()
  SEQuestScript = (Self as Quest) as sescript
  Self.SpawnShips(PatrollerShipList, Alias_AttackersRC, Alias_PatrolMarker03, 0)
EndEvent

Function SpawnShips(FormList akCurrentGroup, RefCollectionAlias akRefColToAddTo, ReferenceAlias akSpawnMarker, Int DeadGroup)
  Int I = 0
  Int maxShips = PatrolShips.Length
  Int GroupSize = Utility.RandomInt(minShips, maxShips)
  Float[] offsets = new Float[6]
  While I < GroupSize
    ObjectReference ADMarker = akSpawnMarker.GetRef()
    offsets[1] = (I * offsetDistance) as Float
    spaceshipreference newShip = ADMarker.PlaceShipAtMe(akCurrentGroup.GetAt(Utility.RandomInt(0, akCurrentGroup.GetSize() - 1)), 4, False, False, False, True, offsets, None, None, True)
    newShip.SetForwardVelocity(percentMaxSpeed)
    akRefColToAddTo.AddRef(newShip as ObjectReference)
    PatrolShips[I].ForceRefTo(newShip as ObjectReference)
    I += 1
  EndWhile
  If SEQuestScript
    SEQuestScript.UpdateDeadCountGroupSize(DeadGroup, akRefColToAddTo.GetCount())
  EndIf
EndFunction
