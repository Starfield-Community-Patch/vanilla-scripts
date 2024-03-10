ScriptName PersonalAtmosphereAudioEffectScript Extends ActiveMagicEffect
{ Effect script for the Personal Atmosphere spell. Attaches an audio occlusion sphere to the target. }

;-- Variables ---------------------------------------
ObjectReference occlusionMarker
ObjectReference occlusionPivot

;-- Properties --------------------------------------
Quest Property PersonalAtmosphereFXQuest Auto Const mandatory
ReferenceAlias Property PersonalAtmospherePackin Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor player = Game.GetPlayer()
  If akTarget == player as ObjectReference
    PersonalAtmosphereFXQuest.Start()
    occlusionPivot = PersonalAtmospherePackin.GetRef()
    occlusionMarker = occlusionPivot.GetLinkedRef(None)
    occlusionMarker.MoveTo(player as ObjectReference, 0.0, 0.0, 0.0, True, False)
    occlusionMarker.AttachTo(akTarget)
  EndIf
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If akTarget == Game.GetPlayer() as ObjectReference
    PersonalAtmosphereFXQuest.Stop()
    occlusionPivot.Delete()
    occlusionMarker.Delete()
  EndIf
EndEvent
