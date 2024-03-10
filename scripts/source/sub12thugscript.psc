ScriptName Sub12ThugScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property City_NA_Viewport03_GangFaction_Combat Auto Const

;-- Functions ---------------------------------------

Event OnCombatStateChanged(ObjectReference akTarget, Int aeCombatState)
  If aeCombatState == 1
    Self.AddToFaction(City_NA_Viewport03_GangFaction_Combat)
  EndIf
EndEvent
