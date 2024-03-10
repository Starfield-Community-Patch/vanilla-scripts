ScriptName SpaceportLandingPadScript Extends ObjectReference
{ Script for driving the animation of both the main elevator and the exit lounges. }

;-- Variables ---------------------------------------
ObjectReference LastRaisedExit
Bool elevatorIsUp = True
Activator selfAsActivator

;-- Properties --------------------------------------
Float Property OffsetDistance = 8.0 Auto Const
Static Property xMarker Auto Const
ObjectReference Property elevatorRef Auto Const

;-- Functions ---------------------------------------

Event onTriggerEnter(ObjectReference triggerRef)
  selfAsActivator = Self.GetBaseObject() as Activator
  If triggerRef == Game.GetPlayer() as ObjectReference
    ObjectReference bestExit = Self.GetBestExitLounge()
    If bestExit == LastRaisedExit
      bestExit.PlayAnimation("Stage1")
      LastRaisedExit = None
    ElseIf LastRaisedExit
      bestExit.PlayAnimation("Stage2")
      LastRaisedExit.PlayAnimation("Stage1")
      LastRaisedExit = bestExit
    Else
      bestExit.PlayAnimation("Stage2")
      LastRaisedExit = bestExit
    EndIf
    If elevatorIsUp == True
      elevatorIsUp = False
      elevatorRef.PlayAnimation("Stage2")
    EndIf
  EndIf
EndEvent

ObjectReference Function GetBestExitLounge()
  ObjectReference[] LinkedRefs = Self.GetRefsLinkedToMe(None, None)
  ObjectReference player = Game.GetPlayer() as ObjectReference
  ObjectReference markerLocation = player.PlaceAtMe(xMarker as Form, 1, False, False, True, None, None, True)
  Float posX = player.GetPositionX()
  Float posY = player.GetPositionY()
  Float playerAngle = player.GetAngleZ()
  markerLocation.SetPosition(posX + Math.sin(playerAngle) * OffsetDistance, posY + Math.cos(playerAngle) * OffsetDistance, player.GetPositionZ())
  Int j = LinkedRefs.Length - 1
  While j >= 0
    Bool isRemoved = False
    If LinkedRefs[j].GetTriggerObjectCount() > 0
      LinkedRefs.remove(j, 1)
      isRemoved = True
    EndIf
    j -= 1
  EndWhile
  ObjectReference ClosestRef = LinkedRefs[0]
  Int I = 1
  While I < LinkedRefs.Length
    ClosestRef = Self.CloserOfTwo(markerLocation, LinkedRefs[I], ClosestRef)
    I += 1
  EndWhile
  Return ClosestRef
  markerLocation.Delete()
EndFunction

ObjectReference Function CloserOfTwo(ObjectReference TestRef, ObjectReference a, ObjectReference b)
  Float distA = TestRef.GetDistance(a)
  If Math.Min(distA, TestRef.GetDistance(b)) == distA
    Return a
  Else
    Return b
  EndIf
EndFunction
