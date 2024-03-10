ScriptName HazardBase Extends objectReference

;-- Variables ---------------------------------------
Bool isWaitingToEvaluate = False

;-- Properties --------------------------------------
Int Property damage Auto hidden
Int Property soundLevel = 10 Auto
Int Property trapPushBack Auto
wwiseevent Property TrapHitSound Auto
Weapon Property hitFX Auto
Ammo Property hitFXAmmo Auto
Int Property trapLevel = 1 Auto
Float Property staggerAmount = 0.0 Auto
Bool Property CheckAngle = False Auto
{ if true this will check the angle of the actors velocity to the "up" vector of the trap
	default == False }
Int Property LvlThreshold1 Auto
Int Property LvlDamage1 Auto
Int Property LvlThreshold2 Auto
Int Property LvlDamage2 Auto
Int Property LvlThreshold3 Auto
Int Property LvlDamage3 Auto
Int Property LvlThreshold4 Auto
Int Property LvlDamage4 Auto
Int Property LvlThreshold5 Auto
Int Property LvlDamage5 Auto
Int Property LvlDamage6 Auto

;-- Functions ---------------------------------------

Event onLoad()
  Self.ResolveLeveledDamage()
EndEvent

Function doLocalHit(ObjectReference akTarget, Float afXVel, Float afYVel, Float afZVel, Float afXPos, Float afYPos, Float afZPos, Int aeMaterial, Bool abInitialHit, Int aeMotionType)
  akTarget.ProcessTrapHit(Self as ObjectReference, damage as Float, trapPushBack as Float, afXVel, afYVel, afZVel, afXPos, afYPos, afZPos, aeMaterial, staggerAmount)
  TrapHitSound.play(Self as ObjectReference, None, None)
  hitFX.fire(Self as ObjectReference, hitFXAmmo)
  Self.CreateDetectionEvent(akTarget as Actor, soundLevel)
EndFunction

Bool Function isAngleAcceptable(Float afXVel, Float afYVel, Float afZVel)
  Float maxZVelocity = 1.0
  Float minZVelocity = 0.300000012
  Float absoluteZ = Math.abs(afZVel)
  Float absoluteY = Math.abs(afYVel)
  Float absoluteX = Math.abs(afXVel)
  If absoluteZ >= maxZVelocity
    Return True
  ElseIf absoluteZ >= minZVelocity
    If absoluteZ * 0.600000024 >= absoluteY
      Return True
    ElseIf absoluteZ * 0.600000024 >= absoluteX
      Return True
    Else
      Return False
    EndIf
  Else
    Return False
  EndIf
EndFunction

Function ResolveLeveledDamage()
  Int damageLevel = 0
  damageLevel = Self.CalculateEncounterLevel(trapLevel)
  damage = LvlDamage1
  If damageLevel > LvlThreshold1 && damageLevel <= LvlThreshold2
    damage = LvlDamage2
  EndIf
  If damageLevel > LvlThreshold2 && damageLevel <= LvlThreshold3
    damage = LvlDamage3
  EndIf
  If damageLevel > LvlThreshold3 && damageLevel <= LvlThreshold4
    damage = LvlDamage4
  EndIf
  If damageLevel > LvlThreshold4 && damageLevel <= LvlThreshold5
    damage = LvlDamage5
  EndIf
  If damageLevel > LvlThreshold5
    damage = LvlDamage6
  EndIf
EndFunction

;-- State -------------------------------------------
Auto State CanHit

  Event OnTrapHitStart(ObjectReference akTarget, Float afXVel, Float afYVel, Float afZVel, Float afXPos, Float afYPos, Float afZPos, Int aeMaterial, Bool abInitialHit, Int aeMotionType)
    If !CheckAngle
      Self.doLocalHit(akTarget, afXVel, afYVel, afZVel, afXPos, afYPos, afZPos, aeMaterial, abInitialHit, aeMotionType)
    ElseIf Self.isAngleAcceptable(afXVel, afYVel, afZVel)
      Self.doLocalHit(akTarget, afXVel, afYVel, afZVel, afXPos, afYPos, afZPos, aeMaterial, abInitialHit, aeMotionType)
    EndIf
  EndEvent
EndState

;-- State -------------------------------------------
State CannotHit
EndState
