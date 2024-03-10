ScriptName LC017_RobotDeath Extends Actor Const
{ Set Linked References to Unconcious On Death }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkRobotToTurret Auto Const

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akKiller)
  ObjectReference[] LinkedRefs = None
  If LinkRobotToTurret
    LinkedRefs = Self.GetLinkedRefChain(LinkRobotToTurret, 100)
  Else
    LinkedRefs = Self.GetLinkedRefChain(None, 100)
  EndIf
  Int I = 0
  While I < LinkedRefs.Length
    (LinkedRefs[I] as Actor).SetUnconscious(True)
    I += 1
  EndWhile
EndEvent
