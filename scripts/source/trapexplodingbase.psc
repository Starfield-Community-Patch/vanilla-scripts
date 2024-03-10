ScriptName TrapExplodingBase Extends TrapBase
{ base script for traps that explode when they take damage }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group TrapExplodingData
  Explosion Property TrapExplosion Auto Const mandatory
  ActorValue Property Stim_Health_Piercing Auto Const mandatory
  ActorValue Property Stim_Health_Flame Auto Const mandatory
  ActorValue Property Stim_Health_Freezing Auto Const mandatory
  ActorValue Property Stim_Health_Energy Auto Const mandatory
  Float Property DamageThresholdPiercing = 100.0 Auto
  Float Property DamageThresholdFlame = 100.0 Auto
  Float Property DamageThresholdCryo = 100.0 Auto
  Float Property DamageThresholdEnergy = 100.0 Auto
  Float Property FreezeHealthMult = 1.5 Auto Const
  { health multiplier on flame and piercing damage when frozen }
EndGroup


;-- Functions ---------------------------------------

Function HandleOnLoad()
  If bDisarmed == False
    ObjectReference tank = Self.GetLinkedRef(None)
    Self.RegisterForActorValueLessThanEvent(tank, Stim_Health_Piercing, DamageThresholdPiercing)
    Self.RegisterForActorValueLessThanEvent(tank, Stim_Health_Flame, DamageThresholdFlame)
    Self.RegisterForActorValueLessThanEvent(tank, Stim_Health_Freezing, DamageThresholdCryo)
    Self.RegisterForActorValueLessThanEvent(tank, Stim_Health_Energy, DamageThresholdEnergy)
  EndIf
EndFunction

Function HandleOnUnload()
  ObjectReference tank = Self.GetLinkedRef(None)
  Self.UnregisterForAllEvents()
EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  If akActorValue == Stim_Health_Freezing
    If Self.GetLinkedRef(None).GetValue(Stim_Health_Freezing) <= DamageThresholdCryo
      Self.ExceedFreezeDamage()
    EndIf
  ElseIf akActorValue == Stim_Health_Piercing
    If Self.GetLinkedRef(None).GetValue(Stim_Health_Piercing) <= DamageThresholdPiercing
      Self.ExceedPiercingDamage()
    EndIf
  ElseIf akActorValue == Stim_Health_Flame
    If Self.GetLinkedRef(None).GetValue(Stim_Health_Flame) <= DamageThresholdFlame
      Self.ExceedFlameDamage()
    EndIf
  ElseIf akActorValue == Stim_Health_Energy
    If Self.GetLinkedRef(None).GetValue(Stim_Health_Energy) <= DamageThresholdEnergy
      Self.ExceedEnergyDamage()
    EndIf
  EndIf
EndEvent

Function ExceedPiercingDamage()
  Self.Explode()
EndFunction

Function ExceedFlameDamage()
  Self.Explode()
EndFunction

Function ExceedEnergyDamage()
  Self.Explode()
EndFunction

Function ExceedFreezeDamage()
  ObjectReference myLinkedRef = Self.GetLinkedRef(None)
  If myLinkedRef
    myLinkedRef.SetValue(Stim_Health_Piercing, FreezeHealthMult * myLinkedRef.GetBaseValue(Stim_Health_Piercing))
    myLinkedRef.SetValue(Stim_Health_Flame, FreezeHealthMult * myLinkedRef.GetBaseValue(Stim_Health_Flame))
    Self.RegisterForActorValueLessThanEvent(myLinkedRef, Stim_Health_Piercing, DamageThresholdPiercing)
    Self.RegisterForActorValueLessThanEvent(myLinkedRef, Stim_Health_Flame, DamageThresholdFlame)
  EndIf
EndFunction

Function Explode()
  Self.GotoState("Unloaded")
  Self.Disarm()
  ObjectReference myLinkedRef = Self.GetLinkedRef(None)
  If myLinkedRef
    myLinkedRef.PlaceAtMe(TrapExplosion as Form, 1, False, False, True, None, None, True)
    myLinkedRef.DisableNoWait(False)
  EndIf
EndFunction
