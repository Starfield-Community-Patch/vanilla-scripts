ScriptName Fragments:Quests:QF_TestKurtMoveToPlanet_003C8F9A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Marker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Game.GetPlayer().MoveTo(Alias_Marker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction
