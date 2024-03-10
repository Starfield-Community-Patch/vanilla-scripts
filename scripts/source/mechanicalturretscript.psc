ScriptName MechanicalTurretScript Extends ObjectReference
{ Script to handle mechanical turret moving up and down based on player position }

;-- Variables ---------------------------------------
Bool bUseHorizontalX
Bool bUseHorizontalY
Bool bUseVertical
Bool doOnce = False
Float fAnimRate
Float fHorizontalXLength
Float fHorizontalXMoverVar
Float fHorizontalYLength
Float fHorizontalYMoverVar
Float fRootRefDistanceToPlayer
Float fTargetMin = 1.25
Float fVerticalLength
Float fVerticalMoverVar
ObjectReference fireNodeRef
Float fplayerDistanceToZFloor
ObjectReference horizontalXMoverRef
ObjectReference horizontalXRef
ObjectReference horizontalYMoverRef
ObjectReference horizontalYRef
Float myTimer = 0.100000001
Int myTimerID = 0
Float myTimerMax = 0.100000001
Float myTimerMin = 0.100000001
ObjectReference playerRef
ObjectReference rootRef
ObjectReference verticalMoverRef
Float xAngle
ObjectReference zRef
Float zRootPosition

;-- Properties --------------------------------------
Int Property TurretType = 4 Auto Const
{ 0=vertical only, 1=horizontal only, 2=horizontal and vertical (default), 3=all three axis, 4=random }
Keyword Property LinkCustom01 Auto Const mandatory
{ z platform helper }
Keyword Property LinkCustom02 Auto Const mandatory
{ horizontalY platform helper }
Keyword Property LinkCustom03 Auto Const mandatory
{ horizontalX platform helper }
Keyword Property LinkCustom04 Auto Const mandatory
{ turret fire node }
Keyword Property LinkCustom05 Auto Const mandatory
{ ref for root marker }
Keyword Property LinkCustom06 Auto Const mandatory
{ ref for ceiling of z bound }
Keyword Property LinkCustom07 Auto Const mandatory
{ ref for horizontalY bound }
Keyword Property LinkCustom08 Auto Const mandatory
{ ref for horizontalX bound }
Float Property fTimeTakenToMove = 2.0 Auto Const
{ how fast the turret moves from point A to B }
Weapon Property turretWeapon Auto Const
{ weapon turret uses }
Ammo Property turretAmmo Auto Const
{ ammo that turret fires }

;-- Functions ---------------------------------------

Event OnLoad()
  playerRef = Game.GetPlayer() as ObjectReference
  verticalMoverRef = Self.GetLinkedRef(LinkCustom01)
  horizontalYMoverRef = Self.GetLinkedRef(LinkCustom02)
  horizontalXMoverRef = Self.GetLinkedRef(LinkCustom03)
  fireNodeRef = Self.GetLinkedRef(LinkCustom04)
  rootRef = Self.GetLinkedRef(LinkCustom05)
  zRef = Self.GetLinkedRef(LinkCustom06)
  horizontalYRef = Self.GetLinkedRef(LinkCustom07)
  horizontalXRef = Self.GetLinkedRef(LinkCustom08)
  zRootPosition = rootRef.GetPositionZ()
  fAnimRate = 1.0 / fTimeTakenToMove
  verticalMoverRef.SetAnimationVariableFloat("Speed", fAnimRate)
  horizontalYMoverRef.SetAnimationVariableFloat("Speed", fAnimRate)
  horizontalXMoverRef.SetAnimationVariableFloat("Speed", fAnimRate)
  fVerticalLength = zRef.GetPositionZ() - zRootPosition
  fHorizontalYLength = rootRef.GetDistance(horizontalYRef)
  fHorizontalXLength = rootRef.GetDistance(horizontalXRef)
  If TurretType == 1
    bUseVertical = False
  Else
    bUseVertical = True
  EndIf
  If TurretType == 0
    bUseHorizontalY = False
  Else
    bUseHorizontalY = True
  EndIf
  If TurretType == 3 || TurretType == 4
    bUseHorizontalX = True
  Else
    bUseHorizontalX = False
  EndIf
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If (akActionRef == Game.GetPlayer() as ObjectReference) && doOnce == False
    doOnce = True
    Self.StartTimer(myTimer, myTimerID)
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == myTimerID
    Float fHorizontalYShortLength = 0.0
    Float fHorizontalXShortLength = 0.0
    fplayerDistanceToZFloor = playerRef.GetPositionZ() - zRootPosition + fTargetMin
    fRootRefDistanceToPlayer = playerRef.GetDistance(rootRef)
    If TurretType == 1 || TurretType == 2 || TurretType == 3
      fHorizontalYShortLength = Self.FindTriangleBase(fRootRefDistanceToPlayer, fHorizontalYLength, playerRef.GetDistance(horizontalYRef))
    EndIf
    If TurretType == 3
      fHorizontalXShortLength = Self.FindTriangleBase(fRootRefDistanceToPlayer, fHorizontalXLength, playerRef.GetDistance(horizontalXRef))
    EndIf
    Self.MoveTurret(fHorizontalYShortLength, fHorizontalXShortLength)
  EndIf
