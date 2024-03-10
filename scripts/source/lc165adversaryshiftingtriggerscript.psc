ScriptName lc165adversaryshiftingtriggerscript Extends ObjectReference
{ Script for the shifting triggers during the Adversary Battle in LC165, Buried Temple. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group ReferenceProperties
  String Property ShiftName Auto Const
  { The name of the shift this trigger was associated with. }
  Bool Property ShouldShiftPlayer = True Auto Const
  { Optional. Should this trigger shift the player and their allies if they enter it? }
  Bool Property ShouldShiftAdversary = True Auto Const
  { Optional. Should this trigger shift the adversaries if they enter it? }
  Bool Property ShouldShiftOtherActors = True Auto Const
  { Optional. Should this trigger shift other actors if they enter it? }
  Bool Property ShouldPlayVFXForOtherActors = True Auto Const
  { Optional. Should this trigger play the shifting vfx when shifting other actors? }
EndGroup

Group AutofillProperties collapsedonref
  lc165questscript Property MQ302B Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akTriggerRef)
  MQ302B.StarbornAdversaryShiftingTriggerEntered(Self, akTriggerRef as Actor, Self.GetLinkedRef(None))
EndEvent
