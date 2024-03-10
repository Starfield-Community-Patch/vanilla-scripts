ScriptName LegendaryMagicEffectEventSenderScript Extends ActiveMagicEffect
{ Sends event through LegendaryItemQuestScript when magic effect starts and finishes

kArgs[0] = base MagicEffect this script is attached to
kArgs[1] = Target Actor
kArgs[2] = Caster Actor / Aggressor Actor (OnHit)
kArgs[3] = EventType?  (LegendaryItemQuestScript) iEventType_Starting, iEventType_Finishing, iEventType_OnHit
kArgs[4] = EventArg1
kArgs[5] = EventArg2
kArgs[6] = EventArg3 }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AutofillProperties
  legendaryitemquestscript Property LegendaryItemQuest Auto Const mandatory
  { Autofill }
EndGroup

Group FillThisWithThisMagicEffect
  MagicEffect Property ThisMagicEffect Auto Const
  { Fill this property with the MagicEffect base form you have attached this script to.

Why? Because esoteric timing issues:
If you kill an actor in the same moment it applies the effect, 
the active magic effect no longer exists, so GetBaseObject() fails.
And this script needs a pointer to the magic effect in question to pass along in a function call,
so we store it in the property. }
EndGroup

Group Options
  Bool Property SendOnEffectStartEvent = True Auto Const
  { Default: true
Should we send an event when the magic effect is applied? }
  Bool Property SendOnEffectStartFinish = False Auto Const
  { Default: false
Should we send an event when the magic effect finishes?
Only should be true for things with a duration. }
  Bool Property SendOnHitEvent = False Auto Const
  { Default: false
Should we register for OnHit events? 
Only should be true for things with a duration }
EndGroup

Group EventArgs
  Form Property EventArg1 Auto Const
  { Sent as kArgs[4] }
  Form Property EventArg2 Auto Const
  { Sent as kArgs[5] }
  Form Property EventArg3 Auto Const
  { Sent as kArgs[6] }
EndGroup


;-- Functions ---------------------------------------

Function SendLegendaryMagicEffectEvent(Actor akTarget, Actor akCaster, Int EventType)
  Var[] kArgs = new Var[7]
  kArgs[0] = ThisMagicEffect as Var
  kArgs[1] = akTarget as Var
  kArgs[2] = akCaster as Var
  kArgs[3] = EventType as Var
  kArgs[4] = EventArg1 as Var
  kArgs[5] = EventArg2 as Var
  kArgs[6] = EventArg3 as Var
  LegendaryItemQuest.SendLegendaryMagicEffectEvent(kArgs)
EndFunction

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor targetActor = akTarget as Actor
  If targetActor
    If SendOnHitEvent
      Self.RegisterForHitEvent(akTarget as ScriptObject, akCaster as ScriptObject, None, None, -1, -1, -1, -1, True)
    EndIf
    If SendOnEffectStartEvent
      Self.SendLegendaryMagicEffectEvent(targetActor, akCaster, LegendaryItemQuest.iEventType_Starting)
    EndIf
  EndIf
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor targetActor = akTarget as Actor
  If targetActor
    If SendOnEffectStartFinish
      Self.SendLegendaryMagicEffectEvent(targetActor, akCaster, LegendaryItemQuest.iEventType_Finishing)
    EndIf
    Self.UnregisterForAllHitEvents(None)
  EndIf
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Self.SendLegendaryMagicEffectEvent(akTarget as Actor, akAggressor as Actor, LegendaryItemQuest.iEventType_OnHit)
  If SendOnHitEvent
    Self.RegisterForHitEvent(akTarget as ScriptObject, akAggressor as ScriptObject, None, None, -1, -1, -1, -1, True)
  EndIf
EndEvent
