ScriptName SurveySiteDiscoverMarkerScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property SiteType = 0 Auto Const
{ type of site - TO DO }
Float Property DiscoveryDistance = 100.0 Auto Const
{ should be temp - won't need this once we can get the event of the player discovering a map marker }
sq_parentscript Property SQ_Parent Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, DiscoveryDistance, 0)
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  SQ_Parent.AddSurveySite(Self)
EndEvent

Function BuildSite()
  Self.GetLinkedRef(None).Disable(False)
EndFunction
