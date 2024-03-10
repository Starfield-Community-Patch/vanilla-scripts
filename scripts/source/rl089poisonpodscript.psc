ScriptName RL089PoisonPodScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property myCollision Auto Const mandatory
ObjectReference Property myPoison Auto Const mandatory
ObjectReference Property myPoisonEffect01 Auto Const mandatory
ObjectReference Property myPoisonEffect02 Auto Const mandatory
ObjectReference Property myTreePlatform Auto Const
ObjectReference Property myTreePlatformCollision Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Utility.Wait(2.0)
  myTreePlatform.SetScale(0.050000001)
  myTreePlatformCollision.Disable(False)
  Self.RegisterForHitEvent(myCollision as ScriptObject, None, None, None, -1, -1, -1, -1, True)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  Self.ShrinkPod()
EndEvent

Function ShrinkPod()
  myPoison.Disable(False)
  myPoisonEffect01.Disable(False)
  myPoisonEffect02.Disable(False)
  myCollision.Disable(False)
  Self.SetScale(0.100000001)
  Utility.Wait(3.0)
  Self.TreeGrowThenDie()
EndFunction

Function TreeGrowThenDie()
  myTreePlatform.SetScale(0.200000003)
  Utility.Wait(0.050000001)
  myTreePlatform.SetScale(0.300000012)
  Utility.Wait(0.050000001)
  myTreePlatform.SetScale(0.400000006)
  Utility.Wait(0.050000001)
  myTreePlatform.SetScale(0.5)
  Utility.Wait(0.050000001)
  myTreePlatform.SetScale(0.600000024)
  Utility.Wait(0.050000001)
  myTreePlatform.SetScale(0.699999988)
  myTreePlatformCollision.Enable(False)
  Utility.Wait(0.050000001)
  myTreePlatform.SetScale(0.800000012)
  Utility.Wait(0.050000001)
  myTreePlatform.SetScale(0.899999976)
  Utility.Wait(0.050000001)
  myTreePlatform.SetScale(1.0)
  Utility.Wait(6.0)
  Self.SetScale(0.200000003)
  Utility.Wait(0.100000001)
  Self.SetScale(0.300000012)
  Utility.Wait(0.100000001)
  Self.SetScale(0.400000006)
  Utility.Wait(0.100000001)
  Self.SetScale(0.5)
  myPoison.Enable(False)
  myPoisonEffect01.Enable(False)
  myPoisonEffect02.Enable(False)
  myCollision.Enable(False)
  Self.RegisterForHitEvent(myCollision as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  Utility.Wait(4.5)
  myTreePlatform.SetScale(0.800000012)
  Utility.Wait(0.050000001)
  myTreePlatform.SetScale(0.600000024)
  Utility.Wait(0.050000001)
  myTreePlatform.SetScale(0.400000006)
  myTreePlatformCollision.Disable(False)
  Utility.Wait(0.050000001)
  myTreePlatform.SetScale(0.200000003)
  Utility.Wait(0.050000001)
  myTreePlatform.SetScale(0.050000001)
EndFunction
