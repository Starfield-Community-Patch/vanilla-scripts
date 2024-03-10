ScriptName MannequinScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property allowPlayerActivation = True Auto Const
{ if false, player activation is blocked }
FormList Property DisplayFilter_Mannequins Auto Const mandatory
{ autofill - used to filter what can be placed in the mannequin }

;-- Functions ---------------------------------------

Event OnLoad()
  Self.SetHeadTracking(False)
  Self.SetRestrained(True)
  Self.SetUnconscious(True)
  Self.BlockActivation(True, False)
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If (akActionRef == Game.GetPlayer() as ObjectReference) && allowPlayerActivation
    Self.OpenInventory(True, DisplayFilter_Mannequins as Form, True)
  EndIf
EndEvent
