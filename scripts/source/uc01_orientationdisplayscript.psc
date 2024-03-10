ScriptName UC01_OrientationDisplayScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SceneToPlay Auto Const mandatory
ReferenceAlias Property StarterLight Auto Const mandatory
{ Alias for the light paired to this display. Used to turn off all the lights if the player stops the sequence }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForCustomEvent((Self.GetOwningQuest() as uc01_orientationdisplayquestscript) as ScriptObject, "uc01_orientationdisplayquestscript_HaltOrientationScenes")
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If !SceneToPlay.IsPlaying()
    (Self.GetOwningQuest() as uc01_orientationdisplayquestscript).SendHaltScenes(Self.GetRef())
    SceneToPlay.Start()
  EndIf
EndEvent

Event UC01_OrientationDisplayQuestScript.HaltOrientationScenes(uc01_orientationdisplayquestscript akSenderRef, Var[] akargs)
  ObjectReference TriggeringDisplay = akargs[0] as ObjectReference
  If TriggeringDisplay != Self.GetRef() && SceneToPlay.IsPlaying()
    SceneToPlay.Stop()
    (StarterLight.GetRef() as uc01_lighttimingrefscript).TriggerLightUpdate(True)
  EndIf
EndEvent
