ScriptName FXScripts:EffectSequenceOnActivate Extends ObjectReference Const default
{ For any activator that you want to play a single animation each time it's activated. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
  String Property SequenceName = "Play01" Auto Const
  { Effect Sequence to play when this is activated. }
EndGroup


;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Self.playAnimation(SequenceName)
EndEvent
