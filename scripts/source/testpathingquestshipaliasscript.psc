ScriptName TestPathingQuestShipAliasScript Extends ReferenceAlias

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.GetShipRef().SetExteriorLoadDoorInaccessible(False)
EndEvent
