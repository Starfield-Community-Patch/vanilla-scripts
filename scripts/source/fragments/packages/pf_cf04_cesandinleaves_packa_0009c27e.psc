ScriptName Fragments:Packages:PF_CF04_CESandinLeaves_Packa_0009C27E Extends Package Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CF04_Sandin Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  Alias_CF04_Sandin.GetRef().Disable(False)
EndFunction
