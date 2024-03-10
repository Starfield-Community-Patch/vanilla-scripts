ScriptName FavorQuestScript Extends Quest

;-- Variables ---------------------------------------
Location StartLocation

;-- Functions ---------------------------------------

Event OnQuestStarted()
  Actor PlayerREF = Game.GetPlayer()
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnLocationChange")
  StartLocation = PlayerREF.GetCurrentLocation()
  If Self.GetStage() >= 200
    Self.Stop()
  EndIf
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender.IsInLocation(StartLocation) == True
    
  ElseIf Self.GetStage() < 10
    Self.Stop()
  Else
    Self.UnregisterForRemoteEvent(akSender as ScriptObject, "OnLocationChange")
  EndIf
EndEvent
