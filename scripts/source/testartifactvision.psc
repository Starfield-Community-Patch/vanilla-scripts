ScriptName TestArtifactVision Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
VisualEffect Property P_ArtifactVisionFX_AO Auto Const mandatory
wwiseevent Property P_AMBArtifactVisionAEvent Auto Const mandatory
ObjectReference Property P_LightsOff Auto Const
ImageSpaceModifier Property P_FadetoBlackImod Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    inputenablelayer myLayer = inputenablelayer.Create()
    myLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False)
    P_ArtifactVisionFX_AO.Play(Game.GetPlayer() as ObjectReference, 35.0, None)
    P_LightsOff.Disable(False)
    Int instanceID = P_AMBArtifactVisionAEvent.Play(Game.GetPlayer() as ObjectReference, None, None)
    If P_AMBArtifactVisionAEvent.PlayAndWait(Game.GetPlayer() as ObjectReference, None, None)
      myLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True)
      P_LightsOff.Enable(False)
      P_FadetoBlackImod.Apply(1.0)
    EndIf
    Utility.wait(2.0)
    P_FadetoBlackImod.Remove()
  EndIf
EndEvent
