ScriptName TestAustinFGravityScript Extends ObjectReference
{ test script to change gravity on a cell }

;-- Variables ---------------------------------------
Cell currentCell

;-- Properties --------------------------------------
Group RequiredProperties
  Float Property currentGravity Auto Const
  { the gravity you want to set on the cell }
  Float Property modifiedGravity Auto Const
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
        myCell.setGravityScale(currentGravity)
      Else
        currentCell.setGravityScale(currentGravity)
      EndIf
    EndIf
  EndEvent

  Event OnTriggerEnter(ObjectReference akActionRef)
    If akActionRef == Game.getPlayer() as ObjectReference
      currentCell.setGravityScale(modifiedGravity)
    EndIf
  EndEvent

  Event OnTriggerLeave(ObjectReference akActionRef)
    currentCell.setGravityScale(currentGravity)
  EndEvent

  Event OnLoad()
    currentCell = Self.getParentCell()
  EndEvent
EndState
