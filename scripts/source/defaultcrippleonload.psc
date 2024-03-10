ScriptName DefaultCrippleOnLoad Extends ObjectReference Const
{ Cripples both left and right mobility of a reference OnLoad() }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill_Properties
  ActorValue Property LeftMobilityCondition Auto Const
  ActorValue Property RightMobilityCondition Auto Const
  ActorValue Property LeftAttackCondition Auto Const
  ActorValue Property RightAttackCondition Auto Const
EndGroup

Group CrippleData
  Bool Property LeftLeg = True Auto Const
  Bool Property RightLeg = True Auto Const
  Bool Property LeftArm = False Auto Const
  Bool Property RightArm = False Auto Const
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  If LeftLeg
    Self.DamageValue(LeftMobilityCondition, 100.0)
  EndIf
  If RightLeg
    Self.DamageValue(RightMobilityCondition, 100.0)
  EndIf
  If LeftArm
    Self.DamageValue(LeftAttackCondition, 100.0)
  EndIf
  If RightArm
    Self.DamageValue(LeftAttackCondition, 100.0)
  EndIf
EndEvent
