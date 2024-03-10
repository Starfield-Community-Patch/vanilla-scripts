ScriptName ScanTempleScript Extends Quest
{ prototyping temple scanning via imod }

;-- Variables ---------------------------------------
Float AngleDiff
Float DistanceDiff
ObjectReference currentTarget
Actor playerRef
Int scanTempleTimerID = 1 Const
Float scanTempleTimerSeconds = 0.5 Const
Bool usingHandscanner = False

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard handscannerGuard

;-- Properties --------------------------------------
ImageSpaceModifier Property TestScanTempleImod Auto Const mandatory
Float Property MinAngle = 10.0 Auto Const
Float Property MaxAngle = 90.0 Auto Const
Float Property MinDistance = 200.0 Auto Const
Float Property MaxDistance = 1000.0 Auto Const

;-- Functions ---------------------------------------

Function StartTempleScanning(ObjectReference targetRef)
  playerRef = Game.GetPlayer()
  DistanceDiff = MaxDistance - MinDistance
  AngleDiff = MaxAngle - MinAngle
  Self.RegisterForMenuOpenCloseEvent("MonocleMenu")
  currentTarget = targetRef
EndFunction

Function StopTempleScanning()
  Self.UnRegisterForMenuOpenCloseEvent("MonocleMenu")
  currentTarget = None
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == scanTempleTimerID
    Self.UpdateTempleScan()
  EndIf
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If asMenuName == "MonocleMenu"
    Guard handscannerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      usingHandscanner = abOpening
      If abOpening
        Self.StartTimer(scanTempleTimerSeconds, scanTempleTimerID)
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  EndIf
EndEvent

Function UpdateTempleScan()
  If usingHandscanner
    Float zAngle = Game.GetCameraHeadingAngle(currentTarget)
    Float angleExtent = Self.GetAngleExtent()
    Float currentMaxAngle = angleExtent / 2.0
    Float currentMinAngle = currentMaxAngle * -1.0
    If zAngle >= currentMinAngle && zAngle <= currentMaxAngle
      TestScanTempleImod.Apply(1.0)
    Else
      TestScanTempleImod.Remove()
    EndIf
    Self.StartTimer(scanTempleTimerSeconds, scanTempleTimerID)
  Else
    TestScanTempleImod.Remove()
  EndIf
EndFunction

Float Function GetAngleExtent()
  Float distance = Math.Clamp(playerRef.GetDistance(currentTarget), MinDistance, MaxDistance)
  Float distanceMult = (distance - MinDistance) / DistanceDiff
  Float angleExtent = MinAngle + distanceMult * AngleDiff
  Return angleExtent
EndFunction
