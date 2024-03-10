ScriptName ReturnUnityTriggerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property LeftUnityStage = 300 Auto Const
Int Property ReturnUnityObjective = 120 Auto Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Actor PlayerREF = Game.GetPlayer()
  Quest myMQ305 = Self.GetOwningQuest()
  If (akActionRef == PlayerREF as ObjectReference) && myMQ305.GetStageDone(LeftUnityStage)
    (myMQ305 as mq305script).LockPlayerControlsUnity()
    myMQ305.SetObjectiveCompleted(ReturnUnityObjective, True)
    (Self.GetOwningQuest() as mq305script).EnableUnityEndScenes()
  EndIf
EndEvent
