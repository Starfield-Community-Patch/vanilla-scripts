ScriptName DR009AirlockDoorScript Extends ObjectReference

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference player = Game.GetPlayer() as ObjectReference
  If akActionRef == player
    ObjectReference cosmeticDoor = Self.GetLinkedRef(None)
    If cosmeticDoor != None
      Int openState = cosmeticDoor.GetOpenState()
      If openState == 1 || openState == 2
        cosmeticDoor.SetOpen(False)
      ElseIf openState == 3 || openState == 4
        cosmeticDoor.SetOpen(True)
      EndIf
    EndIf
  EndIf
EndEvent
