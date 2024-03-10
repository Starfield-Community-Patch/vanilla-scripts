ScriptName TestJeffBLookScript Extends Actor conditional

;-- Variables ---------------------------------------
Actor player

;-- Properties --------------------------------------
Bool Property isLooking = False Auto conditional
Int Property howClose = 3000 Auto
Bool Property isClose = False Auto conditional

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForDetectionLOSGain(Game.GetPlayer(), Self as ObjectReference)
  player = Game.GetPlayer()
EndEvent

Event OnGainLOS(ObjectReference akViewer, ObjectReference akTarget)
  If Self.getDistance(player as ObjectReference) <= howClose as Float
    isClose = True
  Else
    isClose = False
  EndIf
  If isClose == True
    isLooking = True
    Self.EvaluatePackage(False)
  EndIf
  Self.RegisterForDetectionLOSLost(Game.GetPlayer(), Self as ObjectReference)
EndEvent

Event OnLostLOS(ObjectReference akViewer, ObjectReference akTarget)
  If Self.getDistance(player as ObjectReference) <= howClose as Float
    isClose = True
  Else
    isClose = False
  EndIf
  If isClose == True
    isLooking = False
    Self.EvaluatePackage(False)
  EndIf
  Self.RegisterForDetectionLOSGain(Game.GetPlayer(), Self as ObjectReference)
EndEvent
