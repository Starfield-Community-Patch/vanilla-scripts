ScriptName MQ204VladimirScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property MQ204VladimirInjuredMarker Auto Const mandatory
Keyword Property AnimFlavorWounded Auto Const mandatory

;-- Functions ---------------------------------------

Event OnGetUp(ObjectReference akFurniture)
  If akFurniture == MQ204VladimirInjuredMarker
    Self.GetActorRef().ChangeAnimFlavor(AnimFlavorWounded)
  EndIf
EndEvent
