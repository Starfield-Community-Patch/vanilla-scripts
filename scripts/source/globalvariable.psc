ScriptName GlobalVariable Extends Form Native hidden

;-- Properties --------------------------------------
Float Property value hidden
  Float Function Get()
    Return Self.GetValue()
  EndFunction
  Function Set(Float afValue)
    Self.SetValue(afValue)
  EndFunction
EndProperty

;-- Functions ---------------------------------------

Float Function GetValue() Native

Function SetValue(Float afNewValue) Native

Int Function GetValueInt()
  Return Self.GetValue() as Int
EndFunction

Function SetValueInt(Int aiNewValue)
  Self.SetValue(aiNewValue as Float)
EndFunction

Float Function Mod(Float afHowMuch)
  Self.value = Self.value + afHowMuch
  Return Self.value
EndFunction
