ScriptName UC09_LazarusPlantRefScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC09_CleanUpLazarusPlant Auto Const mandatory
{ Global used to determine if the player decided to destroy all the Lazarus Plant }

;-- Functions ---------------------------------------

Event OnLoad()
  If !Self.IsDisabled() && UC09_CleanUpLazarusPlant.GetValueInt() > 0
    Self.Disable(False)
  EndIf
EndEvent
