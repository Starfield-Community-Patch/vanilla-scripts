ScriptName FXScripts:CameraAttachScriptFX Extends ObjectReference
{ Attaches a camera attach fx based on the property set in the reference. }

;-- Variables ---------------------------------------
Actor Player
Int TriggerCounter = 0
Int instanceID

;-- Properties --------------------------------------
VisualEffect Property CameraAttachFX Auto Const
{ Particle art to attach to camera, fog by default }
VisualEffect Property CameraAttachFX2 Auto Const
{ 2nd Particle art to attach to camera, not used by default }
wwiseevent Property LoopSoundEvent Auto Const
{ specify sound fx to play, set on reference, none by default }
Int Property timeLimit = 180 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Player = Game.getPlayer()
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == Player as ObjectReference
    TriggerCounter += 1
    If TriggerCounter > 0
      CameraAttachFX.Play(Player as ObjectReference, timeLimit as Float, None)
      If CameraAttachFX2
        CameraAttachFX2.Play(Player as ObjectReference, timeLimit as Float, None)
      EndIf
      If LoopSoundEvent
        instanceID = LoopSoundEvent.Play(Self as ObjectReference, None, None)
      EndIf
    EndIf
  EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  If akActionRef == Player as ObjectReference
    TriggerCounter -= 1
    CameraAttachFX.Stop(Player as ObjectReference)
    If CameraAttachFX2
      CameraAttachFX2.Stop(Player as ObjectReference)
    EndIf
    If LoopSoundEvent
      wwiseevent.StopInstance(instanceID)
    EndIf
  EndIf
EndEvent

Event OnCellDetach()
  TriggerCounter = 0
  CameraAttachFX.Stop(Player as ObjectReference)
  If CameraAttachFX2
    CameraAttachFX2.Stop(Player as ObjectReference)
  EndIf
  If LoopSoundEvent
    wwiseevent.StopInstance(instanceID)
  EndIf
EndEvent

Event OnUnLoad()
  TriggerCounter = 0
  CameraAttachFX.Stop(Player as ObjectReference)
  If CameraAttachFX2
    CameraAttachFX2.Stop(Player as ObjectReference)
  EndIf
  If LoopSoundEvent
    wwiseevent.StopInstance(instanceID)
  EndIf
  Player = None
EndEvent
