ScriptName TestChangeGravityScript Extends ObjectReference
{ test script to change gravity on a cell }

;-- Variables ---------------------------------------
Cell currentCell

;-- Properties --------------------------------------
Group RequiredProperties
  Float Property myGravity Auto Const
  { the gravity you want to set on the cell }
EndGroup

Group OptionalProperties
  Cell Property myCell Auto Const
  { set if you want to change gravity on a cell that the player is not currently in }
EndGroup


;-- State -------------------------------------------
State allDone
EndState

;-- State -------------------------------------------
Auto State waiting

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.getPlayer() as ObjectReference
      If myCell
        myCell.setGravityScale(myGravity)
      Else
        currentCell.setGravityScale(myGravity)
      EndIf
    EndIf
  EndEvent

  Event OnTriggerEnter(ObjectReference akActionRef)
    If akActionRef == Game.getPlayer() as ObjectReference
      currentCell.setGravityScale(0.0)
    EndIf
  EndEvent

  Event OnTriggerLeave(ObjectReference akActionRef)
    currentCell.setGravityScale(myGravity)
  EndEvent

  Event OnLoad()
    currentCell = Self.getParentCell()
  EndEvent
EndState
