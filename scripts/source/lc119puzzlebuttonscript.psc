ScriptName LC119PuzzleButtonScript Extends ObjectReference
{ Turret puzzle button script for LC119. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LC119TurretKeyword Auto Const mandatory
Keyword Property LC119PuzzleDoorLink Auto Const mandatory

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Done")
    Self.GetLinkedRef(LC119PuzzleDoorLink).SetOpen(True)
    ObjectReference[] turretLinks = Self.GetLinkedRefChain(LC119TurretKeyword, 100)
    Int I = 0
    While I < turretLinks.Length
      (turretLinks[I] as Actor).SetUnconscious(True)
      I += 1
    EndWhile
  EndEvent
EndState
