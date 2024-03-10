ScriptName TestExplodingCannisterScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Explosion Property Test_Fire_Sm_CannisterExplosion Auto Const mandatory
ActorValue Property Test_PiercingHealth Auto Const mandatory
ActorValue Property Test_FireHealth Auto Const mandatory
ActorValue Property Test_CryoHealth Auto Const mandatory
Float Property DamageThreshold = 99.0 Auto Const
Float Property CryoDamageThreshold = 70.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  ObjectReference tank = Self.GetLinkedRef(None)
  Self.RegisterForActorValueLessThanEvent(tank, Test_PiercingHealth, DamageThreshold)
  Self.RegisterForActorValueLessThanEvent(tank, Test_FireHealth, DamageThreshold)
  Self.RegisterForActorValueLessThanEvent(tank, Test_CryoHealth, CryoDamageThreshold)
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  If akActorValue == Test_CryoHealth
    If Self.GetLinkedRef(None).GetValue(Test_CryoHealth) <= CryoDamageThreshold
      Self.Freeze()
    EndIf
  EndIf
  If akActorValue == Test_PiercingHealth
    If Self.GetLinkedRef(None).GetValue(Test_PiercingHealth) <= DamageThreshold
      Self.Explode()
    EndIf
  EndIf
  If akActorValue == Test_FireHealth
    If Self.GetLinkedRef(None).GetValue(Test_FireHealth) <= DamageThreshold
      Self.Explode()
    EndIf
  EndIf
EndEvent

Function Explode()
  Self.GetLinkedRef(None).PlaceAtMe(Test_Fire_Sm_CannisterExplosion as Form, 1, False, False, True, None, None, True)
EndFunction

Function Freeze()
  ObjectReference tank = Self.GetLinkedRef(None)
  Self.GetLinkedRef(None).SetValue(Test_PiercingHealth, 150.0)
  Self.GetLinkedRef(None).SetValue(Test_FireHealth, 150.0)
  Self.RegisterForActorValueLessThanEvent(tank, Test_PiercingHealth, DamageThreshold)
  Self.RegisterForActorValueLessThanEvent(tank, Test_FireHealth, DamageThreshold)
EndFunction
