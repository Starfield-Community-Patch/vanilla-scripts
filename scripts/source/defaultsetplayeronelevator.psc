ScriptName DefaultSetPlayerOnElevator Extends ObjectReference Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property IsPlayerInElevator Auto Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  IsPlayerInElevator.SetValue(1.0)
  Actor[] PlayerFollowers = Game.GetPlayerFollowers()
  Int CurrentFollowerIndex = 0
  While CurrentFollowerIndex < PlayerFollowers.Length
    PlayerFollowers[CurrentFollowerIndex].EvaluatePackage(False)
    CurrentFollowerIndex += 1
  EndWhile
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  IsPlayerInElevator.SetValue(0.0)
  Actor[] PlayerFollowers = Game.GetPlayerFollowers()
  Int CurrentFollowerIndex = 0
  While CurrentFollowerIndex < PlayerFollowers.Length
    PlayerFollowers[CurrentFollowerIndex].EvaluatePackage(False)
    CurrentFollowerIndex += 1
  EndWhile
EndEvent
