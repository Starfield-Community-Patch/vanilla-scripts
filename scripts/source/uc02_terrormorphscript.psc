ScriptName UC02_TerrormorphScript Extends ReferenceAlias

;-- Variables ---------------------------------------
ObjectReference CurrentLureTarget
Int InspectTimerID = 1 Const

;-- Properties --------------------------------------
ReferenceAlias Property ActiveLure Auto Const mandatory
{ Ref alias for the currently active lure }
ReferenceAlias Property LurePathingTarget Auto Const mandatory
{ Ref alias for the active lure pathing target }
Int Property TriggerDistance = 3 Auto Const
{ Once the Terrormorph has gotten this close, kick off the timer for it to ignore the object }
GlobalVariable Property UC02_TerrormorphAttentionLength Auto Const mandatory
{ How long the Terrormorph will hang out here before moving on }
ReferenceAlias Property Hadrian Auto Const mandatory
{ Ref alias for Hadrian }
Int Property StageToSet = 702 Auto Const
{ Stge to set if Hadrian hits the Terrormorph at any point }
GlobalVariable Property UC02_Terrormorph_PlayerTargetPercent Auto Const mandatory
{ If the player gets added to the Morph's combat list, what's the percent chance it'll focus on the player as their target }

;-- Functions ---------------------------------------

Event OnLoad()
  If !Self.GetActorRef().IsDead()
    Self.RegisterForHitEvent(Self.GetRef() as ScriptObject, Hadrian.GetRef() as ScriptObject, None, None, -1, -1, -1, -1, True)
  EndIf
EndEvent

Function RegisterForReachActiveLure(ObjectReference akActiveLure)
  Self.UnregisterForDistanceEvents(Self.GetRef() as ScriptObject, Self.GetRef() as ScriptObject, -1)
  Self.RegisterForDistanceLessThanEvent(Self.GetRef() as ScriptObject, akActiveLure as ScriptObject, TriggerDistance as Float, 0)
  CurrentLureTarget = akActiveLure
EndFunction

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  If !Self.GetActorRef().IsInCombat() && (akObj1 == Self.GetRef() || akObj2 == Self.GetRef()) && (akObj1 == CurrentLureTarget || (akObj2 as Bool == (akObj1 == Self.GetRef() || akObj2 == Self.GetRef())))
    Self.StartTimer(UC02_TerrormorphAttentionLength.GetValue(), InspectTimerID)
  Else
    Self.RegisterForDistanceLessThanEvent(Self.GetRef() as ScriptObject, CurrentLureTarget as ScriptObject, TriggerDistance as Float, 0)
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == InspectTimerID
    ActiveLure.Clear()
    LurePathingTarget.Clear()
    Self.GetActorRef().EvaluatePackage(False)
  EndIf
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  If akAggressor == Hadrian.GetRef()
    If !Self.GetActorRef().IsDead()
      Self.GetOwningQuest().SetStage(StageToSet)
    EndIf
  EndIf
EndEvent

Event OnCombatListAdded(Actor akTarget)
  Actor PlayACT = Game.GetPlayer()
  If akTarget == PlayACT
    Int iRand = Utility.RandomInt(0, 100)
    If iRand <= UC02_Terrormorph_PlayerTargetPercent.GetValueInt()
      Self.GetActorRef().StartCombat(PlayACT as ObjectReference, True)
    EndIf
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
