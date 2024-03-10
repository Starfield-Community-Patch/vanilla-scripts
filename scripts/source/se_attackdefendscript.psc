ScriptName SE_AttackDefendScript Extends Quest
{ Handles spawning ships for SE_Attack encounters.  Deadcounts must be defined in SEScript and RECollectionAlias scripts for each group }

;-- Variables ---------------------------------------
Int AttackersDeadGroup = 0
Int DefendersDeadGroup = 1
sescript SEQuestScript
Float percentMaxDamage = 0.699999988
Float percentMaxSpeed = 1.0
Float percentMinDamage = 0.100000001

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_AttackersRC Auto Const mandatory
{ RefcollectionAlias that holds all of the enemy ships }
RefCollectionAlias Property Alias_DefendersRC Auto Const mandatory
{ RefcollectionAlias that holds all of the enemy ships }
ActorValue Property Health Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestStarted()
  SEQuestScript = (Self as Quest) as sescript
  Self.SetupShips(Alias_AttackersRC, AttackersDeadGroup)
  Self.SetupShips(Alias_DefendersRC, DefendersDeadGroup)
EndEvent

Function SetupShips(RefCollectionAlias akCurrentRefCol, Int DeadGroup)
  Int I = 0
  Int GroupSize = akCurrentRefCol.GetCount()
  Int DeadCount = 0
  While I < GroupSize
    spaceshipreference currentShip = akCurrentRefCol.GetAt(I) as spaceshipreference
    If currentShip.IsAIEnabled()
      currentShip.SetForwardVelocity(percentMaxSpeed)
      Float DamagePercent = Utility.RandomFloat(percentMinDamage, percentMaxDamage)
      currentShip.DamageValue(Health, currentShip.GetValue(Health) * DamagePercent)
      DeadCount += 1
    EndIf
    I += 1
  EndWhile
  If SEQuestScript
    SEQuestScript.UpdateDeadCountGroupSize(DeadGroup, DeadCount)
  EndIf
EndFunction
