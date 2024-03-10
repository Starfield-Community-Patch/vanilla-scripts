ScriptName SQ_ShipDebrisScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property SQ_ShipDebrisKeyword Auto Const mandatory
{ add keyword to orbit location when quest is running to block other quests from starting up here }
LocationAlias Property OrbitLocation Auto Const mandatory
{ add keyword to this location }

;-- Functions ---------------------------------------

Event OnQuestStarted()
  Self.AddKeywordToLocation(True)
EndEvent

Event OnQuestShutdown()
  Self.AddKeywordToLocation(False)
EndEvent

Function AddKeywordToLocation(Bool addKeyword)
  Location theOrbitLocation = OrbitLocation.GetLocation()
  If addKeyword
    theOrbitLocation.addKeyword(SQ_ShipDebrisKeyword)
  Else
    theOrbitLocation.RemoveKeyword(SQ_ShipDebrisKeyword)
  EndIf
EndFunction
