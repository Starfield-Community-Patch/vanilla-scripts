ScriptName TeleportPlayerToLinkedRefScript Extends ObjectReference

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference player = Game.GetPlayer() as ObjectReference
  ObjectReference moveToRef = Self.GetLinkedRef(None)
  If moveToRef != None
    player.MoveTo(moveToRef, 0.0, 0.0, 0.0, True, False)
  EndIf
EndEvent
