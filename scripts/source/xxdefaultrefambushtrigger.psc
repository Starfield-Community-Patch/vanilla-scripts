ScriptName xxDefaultRefAmbushTrigger Extends ObjectReference Const default
{ set the AmbushTriggered actor value on this ref when player enters }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
  ActorValue Property AmbushTriggered Auto Const mandatory
  { autofill }
  Keyword Property LinkAmbushTrigger Auto Const mandatory
  { autofill }
EndGroup

Group Optional_Properties
  Bool Property TriggerIfAnyLinkedActorEntersCombat = True Auto Const
  { TRUE = any linked actor that enters combat sets AmbushTriggered to 1
	  FALSE = only set AmbushTrigger to 1 if player enters me }
EndGroup


;-- Functions ---------------------------------------

Event OnCellLoad()
  If TriggerIfAnyLinkedActorEntersCombat
    Actor[] myChildren = Self.GetRefsLinkedToMe(LinkAmbushTrigger, None) as Actor[]
    Int I = 0
    While I < myChildren.Length
      Self.RegisterForRemoteEvent(myChildren[I] as ScriptObject, "OnCombatStateChanged")
      I += 1
    EndWhile
  EndIf
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    Self.TriggerAmbush()
  EndIf
EndEvent

Function TriggerAmbush()
  Self.SetValue(AmbushTriggered, 1.0)
  Actor[] myChildren = Self.GetRefsLinkedToMe(LinkAmbushTrigger, None) as Actor[]
  Int I = 0
  While I < myChildren.Length
    myChildren[I].EvaluatePackage(False)
    I += 1
  EndWhile
EndFunction

Event Actor.OnCombatStateChanged(Actor akSource, ObjectReference akTarget, Int aeCombatState)
  If aeCombatState == 1
    Self.SetValue(AmbushTriggered, 1.0)
  EndIf
EndEvent
