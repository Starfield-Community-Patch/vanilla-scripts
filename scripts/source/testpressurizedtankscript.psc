ScriptName TestPressurizedTankScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool tankPunctured = False

;-- Properties --------------------------------------
Explosion Property Test_Fire_Sm_CannisterExplosion Auto Const mandatory
ActorValue Property Test_PiercingHealth Auto Const mandatory
ActorValue Property Test_FireHealth Auto Const mandatory
ActorValue Property Test_CryoHealth Auto Const mandatory
Float Property DamageThreshold = 99.0 Auto Const
Float Property CryoDamageThreshold = 80.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  ObjectReference Tank = Self.GetLinkedRef(None)
  Self.RegisterForActorValueLessThanEvent(Tank, Test_PiercingHealth, DamageThreshold)
  Self.RegisterForActorValueLessThanEvent(Tank, Test_FireHealth, DamageThreshold)
  Self.RegisterForActorValueLessThanEvent(Tank, Test_CryoHealth, CryoDamageThreshold)
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  If akActorValue == Test_CryoHealth
    If Self.GetLinkedRef(None).GetValue(Test_CryoHealth) <= CryoDamageThreshold
      Self.Freeze()
    EndIf
  EndIf
  If akActorValue == Test_PiercingHealth
    If Self.GetLinkedRef(None).GetValue(Test_PiercingHealth) <= DamageThreshold
      Self.Puncture()
    EndIf
  EndIf
  If akActorValue == Test_FireHealth
    If Self.GetLinkedRef(None).GetValue(Test_FireHealth) <= DamageThreshold
      Self.Puncture()
    EndIf
  EndIf
EndEvent

Function Explode()
  Self.GetLinkedRef(None).PlaceAtMe(Test_Fire_Sm_CannisterExplosion as Form, 1, False, False, True, None, None, True)
EndFunction

Function Puncture()
  tankPunctured = True
  Int count = 0
  While count < 30
    Self.GetLinkedRef(None).ApplyHavokImpulse(1.0, 0.0, 0.0, 10.0)
    Utility.Wait(0.100000001)
    count += 1
  EndWhile
  Self.UnRegisterForActorValueLessThanEvent(Self.GetLinkedRef(None), Test_PiercingHealth, DamageThreshold)
  Self.UnRegisterForActorValueLessThanEvent(Self.GetLinkedRef(None), Test_FireHealth, DamageThreshold)
  Self.GetLinkedRef(None).ApplyHavokImpulse(1.0, 0.0, 0.0, 0.0)
  Self.Explode()
EndFunction

Function Freeze()
  Self.GetLinkedRef(None).SetValue(Test_PiercingHealth, 150.0)
  Self.GetLinkedRef(None).SetValue(Test_FireHealth, 150.0)
  Self.RegisterForActorValueLessThanEvent(Self.GetLinkedRef(None), Test_PiercingHealth, DamageThreshold)
  Self.RegisterForActorValueLessThanEvent(Self.GetLinkedRef(None), Test_FireHealth, DamageThreshold)
EndFunction
