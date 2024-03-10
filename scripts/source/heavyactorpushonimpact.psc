ScriptName HeavyActorPushOnImpact Extends ObjectReference
{ Script based solution for pushing things in game with heavy actors }

;-- Variables ---------------------------------------
Actor myActor

;-- Properties --------------------------------------
Keyword Property heavyKnocker Auto
{ Keyword pointer for heavy actors }
Armor Property ArmorPoweredFrame Auto
{ Pointer to power armor for testing against }
Bool Property isHavokable Auto
{ Set to true to get bollard like behavior }
Explosion Property myExplosion Auto
{ Explosion to play if non havokable }
Int Property damageAmountIfHavok = 10 Auto
{ damage to move bollard to havokable state }
Bool Property useDestruction = False Auto
{ on heavy knocker enter use destruction or not }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  myActor = akActionRef as Actor
  If myActor
    If (akActionRef as Actor).IsEquipped(ArmorPoweredFrame as Form)
      If isHavokable == True
        Float eulerAngleZ = akActionRef.getAngleZ() + Utility.RandomFloat(-25.0, 25.0)
        Float cosZ = Math.cos(eulerAngleZ)
        Float sinZ = Math.sin(eulerAngleZ)
        Self.DamageObject(damageAmountIfHavok as Float)
        Self.ApplyHavokImpulse(sinZ, cosZ, 0.0, 10000.0)
      Else
        Self.placeatme(myExplosion as Form, 1, False, False, True, None, None, True)
        Utility.wait(0.100000001)
        Self.disable(False)
      EndIf
    EndIf
    If akActionRef.HasKeyword(heavyKnocker)
      If isHavokable == True
        Float euleranglez = akActionRef.getAngleZ() + Utility.RandomFloat(-25.0, 25.0)
        Float cosz = Math.cos(euleranglez)
        Float sinz = Math.sin(euleranglez)
        Self.DamageObject(10.0)
        Self.ApplyHavokImpulse(sinz, cosz, 0.0, 10000.0)
      ElseIf useDestruction == False
        Self.placeatme(myExplosion as Form, 1, False, False, True, None, None, True)
        Utility.wait(0.100000001)
        Self.disable(False)
      Else
        Self.DamageObject(10000.0)
      EndIf
    EndIf
  EndIf
EndEvent
