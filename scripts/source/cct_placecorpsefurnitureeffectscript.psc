ScriptName CCT_PlaceCorpseFurnitureEffectScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------
Int iDelayTimerFlyerID = 2 Const
Int iDelayTimerID = 1 Const

;-- Properties --------------------------------------
Furniture Property CreatureCorpseFeed Auto Const mandatory
{ corpse furniture to place on death if a non-flier }
Furniture Property CreatureCorpseFeed_Flyer Auto Const mandatory
{ corpse furniture to place on death if a flier }
Keyword Property ActorTypePredator Auto Const mandatory
{ check that killer is a predator }
conditionform Property CCT_IsFlier Auto Const mandatory
{ use to test if killer is a flier }
Float Property fDelay = 3.0 Auto Const
{ wait a bit for corpse to finish settling }
Float Property markerOffset = -2.5 Auto Const
{ how far to offset feed marker so the actor isn't right on top of the corpse }

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.RegisterForRemoteEvent(akCaster as ScriptObject, "OnDeath")
EndEvent

Event Actor.OnDeath(Actor akSource, ObjectReference akKiller)
  If akKiller as Bool && akKiller.HasKeyword(ActorTypePredator)
    If CCT_IsFlier.IsTrue(akKiller, None)
      Self.StartTimer(fDelay, iDelayTimerFlyerID)
    Else
      Self.StartTimer(fDelay, iDelayTimerID)
    EndIf
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  Actor targetActor = Self.GetTargetActor()
  Float[] offset = new Float[3]
  offset[1] = markerOffset
  If aiTimerID == iDelayTimerID
    ObjectReference markerRef = targetActor.PlaceAtMe(CreatureCorpseFeed as Form, 1, False, False, True, offset, None, True)
  ElseIf aiTimerID == iDelayTimerFlyerID
    ObjectReference markerref = targetActor.PlaceAtMe(CreatureCorpseFeed_Flyer as Form, 1, False, False, True, offset, None, True)
  EndIf
EndEvent
