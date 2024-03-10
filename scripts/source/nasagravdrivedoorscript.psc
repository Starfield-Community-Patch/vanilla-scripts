ScriptName NASAGravDriveDoorScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ301 Auto Const mandatory
Int Property iAnimatedStage = 170 Auto Const
String Property sAnimationEvent = "Opened" Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  If MQ301.IsCompleted() || MQ301.GetStageDone(iAnimatedStage)
    Self.PlayAnimation("sAnimationEvent")
  EndIf
EndEvent
