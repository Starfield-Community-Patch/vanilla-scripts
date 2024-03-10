ScriptName CF05_HuanShipOnLoadScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CF05_HuanShipDoor Auto Const mandatory
ReferenceAlias Property Alias_CF05_HuanShip Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  If !Self.GetOwningQuest().GetStageDone(721)
    Alias_CF05_HuanShip.GetShipRef().SetExteriorLoadDoorInaccessible(False)
    Self.RefillDependentAliases()
    Alias_CF05_HuanShipDoor.RefillAlias()
  EndIf
EndEvent
