ScriptName ENV_AFFL_PainEffectScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------
ActorValue HealthAV
Float HealthCached

;-- Properties --------------------------------------
Group Properties
  ActorValue Property Oxygen Auto Const mandatory
  { autofill }
  GlobalVariable Property ENV_AFFL_Symp_Pain_MaxOxygenDamage Auto Const mandatory
  { autofill; multiply damage by this amount to derive how much to damage O2 }
  GlobalVariable Property ENV_AFFL_Symp_Pain_MinOxygenDamage Auto Const mandatory
  { autofill; min amount of O2 damage allowed }
  GlobalVariable Property ENV_AFFL_Symp_Pain_HealthToOxygenMult Auto Const mandatory
  { autofill; max amount of O2 damage allowed }
  Spell Property SpellToCast Auto Const mandatory
  { spell to cast when damaging O2 - this is for the watch warning "reminder" spell }
EndGroup


;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  HealthAV = Game.GetHealthAV()
  HealthCached = akTarget.GetValue(HealthAV)
  Self.RegisterForDamage(akTarget)
EndEvent

Function RegisterForDamage(ObjectReference TargetRef)
  If Self.IsBoundGameObjectAvailable() && TargetRef as Bool
    Self.RegisterForActorValueChangedEvent(TargetRef, HealthAV)
  EndIf
EndFunction

Event OnActorValueChanged(ObjectReference akObjRef, ActorValue akActorValue)
  If akObjRef
    Float currentHealth = akObjRef.GetValue(HealthAV)
    Float change = HealthCached - currentHealth
    HealthCached = currentHealth
    If change > 0.0
      Float O2Dmg = Math.Clamp(change * ENV_AFFL_Symp_Pain_HealthToOxygenMult.GetValue(), ENV_AFFL_Symp_Pain_MinOxygenDamage.GetValue(), ENV_AFFL_Symp_Pain_MaxOxygenDamage.GetValue())
      akObjRef.DamageValue(Oxygen, O2Dmg)
      SpellToCast.Cast(akObjRef, akObjRef)
    EndIf
    Self.RegisterForDamage(akObjRef)
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
