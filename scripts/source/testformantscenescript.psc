ScriptName TestFormantSceneScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SceneToStop Auto
Scene Property MyScene Auto

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    SceneToStop.Stop()
    MyScene.Start()
  EndIf
EndEvent
