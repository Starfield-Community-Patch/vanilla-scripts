ScriptName LegendaryMagicEffectEventListenScript Extends ActiveMagicEffect
{ Listens to events from LegendaryItemQuestScript originating from LegendaryMagicEffectEventSenderScript

Extend this script, and reimplement "HandleEvent()" function }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
legendaryitemquestscript Property LegendaryItemQuest Auto Const mandatory
{ Autofill }
MagicEffect Property MagicEffectEventSender Auto Const
{ Which Magic Effect is the LegendaryMagicEffectEventSenderScript we are listening for attached?
This script will ignore all events where this does != kArgs[0](the base MagicEffect of the sending ActiveMagicEffect) }

;-- Functions ---------------------------------------

Function HandleEvent(MagicEffect EventMagicEffect, Actor TargetActor, Actor CasterActor, Int EventType, Var EventArg1, Var EventArg2, Var EventArg3)
  ; Empty function
EndFunction

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.RegisterForCustomEvent(LegendaryItemQuest as ScriptObject, "legendaryitemquestscript_LegendaryMagicEffectEvent")
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.UnregisterForCustomEvent(LegendaryItemQuest as ScriptObject, "legendaryitemquestscript_LegendaryMagicEffectEvent")
EndEvent

Event LegendaryItemQuestScript.LegendaryMagicEffectEvent(legendaryitemquestscript akSender, Var[] kArgs)
  If kArgs[0] as MagicEffect == MagicEffectEventSender
    If Self.GetTargetActor() == kArgs[2] as Actor
      Self.HandleEvent(kArgs[0] as MagicEffect, kArgs[1] as Actor, kArgs[2] as Actor, kArgs[3] as Int, kArgs[4], kArgs[5], kArgs[6])
    EndIf
  EndIf
EndEvent
