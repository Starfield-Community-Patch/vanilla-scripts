ScriptName BuriedArtifact Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group SharedDefaults collapsedonref
  wwiseevent Property VisionAmbient Auto Const
  { The ambient sound that leads into the vision }
  VisualEffect Property VisionEffects Auto Const
  { The visual component of the vision. }
  MusicType Property VisionMusic Auto Const
  { Music To Play during the vision, should be flagged as "Plays One Selection" }
  inputenablelayer Property ArtifactEnableLayer Auto hidden
EndGroup

Bool Property PickupEnabled = False Auto
ObjectReference Property FXlights Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If PickupEnabled
    ArtifactEnableLayer = inputenablelayer.Create()
    ArtifactEnableLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False)
    FXlights.Enable(False)
    PickupEnabled = False
    Self.SendCustomEvent("buriedartifact_OnArtifactAcquireStarted", None)
    If VisionEffects
      VisionEffects.Play(Game.GetPlayer() as ObjectReference, -1.0, None)
    EndIf
    If VisionMusic
      VisionMusic.Add()
    EndIf
    VisionAmbient.PlayAndWait(Game.GetPlayer() as ObjectReference, None, None)
    Self.ArtifactAcquired()
  EndIf
EndEvent

Function ArtifactAcquired()
  If VisionEffects
    VisionEffects.Stop(Game.GetPlayer() as ObjectReference)
  EndIf
  ArtifactEnableLayer.Delete()
  Self.SendCustomEvent("buriedartifact_OnArtifactAcquireEnded", None)
EndFunction
