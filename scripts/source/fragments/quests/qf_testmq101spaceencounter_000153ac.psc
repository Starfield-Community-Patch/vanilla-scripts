ScriptName Fragments:Quests:QF_TestMQ101SpaceEncounter_000153AC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_BlackFleetShips Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_EnemyShip.GetShipref().Kill(None)
EndFunction
