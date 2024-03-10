ScriptName UC04_ListeningDeviceRefScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC04 Auto Const mandatory
{ Quest to check to unlock this listening device }
Int Property PrereqStage = 300 Auto Const
{ Listening devices can only be triggering once this stage is set }
Int Property ShutdownStage = 450 Auto Const
{ Listening devices can only be triggering once this stage is set }
Scene Property SceneToPlay Auto Const mandatory
{ Which scene we want this listening device to play }

;-- Functions ---------------------------------------

Event OnLoad()
  If !UC04.GetStageDone(PrereqStage)
    Self.BlockActivation(True, True)
  ElseIf Self.IsActivationBlocked()
    Self.BlockActivation(False, False)
  EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If UC04.GetStageDone(PrereqStage) && (akActionRef == Game.GetPlayer() as ObjectReference)
    If !SceneToPlay.IsPlaying()
      SceneToPlay.Start()
    EndIf
  EndIf
EndEvent
