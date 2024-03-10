ScriptName CityNewAtlantisTransitControlScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  ActorValue Property FastTravelOverEncumbered Auto Const mandatory
  { 0 = don't allow fast travel when Over Encumbered, any other value = allow it }
EndGroup

Scene Property CityNewAtlantisTransitScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Travel(ObjectReference DestinationRef)
  Actor playerRef = Game.GetPlayer()
  playerRef.SetValue(FastTravelOverEncumbered, 1.0)
  CityNewAtlantisTransitScene.Stop()
  Game.FastTravel(DestinationRef)
  playerRef.SetValue(FastTravelOverEncumbered, 0.0)
EndFunction
