ScriptName UC09_ContinueAddressTrigger Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Abello Auto Const mandatory
{ Reference alias for President Abello }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference PlayerREF = Game.GetPlayer() as ObjectReference
  If akActionRef == PlayerREF
    Abello.GetRef().Activate(PlayerREF, False)
  EndIf
EndEvent
