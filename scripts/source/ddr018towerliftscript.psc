ScriptName DDR018TowerLiftScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property myMoveHelper Auto Const mandatory
ObjectReference Property myMoveMarker Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Utility.Wait(1.5)
  myMoveHelper.TranslateToRef(myMoveMarker, 1.0, 0.0)
EndEvent
