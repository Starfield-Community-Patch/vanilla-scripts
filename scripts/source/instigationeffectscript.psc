ScriptName InstigationEffectScript Extends ActiveMagicEffect Const
{ cancel effect on bleedout for essential actors }

;-- Functions ---------------------------------------

Event OnEnterBleedout()
  Actor akTarget = Self.GetTargetActor()
  If akTarget as Bool && akTarget.IsEssential()
    Self.Dispel()
  EndIf
EndEvent
