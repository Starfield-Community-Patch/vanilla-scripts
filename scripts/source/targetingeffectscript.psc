ScriptName TargetingEffectScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------
Bool modifySuccess

;-- Properties --------------------------------------
GlobalVariable Property MaxEnemiesThatCanBeAffected Auto Const mandatory
targetingskillplayeraliasscript Property TargetingSkillPlayer Auto Const mandatory
EffectShader Property EffectShaderToApply Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  modifySuccess = TargetingSkillPlayer.TryToModifyTargetCount(1, MaxEnemiesThatCanBeAffected.GetValueInt())
  If !modifySuccess
    Self.Dispel()
    EffectShaderToApply.Stop(akTarget)
  Else
    EffectShaderToApply.Play(akTarget, -1.0)
  EndIf
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If modifySuccess
    TargetingSkillPlayer.TryToModifyTargetCount(-1, 0)
    EffectShaderToApply.Stop(akTarget)
  EndIf
EndEvent
