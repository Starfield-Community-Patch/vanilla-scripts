ScriptName TerrormorphMindControlEffectScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------
Actor CastingActor
Actor OriginalTarget
Bool bEffectComplete
Int eventInstance1 = 0
Int eventInstance2 = 0
Float initialAssistance = -1.0

;-- Properties --------------------------------------
Quest Property UC_TerrormorphSupportQuest Auto Const mandatory
{ Quest to start playing if this is the player }
wwiseevent Property EventForm1 Auto Const mandatory
{ First Wwise event to play }
wwiseevent Property EventForm2 Auto Const mandatory
{ Second Wwise event to play }
String Property GlobalStateGroup Auto Const mandatory
{ State group name from Wwise. String must match what's in Wwise. }
String Property GlobalStateActive Auto Const mandatory
{ Active State name from Wwise. String must match what's in Wwise. }
String Property GlobalStateInactive Auto Const mandatory
{ Inactive State name from Wwise. String must match what's in Wwise. }
Quest Property DialogueUCFactionAlwaysOn Auto Const mandatory
{ Parent quest used to track the mind control custom event }
RefCollectionAlias Property Thralls Auto Const mandatory
{ Failsafe ref collection for the thralls to clean up their voicetype }
Bool Property DispelOnBleedout = True Auto Const
{ Set to true on NPCs you want to lose the effect on bleedout }

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If !bEffectComplete
    CastingActor = akCaster
    Self.RegisterForRemoteEvent(CastingActor as ScriptObject, "OnDeath")
    If DispelOnBleedout
      Self.RegisterForRemoteEvent(CastingActor as ScriptObject, "OnEnterBleedOut")
    EndIf
    If akTarget == Game.GetPlayer() as ObjectReference
      UC_TerrormorphSupportQuest.Start()
      (UC_TerrormorphSupportQuest as uc_terrormorphsupportscript).SourceTerrormorph.ForceRefTo(CastingActor as ObjectReference)
      wwiseevent.SetGlobalState(GlobalStateGroup, GlobalStateActive)
    Else
      Actor TargetActor = akTarget as Actor
      If TargetActor
        OriginalTarget = TargetActor
        ucparentfactionquestscript ParentQuest = DialogueUCFactionAlwaysOn as ucparentfactionquestscript
        ParentQuest.StartMindControlBehavior(TargetActor, akCaster)
      EndIf
    EndIf
  EndIf
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If !bEffectComplete
    bEffectComplete = True
  EndIf
  If akTarget == Game.GetPlayer() as ObjectReference
    UC_TerrormorphSupportQuest.Stop()
    wwiseevent.SetGlobalState(GlobalStateGroup, GlobalStateInactive)
  Else
    Actor TargetActor = akTarget as Actor
    If TargetActor
      (DialogueUCFactionAlwaysOn as ucparentfactionquestscript).StopMindControlBehavior(TargetActor)
    EndIf
  EndIf
  Self.UnregisterForRemoteEvent(CastingActor as ScriptObject, "OnDeath")
  Self.UnregisterForRemoteEvent(CastingActor as ScriptObject, "OnEnterBleedOut")
  CastingActor = None
  OriginalTarget = None
EndEvent

Event Actor.OnDeath(Actor akSender, ObjectReference akKiller)
  If akSender == CastingActor
    Self.CleanUpEffect()
  EndIf
EndEvent

Event Actor.OnEnterBleedout(Actor akSender)
  If akSender == CastingActor
    Self.CleanUpEffect()
  EndIf
EndEvent

Function CleanUpEffect()
  If !bEffectComplete
    bEffectComplete = True
  EndIf
  (DialogueUCFactionAlwaysOn as ucparentfactionquestscript).StopMindControlBehavior(OriginalTarget)
  Self.UnregisterForRemoteEvent(CastingActor as ScriptObject, "OnDeath")
  Self.UnregisterForRemoteEvent(CastingActor as ScriptObject, "OnEnterBleedOut")
  CastingActor = None
  OriginalTarget = None
  Self.Dispel()
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
