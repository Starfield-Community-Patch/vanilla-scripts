ScriptName DefaultSetGlobalOnTriggerEnter Extends ObjectReference Const default
{ Set a global to a specific value when this trigger is entered by the player. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property GlobalToSet Auto Const
{ The Global we want to set to NumToSetGlobalTo }
Float Property NumToSetGlobalTo Auto Const
{ The number we want to set GlobalToSet to. }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    GlobalToSet.SetValue(NumToSetGlobalTo)
  EndIf
EndEvent
