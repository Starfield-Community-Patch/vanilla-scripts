ScriptName Fragments:Quests:QF_SE_AF02_00222A40 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_playerShip Auto Const mandatory
Potion Property ShipRepairKit Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory
Scene Property SE_AF02_004_RaceScene Auto Const
GlobalVariable Property SE_AF02_GateCount Auto Const
MiscObject Property Credits Auto Const
Scene Property SE_AF02_006_LoseScene Auto Const
Scene Property SE_AF02_007_WinScene Auto Const
Scene Property SE_AF02_001_HailingScene Auto Const mandatory
GlobalVariable Property SE_AF02_CreditCount Auto Const mandatory
GlobalVariable Property SE_AF02_DestroyShip Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  SE_AF02_001_HailingScene.Start()
EndFunction

Function Fragment_Stage_0007_Item_00()
  spaceshipreference ShipRef = Alias_Ship01.GetShipRef()
  If ShipRef.Is3DLoaded()
    ShipRef.DisableWithGravJump()
  EndIf
EndFunction

Function Fragment_Stage_0007_Item_01()
  Alias_Ship01.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_0007_Item_02()
  Self.FailAllObjectives()
  Utility.Wait(0.5)
  Alias_MapMarker.GetRef().DisableNoWait(False)
  Self.Stop()
EndFunction

Function Fragment_Stage_0010_Item_00()
  If !Self.GetStageDone(7)
    Self.SetObjectiveDisplayed(10, True, False)
    Alias_Ship01.GetShipRef().BlockActivation(True, True)
  Else
    Self.Stop()
  EndIf
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(30, True)
  If Self.GetStageDone(32)
    SE_AF02_006_LoseScene.Start()
    Alias_Ship01.GetShipRef().AddItem(Credits as Form, SE_AF02_CreditCount.GetValueInt(), False)
  Else
    SE_AF02_007_WinScene.Start()
  EndIf
EndFunction

Function Fragment_Stage_0032_Item_00()
  Self.SetStage(30)
EndFunction

Function Fragment_Stage_0035_Item_00()
  Alias_Ship01.GetShipRef().BlockActivation(False, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  SE_AF02_GateCount.setvalue(1.0)
  spaceshipreference raceShip = Alias_Ship01.GetShipRef()
  raceShip.BlockActivation(False, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.GetStageDone(32)
    SE_AF02_DestroyShip.setvalue(1.0)
  EndIf
EndFunction

Function Fragment_Stage_0750_Item_00()
  Self.SetObjectiveDisplayed(750, True, False)
EndFunction
