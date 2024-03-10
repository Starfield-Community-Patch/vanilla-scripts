ScriptName CharGenFurnitureScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForAnimationEvent(Game.GetPlayer() as ObjectReference, "CharacterGenStart")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  Self.UnRegisterForAnimationEvent(Game.GetPlayer() as ObjectReference, "CharacterGenStart")
  Game.ShowRaceMenu(None, 0, None, None, None)
EndEvent

Event OnExitFurniture(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    Self.RegisterForAnimationEvent(Game.GetPlayer() as ObjectReference, "CharacterGenStart")
  EndIf
EndEvent
