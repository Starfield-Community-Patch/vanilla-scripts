ScriptName TestExplodingBarrel Extends ObjectReference
{ A script to prototype the functionality of an exploding barrel. }

;-- Variables ---------------------------------------
ObjectReference FireFX
ObjectReference FireHazard
Bool exploded = False
Bool punctured = False
Bool readyToExplode = False
Int remainingFuel = 3

;-- Properties --------------------------------------
Explosion Property Test_Fire_Sm_Explosion Auto Const
Weapon Property UnarmedHuman Auto Const
Form Property FireMed01 Auto Const
Form Property ENV_GasVentHazard_Heat_Small Auto Const
Form Property Test_Hazard_Pool_Fire Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.Is3DLoaded()
    Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  EndIf
EndEvent

Event OnUnload()
  Self.UnregisterForAllHitEvents(None)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If abBashAttack || (akSource == UnarmedHuman as Form)
    
  ElseIf readyToExplode
    If !exploded
      Self.Explode()
    EndIf
  ElseIf punctured
    FireFX = Self.PlaceAtMe(FireMed01, 1, False, False, True, None, None, True)
    FireHazard = Self.PlaceAtMe(ENV_GasVentHazard_Heat_Small, 1, False, False, True, None, None, True)
    Self.StartTimer(3.0, 0)
    readyToExplode = True
  Else
    Self.StartTimer(3.0, 1)
    punctured = True
  EndIf
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == 0
    If !exploded
      Self.Explode()
    EndIf
  ElseIf aiTimerID == 1
    If !exploded && remainingFuel > 0 && punctured
      Self.LeakFuel()
    EndIf
  EndIf
EndEvent

Function Explode()
  exploded = True
  Self.PlaceAtMe(Test_Fire_Sm_Explosion as Form, 1, False, False, True, None, None, True)
  Self.UnregisterForAllHitEvents(None)
  FireFX.Disable(False)
  FireHazard.Disable(False)
  Self.Disable(False)
EndFunction

Function LeakFuel()
  Self.PlaceAtMe(Test_Hazard_Pool_Fire, 1, False, False, True, None, None, True)
  remainingFuel -= 1
  Self.StartTimer(3.0, 1)
EndFunction
