ScriptName CF05_HuanShip_Script Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CF05_HuanShip Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Alias_CF05_HuanShip.GetShipRef().SetExteriorLoadDoorInaccessible(False)
EndEvent
