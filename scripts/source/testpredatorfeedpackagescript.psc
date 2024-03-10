ScriptName TestPredatorFeedPackageScript Extends Package
{ testing resetting package when entering combat }

;-- Variables ---------------------------------------
Actor combatTarget

;-- Functions ---------------------------------------

Event OnStart(Actor akActor)
  Self.RegisterForRemoteEvent(akActor as ScriptObject, "OnCombatStateChanged")
EndEvent

Event Actor.OnCombatStateChanged(Actor akSource, ObjectReference akTarget, Int aeCombatState)
  If aeCombatState == 1 && (akTarget != combatTarget as ObjectReference)
    combatTarget = akTarget as Actor
    akSource.EvaluatePackage(True)
  EndIf
EndEvent
