ScriptName TestAudioObjectScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property TestAudioActor Auto Const
Scene Property SceneToPlay Auto Const
Scene[] Property AdditionalScenesToStop Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    SceneToPlay.Stop()
    If AdditionalScenesToStop.Length > 0
      Int I = 0
      Int iLength = AdditionalScenesToStop.Length
      While I < iLength
        AdditionalScenesToStop[I].Stop()
        I += 1
      EndWhile
    EndIf
    TestAudioActor.ForceRefTo(Self as ObjectReference)
    SceneToPlay.Start()
  EndIf
EndEvent
