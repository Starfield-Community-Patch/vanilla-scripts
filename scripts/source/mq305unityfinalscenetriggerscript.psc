ScriptName MQ305UnityFinalSceneTriggerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MQ305_002_Unity_04 Auto Const mandatory
GlobalVariable Property MQ305FinalSceneInt Auto Const mandatory
Int Property iSceneNumber Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    If MQ305_002_Unity_04.IsPlaying() == False
      MQ305_002_Unity_04.Start()
    EndIf
    MQ305FinalSceneInt.SetValueInt(iSceneNumber)
  EndIf
EndEvent
