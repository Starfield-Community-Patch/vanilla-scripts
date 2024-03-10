ScriptName TestForceAliasScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property AliasToForce Auto Const

;-- Functions ---------------------------------------

Function ForceIntoAlias(Form myForm)
  ObjectReference myRef = myForm as ObjectReference
  If myRef
    AliasToForce.ForceRefTo(myRef)
  Else
    spaceshipreference myShip = myForm as spaceshipreference
    If myShip
      AliasToForce.ForceRefTo(myShip as ObjectReference)
    EndIf
  EndIf
EndFunction