EndEvent

Float Function FindTriangleBase(Float SideA, Float SideB, Float SideC)
{ takes four sides of a triangle, finds the height of the triangle, then finds the short length of that new triangle }
  Float fHeronPart1 = 0.0
  Float fHeronPart2 = 0.0
  Float fTriangleHeight = 0.0
  Float fTriangleBase = 0.0
  fHeronPart1 = (SideA + SideB + SideC) / 2.0
  fHeronPart2 = Math.sqrt(fHeronPart1 * (fHeronPart1 - SideA) * (fHeronPart1 - SideB) * (fHeronPart1 - SideC))
  fTriangleHeight = 2.0 * fHeronPart2 / SideB
  fTriangleBase = Math.sqrt(Math.pow(SideA, 2.0) - Math.pow(fTriangleHeight, 2.0))
  Return fTriangleBase
EndFunction

Function MoveTurret(Float fHorizontalY, Float fHorizontalX)
  Self.CancelTimer(myTimerID)
  If TurretType != 4
    fVerticalMoverVar = fplayerDistanceToZFloor / fVerticalLength
    fHorizontalYMoverVar = fHorizontalY / fHorizontalYLength
    fHorizontalXMoverVar = fHorizontalX / fHorizontalXLength
  Else
    fVerticalMoverVar = Utility.RandomFloat(0.0, 1.0)
    fHorizontalYMoverVar = Utility.RandomFloat(0.0, 1.0)
    fHorizontalXMoverVar = Utility.RandomFloat(0.0, 1.0)
  EndIf
  verticalMoverRef.SetAnimationVariableFloat("Position", fVerticalMoverVar)
  horizontalYMoverRef.SetAnimationVariableFloat("Position", fHorizontalYMoverVar)
  horizontalXMoverRef.SetAnimationVariableFloat("Position", fHorizontalXMoverVar)
  If bUseHorizontalX == True
    horizontalXMoverRef.PlayAnimationAndWait("Play01", "done")
    Self.FireTurret()
    Utility.Wait(0.25)
  EndIf
  If bUseVertical == True
    verticalMoverRef.PlayAnimationAndWait("Play01", "done")
    Self.FireTurret()
    Utility.Wait(0.25)
  EndIf
  If bUseHorizontalY == True
    horizontalYMoverRef.PlayAnimationAndWait("Play01", "done")
    Self.FireTurret()
    Utility.Wait(0.25)
  EndIf
  If TurretType == 4
    Self.StartTimer(Utility.RandomFloat(myTimerMin, myTimerMax), 0)
  Else
    Self.StartTimer(myTimer, myTimerID)
  EndIf
EndFunction

Function FireTurret()
  Float fPlayerZ = playerRef.GetPositionZ() + fTargetMin
  Float fFireNodeRefZ = fireNodeRef.GetPositionZ()
  Float fZDifferencePlayerFireNode = fPlayerZ - fFireNodeRefZ
  Float fDistanceFireNodeToPlayer = fireNodeRef.GetDistance(playerRef)
  Float zOffset = fireNodeRef.GetHeadingAngle(playerRef)
  If fPlayerZ >= fFireNodeRefZ
    xAngle = Math.asin(fZDifferencePlayerFireNode / fDistanceFireNodeToPlayer) * -1.0
  Else
    xAngle = 90.0 - Math.acos(fZDifferencePlayerFireNode * -1.0 / fDistanceFireNodeToPlayer)
  EndIf
  fireNodeRef.setAngle(xAngle, fireNodeRef.GetAngleY(), fireNodeRef.GetAngleZ() + zOffset)
  turretWeapon.Fire(fireNodeRef, turretAmmo)
EndFunction
