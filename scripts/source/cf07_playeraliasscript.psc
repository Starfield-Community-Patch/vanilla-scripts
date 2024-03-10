ScriptName CF07_PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property CF07_ShipBuilderCheck_ComSpike Auto Const mandatory
ActorValue Property CF07_ShipBuilderCheck_ConGrid Auto Const mandatory
ReferenceAlias Property CF07_PlayerShip Auto Const mandatory
Quest Property CF07 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnPlayerModifiedShip(spaceshipreference akShip)
  If akShip.GetValue(CF07_ShipBuilderCheck_ComSpike) >= 1.0 && akShip.GetValue(CF07_ShipBuilderCheck_ConGrid) >= 1.0
    CF07.SetStage(40)
  EndIf
EndEvent
