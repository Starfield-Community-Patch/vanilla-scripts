ScriptName AttachAshPile Extends ActiveMagicEffect
{ Scripted effect for on death ash pile }

;-- Variables ---------------------------------------
Actor Victim

;-- Properties --------------------------------------
Float Property fDelay = 0.75 Auto Const
{ time to wait before Spawning Ash Pile }
Float Property fDelayEnd = 1.649999976 Auto Const
{ time to wait before Removing Base Actor }
Float Property ShaderDuration = 0.0 Auto Const
{ Duration of Effect Shader. }
Activator Property AshPileObject Auto Const
{ The object we use as a pile. }
EffectShader Property MagicEffectShader Auto Const
{ The Effect Shader we want. }
Bool Property bSetAlphaZero = True Auto Const
{ When done, set the Actor Alpha to zero. }
Bool Property bSetAlphaToZeroEarly = False Auto Const
{ Use this if we want to set the actor to invisible somewhere before the effect shader is done. }
Bool Property onEffectStartOveride = False Auto Const

;-- Functions ---------------------------------------

Event OnInit()
  Victim = Self.GetTargetActor()
EndEvent

Event OnEffectStart(ObjectReference Target, Actor Caster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If Victim as Bool && Victim.IsEssential() == False
    If onEffectStartOveride == True
      Victim.SetCriticalStage(Victim.CritStage_DisintegrateStart)
      If MagicEffectShader != None
        MagicEffectShader.play(Victim as ObjectReference, ShaderDuration)
      EndIf
      Self.StartTimer(fDelay, 1)
    EndIf
  EndIf
EndEvent

Event OnDying(ObjectReference Killer)
  If Victim as Bool && Victim.IsEssential() == False
    If onEffectStartOveride == False
      Victim.SetCriticalStage(Victim.CritStage_DisintegrateStart)
      If MagicEffectShader != None
        MagicEffectShader.play(Victim as ObjectReference, ShaderDuration)
      EndIf
      Self.StartTimer(fDelay, 1)
    EndIf
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == 1
    Victim.AttachAshPile(AshPileObject as Form)
    Self.StartTimer(fDelayEnd, 2)
  EndIf
  If aiTimerID == 2
    If MagicEffectShader != None
      MagicEffectShader.stop(Victim as ObjectReference)
    EndIf
    If bSetAlphaZero == True
      Victim.SetAlpha(0.0, True)
    EndIf
    Victim.SetCriticalStage(Victim.CritStage_DisintegrateEnd)
  EndIf
EndEvent
