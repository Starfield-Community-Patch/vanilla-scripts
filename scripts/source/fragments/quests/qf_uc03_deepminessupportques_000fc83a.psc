ScriptName Fragments:Quests:QF_UC03_DeepMinesSupportQues_000FC83A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC03_PlayerKilledSpacerBoss Auto Const mandatory
ReferenceAlias Property Alias_SpacerEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_ElevatorFloorMarker_Int Auto Const mandatory
ReferenceAlias Property Alias_ElevatorFloorMarker_Ext Auto Const mandatory
ReferenceAlias Property Alias_SpacerEnableMarker_Ext Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  UC03_PlayerKilledSpacerBoss.SetValue(1.0)
EndFunction

Function Fragment_Stage_0150_Item_00()
  loadelevatorfloorscript IntElevator = Alias_ElevatorFloorMarker_Int.GetRef() as loadelevatorfloorscript
  loadelevatorfloorscript ExtElevator = Alias_ElevatorFloorMarker_Ext.GetRef() as loadelevatorfloorscript
  ExtElevator.SetAccessible(True)
  IntElevator.SetAccessible(True)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_SpacerEnableMarker.GetRef().Disable(False)
  Alias_SpacerEnableMarker_Ext.GetRef().Disable(False)
EndFunction
