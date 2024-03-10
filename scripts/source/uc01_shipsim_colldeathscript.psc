ScriptName UC01_ShipSim_CollDeathScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC01_ShipSim_CurrentWaveEnemyCountDefeated Auto Const mandatory
{ Global used to display how many enemies the player's knocked out in this wave }
Int Property EnemyCountObj = 300 Auto Const
{ Objective to update as the player defeats enemies }

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
  Self.RemoveRef(akSenderRef)
  uc01_shipsimulationquestscript OQ = Self.GetOwningQuest() as uc01_shipsimulationquestscript
  If Self.GetCount() <= 0
    UC01_ShipSim_CurrentWaveEnemyCountDefeated.SetValue(0.0)
    OQ.UpdateCurrentInstanceGlobal(UC01_ShipSim_CurrentWaveEnemyCountDefeated)
    OQ.EnemyDefeated()
  Else
    UC01_ShipSim_CurrentWaveEnemyCountDefeated.Mod(1.0)
    OQ.UpdateCurrentInstanceGlobal(UC01_ShipSim_CurrentWaveEnemyCountDefeated)
    OQ.SetObjectiveDisplayedAtTop(EnemyCountObj)
  EndIf
  Utility.Wait(3.0)
  akSenderRef.Disable(False)
EndEvent
