ScriptName TestGym_AddExplosionLoop Extends ObjectReference Const
{ Test gym script to add explosion repeatedly }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Explosion Property P_TestGym_PhysicparticleExplosion Auto Const mandatory
ObjectReference Property P_testGyn_PE_Ref Auto Const mandatory
Int Property P_loopTime = 6 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  While 1 > 0
    P_testGyn_PE_Ref.PlaceAtNode("BasePoint2m", P_TestGym_PhysicparticleExplosion as Form, 1, False, False, True, False)
    Utility.Wait(P_loopTime as Float)
  EndWhile
EndEvent
