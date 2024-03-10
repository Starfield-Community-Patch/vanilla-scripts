ScriptName TestExplodingBarrelScript Extends ObjectReference

;-- Variables ---------------------------------------
ObjectReference FireFX
Bool barrelPunctured = False
Bool isFrozen = False
Bool onFire = False

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory
{ keyword for linking the flame FX }
Explosion Property Test_Fire_Sm_Explosion Auto Const mandatory
Form Property TRP_Puddle_Flammable_01_Packin Auto Const mandatory
ActorValue Property Test_PiercingHealth Auto Const mandatory
ActorValue Property Test_FireHealth Auto Const mandatory
ActorValue Property Test_CryoHealth Auto Const mandatory
Float Property DamageThreshold = 95.0 Auto Const
Float Property MassiveDamageThreshold = 10.0 Auto Const
Float Property FireDamagePerSecond = 20.0 Auto Const
Float Property MassiveDamageTimeWindow = 1.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  ObjectReference Barrel = Self.GetLinkedRef(None)
  Self.RegisterForActorValueLessThanEvent(Barrel, Test_PiercingHealth, DamageThreshold)
  Self.RegisterForActorValueLessThanEvent(Barrel, Test_PiercingHealth, MassiveDamageThreshold)
  Self.RegisterForActorValueLessThanEvent(Self.GetLinkedRef(None), Test_CryoHealth, MassiveDamageThreshold)
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  If akActorValue == Test_PiercingHealth
    If !barrelPunctured
      Self.Puncture()
    EndIf
    If Self.GetLinkedRef(None).GetValue(Test_PiercingHealth) <= MassiveDamageThreshold
      Self.Explode()
    Else
      Self.StartTimer(MassiveDamageTimeWindow, 10)
      Self.RegisterForActorValueLessThanEvent(Self.GetLinkedRef(None), Test_PiercingHealth, MassiveDamageThreshold)
    EndIf
  EndIf
  If akActorValue == Test_FireHealth
    If Self.GetLinkedRef(None).GetValue(Test_FireHealth) <= MassiveDamageThreshold
      Self.Explode()
    ElseIf !onFire
      onFire = True
      Self.CatchFire()
    EndIf
  EndIf
  If akActorValue == Test_CryoHealth
    Self.Freeze()
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == 10
    Self.GetLinkedRef(None).RestoreValue(Test_PiercingHealth, 10.0)
    Self.StartTimer(MassiveDamageTimeWindow, 10)
  EndIf
  If aiTimerID == 20 && !isFrozen
    Self.GetLinkedRef(None).DamageValue(Test_FireHealth, FireDamagePerSecond / 2.0)
    If Self.GetLinkedRef(None).GetValue(Test_FireHealth) <= MassiveDamageThreshold
      Self.Explode()
    Else
      Self.StartTimer(0.5, 20)
    EndIf
  EndIf
EndEvent

Function Explode()
  Self.GetLinkedRef(None).PlaceAtMe(Test_Fire_Sm_Explosion as Form, 1, False, False, True, None, None, True)
  Self.GetLinkedRef(None).GetLinkedRef(LinkCustom01).Disable(False)
  Self.GetLinkedRef(None).Disable(False)
EndFunction

Function CatchFire()
  Self.StartTimer(0.5, 20)
  Self.GetLinkedRef(None).GetLinkedRef(LinkCustom01).Enable(False)
  Self.RegisterForActorValueLessThanEvent(Self.GetLinkedRef(None), Test_FireHealth, MassiveDamageThreshold)
EndFunction

Function Puncture()
  barrelPunctured = True
  Self.GetLinkedRef(None).RestoreValue(Test_FireHealth, 100.0 - Self.GetLinkedRef(None).GetValue(Test_FireHealth))
  Self.RegisterForActorValueLessThanEvent(Self.GetLinkedRef(None), Test_FireHealth, DamageThreshold)
  Self.GetLinkedRef(None).PlaceAtMe(TRP_Puddle_Flammable_01_Packin, 1, False, False, True, None, None, True)
EndFunction

Function Freeze()
  isFrozen = True
  barrelPunctured = False
  Self.UnregisterForActorValueLessThanEvent(Self.GetLinkedRef(None), Test_FireHealth, DamageThreshold)
  If onFire
    Self.GetLinkedRef(None).GetLinkedRef(LinkCustom01).Disable(False)
  EndIf
EndFunction
