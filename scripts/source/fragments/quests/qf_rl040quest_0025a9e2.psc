ScriptName Fragments:Quests:QF_RL040Quest_0025A9E2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property RL040Quest_PirateScene Auto Const
Scene Property RL040Quest_VictimScene Auto Const
Scene Property RL040Quest_DisablesRadioScene Auto Const
ReferenceAlias Property Alias_ShipEnableMarker Auto Const
ReferenceAlias Property Alias_DirectionSwapTrigger Auto Const
ReferenceAlias Property Alias_GroundEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Switch Auto Const mandatory
ReferenceAlias Property Alias_PirateTrigger Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.setObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  RL040Quest_VictimScene.Stop()
  RL040Quest_PirateScene.Start()
  Alias_DirectionSwapTrigger.GetRef().Disable(False)
  Alias_GroundEnableMarker.GetRef().Enable(False)
  Utility.wait(15.0)
  Alias_ShipEnableMarker.GetRef().Enable(False)
  Self.SetObjectiveCompleted(10, True)
EndFunction

Function Fragment_Stage_0030_Item_00()
  RL040Quest_VictimScene.Stop()
  RL040Quest_DisablesRadioScene.Start()
  Alias_PirateTrigger.GetRef().Disable(False)
  Alias_DirectionSwapTrigger.GetRef().Disable(False)
  Alias_GroundEnableMarker.GetRef().Enable(False)
  Utility.wait(10.0)
  Alias_ShipEnableMarker.GetRef().Enable(False)
  Self.SetObjectiveCompleted(10, True)
EndFunction
