ScriptName DefaultOnEnterMultiActor Extends ObjectReference conditional default
{ script to test if one or more actors are in a trigger }

;-- Variables ---------------------------------------
Bool bSendEvent = False
Int targetCountCurrent
Int targetCountTotal

;-- Properties --------------------------------------
Group Required_Properties
  ActorBase[] Property TriggerActors Auto Const
  { actors that trigger is looking for - all actors in array must be in trigger
	NOTE: There must be at least one item in either TriggerActors or TriggerAliases }
  ReferenceAlias[] Property TriggerAliases Auto Const
  { Ref Aliases that trigger is looking for - all actors in array must be in trigger
	NOTE: There must be at least one item in either TriggerActors or TriggerAliases }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log. }
EndGroup

Bool Property bAllTargetsInTrigger = False Auto conditional hidden

;-- Functions ---------------------------------------

Function TriggerMe()
  ; Empty function
EndFunction

Event OnInit()
  Int ActorArrayLength = TriggerActors.Length
  Int AliasArrayLength = TriggerAliases.Length
  targetCountTotal = ActorArrayLength + AliasArrayLength
EndEvent

Function modTargetCount(Int modValue)
  targetCountCurrent += modValue
  If targetCountCurrent >= targetCountTotal
    If bAllTargetsInTrigger == False
      bAllTargetsInTrigger = True
      bSendEvent = True
    Else
      bSendEvent = False
    EndIf
  ElseIf bAllTargetsInTrigger == True
    bAllTargetsInTrigger = False
    bSendEvent = True
  Else
    bSendEvent = False
  EndIf
  If bSendEvent == True
    Var[] kargs = new Var[1]
    kargs[0] = bAllTargetsInTrigger as Var
    Self.SendCustomEvent("defaultonentermultiactor_MultiActorTriggerReady", kargs)
  EndIf
EndFunction

Bool Function CheckTriggerRef(ObjectReference triggerRef)
  Bool bSuccess = False
  If triggerRef
    Actor triggerActor = triggerRef as Actor
    If triggerActor
      ActorBase triggerActorBase = triggerActor.GetBaseObject() as ActorBase
      If TriggerActors.find(triggerActorBase, 0) >= 0
        bSuccess = True
      EndIf
    EndIf
    If !bSuccess
      Int AliasArrayElement = commonarrayfunctions.FindInReferenceAliasArray(triggerRef, TriggerAliases)
      If AliasArrayElement < 0
        bSuccess = False
      Else
        bSuccess = True
      EndIf
      If bSuccess == False
        
      EndIf
    EndIf
  EndIf
  Return bSuccess
EndFunction

;-- State -------------------------------------------
Auto State waiting

  Event OnTriggerLeave(ObjectReference triggerRef)
    If Self.CheckTriggerRef(triggerRef)
      Self.modTargetCount(-1)
    EndIf
  EndEvent

  Event onTriggerEnter(ObjectReference triggerRef)
    If Self.CheckTriggerRef(triggerRef)
      Self.modTargetCount(1)
      If bAllTargetsInTrigger
        Self.TriggerMe()
      EndIf
    EndIf
  EndEvent
EndState
