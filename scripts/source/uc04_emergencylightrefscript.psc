ScriptName UC04_EmergencyLightRefScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC04_AttackActive Auto Const mandatory
{ Global used to manage the attack state }

;-- Functions ---------------------------------------

Event OnLoad()
  If UC04_AttackActive.GetValue() < 1.0
    Self.PlayAnimation("TurnOffFull")
  EndIf
EndEvent
