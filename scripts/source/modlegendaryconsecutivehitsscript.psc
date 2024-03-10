ScriptName ModLegendaryConsecutiveHitsScript Extends LegendaryMagicEffectEventListenScript

;-- Variables ---------------------------------------
Int ConsecutiveHitCount
Actor LastConsecutiveHitActor

;-- Functions ---------------------------------------

Function HandleEvent(MagicEffect EventMagicEffect, Actor TargetActor, Actor CasterActor, Int EventType, Var EventArg1, Var EventArg2, Var EventArg3)
  ActorValue ModLegendaryWeaponConsecutiveHits = EventArg2 as ActorValue
  Actor myActor = Self.GetTargetActor()
  If myActor
    If EventType == LegendaryItemQuest.iEventType_Starting || EventType == LegendaryItemQuest.iEventType_OnHit
      If TargetActor == LastConsecutiveHitActor
        myActor.SetValue(ModLegendaryWeaponConsecutiveHits, myActor.GetValue(ModLegendaryWeaponConsecutiveHits) + 1.0)
      Else
        myActor.SetValue(ModLegendaryWeaponConsecutiveHits, 0.0)
      EndIf
      LastConsecutiveHitActor = TargetActor
    ElseIf EventType == LegendaryItemQuest.iEventType_Finishing
      If TargetActor == LastConsecutiveHitActor
        myActor.SetValue(ModLegendaryWeaponConsecutiveHits, 0.0)
      EndIf
    EndIf
  EndIf
EndFunction
