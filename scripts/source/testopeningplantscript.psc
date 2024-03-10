ScriptName TestOpeningPlantScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory
Keyword Property LinkCustom02 Auto Const mandatory
Keyword Property LinkCustom03 Auto Const mandatory
Keyword Property LinkCustom04 Auto Const mandatory
Explosion Property PlantOpenExplosion Auto Const mandatory
Explosion Property PlantClosedExplosion Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Self.GetLinkedRef(LinkCustom01).SetScale(2.0)
  Self.GetLinkedRef(LinkCustom02).SetScale(2.0)
  Self.RegisterForDistanceLessThanEvent(Game.GetPlayer() as ScriptObject, Self.GetLinkedRef(LinkCustom01) as ScriptObject, 4.0, 0)
  Self.RegisterForHitEvent(Self.GetLinkedRef(LinkCustom04) as ScriptObject, None, None, None, -1, -1, -1, -1, True)
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.PlantOpen()
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  If akTarget == Self.GetLinkedRef(LinkCustom04)
    If Self.GetLinkedRef(LinkCustom01).GetScale() < 1.0
      Self.GetLinkedRef(LinkCustom01).PlaceAtMe(PlantOpenExplosion as Form, 1, False, False, True, None, None, True)
    ElseIf Self.GetLinkedRef(LinkCustom01).GetScale() > 1.0
      Self.GetLinkedRef(LinkCustom01).PlaceAtMe(PlantClosedExplosion as Form, 1, False, False, True, None, None, True)
    EndIf
    Self.GetLinkedRef(LinkCustom01).Disable(False)
    Self.GetLinkedRef(LinkCustom02).Disable(False)
    Self.GetLinkedRef(LinkCustom03).Disable(False)
    Self.GetLinkedRef(LinkCustom04).Disable(False)
  EndIf
EndEvent

Function PlantOpen()
  Self.GetLinkedRef(LinkCustom01).Disable(False)
  Self.GetLinkedRef(LinkCustom02).Enable(False)
  Self.GetLinkedRef(LinkCustom02).PlaceAtMe(PlantOpenExplosion as Form, 1, False, False, True, None, None, True)
  Self.GetLinkedRef(LinkCustom03).Enable(False)
  Self.GetLinkedRef(LinkCustom01).SetScale(0.300000012)
  Utility.Wait(4.0)
  Self.PlantShrink()
EndFunction

Function PlantShrink()
  Self.GetLinkedRef(LinkCustom01).Enable(False)
  Self.RegisterForHitEvent(Self.GetLinkedRef(LinkCustom01) as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  ObjectReference myPlant = Self.GetLinkedRef(LinkCustom02)
  Float fCurrentScale = myPlant.GetScale()
  Int count = 0
  While fCurrentScale > 0.300000012
    myPlant.SetScale(fCurrentScale - 0.02)
    fCurrentScale -= 0.02
    Utility.Wait(0.100000001)
    count += 1
  EndWhile
  Self.GetLinkedRef(LinkCustom02).Disable(False)
  Self.GetLinkedRef(LinkCustom03).Disable(False)
  Self.GetLinkedRef(LinkCustom02).SetScale(2.0)
  Utility.Wait(3.0)
  Self.PlantGrow()
EndFunction

Function PlantGrow()
  ObjectReference myPlant = Self.GetLinkedRef(LinkCustom01)
  Float fCurrentScale = myPlant.GetScale()
  Int count = 0
  While fCurrentScale < 2.0
    myPlant.SetScale(fCurrentScale + 0.02)
    fCurrentScale += 0.02
    Utility.Wait(0.100000001)
    count += 1
  EndWhile
  Self.RegisterForDistanceLessThanEvent(Game.GetPlayer() as ScriptObject, Self.GetLinkedRef(LinkCustom01) as ScriptObject, 2.0, 0)
EndFunction
