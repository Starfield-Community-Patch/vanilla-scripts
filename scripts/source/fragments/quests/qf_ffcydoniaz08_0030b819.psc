ScriptName Fragments:Quests:QF_FFCydoniaZ08_0030B819 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_DevicePlaced Auto Const mandatory
Quest Property FFCydoniaZ08Misc Auto Const mandatory
ReferenceAlias Property Alias_DeviceActivator Auto Const mandatory
ReferenceAlias Property Alias_Device Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  If FFCydoniaZ08Misc.IsRunning()
    FFCydoniaZ08Misc.SetStage(1000)
  EndIf
  Alias_DeviceActivator.GetRef().Enable(False)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Device.GetRef() as Form, 1, False, None)
  Alias_DevicePlaced.GetRef().Enable(False)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.Stop()
EndFunction
