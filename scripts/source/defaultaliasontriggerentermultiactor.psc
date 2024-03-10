ScriptName DefaultAliasOnTriggerEnterMultiActor Extends DefaultAlias conditional default
{ Default script that sets a stage once all of the specified actors are in a trigger.

NOT YET FULLY REIMPLEMENTED.
It will test for stages but not other criteria.
Sorry for the inconvenience.
`Jira 301895: Default Script: fully implement DefaultAliasOnTriggerEnterMultiActor `
Please alert Jon Paul Duvall and we'll try to make this a priority.
Thanks! :) }

;-- Variables ---------------------------------------
Bool lock_CheckTargets

;-- Properties --------------------------------------
Group Required_Properties
  ReferenceAlias[] Property TriggerAliases Auto Const mandatory
  { Ref Aliases the trigger is looking for. All of these actors must be in the trigger in order to set the stage. }
EndGroup

Group Optional_Properties
  Bool Property DisableWhenTriggered = True Auto Const
  { Delete this trigger once triggered. }
EndGroup

Bool Property AllTargetsInTrigger = False Auto conditional hidden

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference triggerRef)
  If commonarrayfunctions.FindInReferenceAliasArray(triggerRef, TriggerAliases) >= 0
    Self.CheckForTargetsInTrigger()
  EndIf
EndEvent

Event OnTriggerLeave(ObjectReference triggerRef)
  If commonarrayfunctions.FindInReferenceAliasArray(triggerRef, TriggerAliases) >= 0
    Self.CheckForTargetsInTrigger()
  EndIf
EndEvent

Function CheckForTargetsInTrigger()
  While lock_CheckTargets
    Utility.Wait(0.100000001)
  EndWhile
  lock_CheckTargets = True
  Bool oldAllTargetsInTrigger = AllTargetsInTrigger
  AllTargetsInTrigger = Self.AreAllTargetsInTrigger()
  If AllTargetsInTrigger
    defaultscriptfunctions.TryToSetStage(Self as ScriptObject, ShowTraces, Self.GetOwningQuest(), StageToSet, PrereqStage, TurnOffStage, TurnOffStageDone, None, False, None, None, None, None, None, None, None, False, None, False, None)
    If DisableWhenTriggered
      Self.TryToDisable()
    EndIf
  EndIf
  If oldAllTargetsInTrigger != AllTargetsInTrigger
    Var[] akArgs = new Var[1]
    akArgs[0] = AllTargetsInTrigger as Var
    Self.SendCustomEvent("defaultaliasontriggerentermultiactor_MultiActorTriggerReady", akArgs)
  EndIf
  lock_CheckTargets = False
EndFunction

Bool Function AreAllTargetsInTrigger()
  ObjectReference[] triggerRefs = new ObjectReference[TriggerAliases.Length]
  Int I = 0
  While I < TriggerAliases.Length
    triggerRefs[I] = TriggerAliases[I].GetRef()
    I += 1
  EndWhile
  Return Self.GetRef().AreAllInTrigger(triggerRefs)
EndFunction
