ScriptName FXDamageSelfOnLoad Extends ObjectReference Const
{ Damage Self On load. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property DamageAmount = 1.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.Is3DLoaded()
    Self.DamageObject(DamageAmount)
  EndIf
EndEvent
