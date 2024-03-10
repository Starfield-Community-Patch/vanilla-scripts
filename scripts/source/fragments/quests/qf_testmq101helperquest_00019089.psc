ScriptName Fragments:Quests:QF_TestMQ101HelperQuest_00019089 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_playerShipPilotSeat Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_playerShipPilotSeat.GetRef().Activate(Game.GetPlayer() as ObjectReference, False)
EndFunction
