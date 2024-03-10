ScriptName MS04DorianeActivateScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property sceneToPlay Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  sceneToPlay.Start()
EndEvent
