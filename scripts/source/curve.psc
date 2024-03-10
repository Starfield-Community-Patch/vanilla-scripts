ScriptName Curve Extends Form Native hidden

;-- Functions ---------------------------------------

Float Function GetValueAt(Float afInput) Native

Bool Function HasValueAt(Float afInput) Native

Float[] Function GetValues(Float[] Inputs)
  Float[] values = new Float[Inputs.Length]
  Int I = 0
  While I < Inputs.Length
    values[I] = Self.GetValueAt(Inputs[I])
    I += 1
  EndWhile
  Return values
EndFunction
