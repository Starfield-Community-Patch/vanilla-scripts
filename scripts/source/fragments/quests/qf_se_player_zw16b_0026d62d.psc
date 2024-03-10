ScriptName Fragments:Quests:QF_SE_Player_ZW16b_0026D62D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ActorValue Property SE_Player_ZW16_Demeanor_AV Auto Const mandatory
Scene Property SE_ZW16b_100a_OpeningScene Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  spaceshipreference myShip = Alias_HailingShip.GetRef() as spaceshipreference
  Int iDemeanor = Utility.RandomInt(0, 1)
  myShip.SetValue(SE_Player_ZW16_Demeanor_AV, iDemeanor as Float)
EndFunction

Function Fragment_Stage_0050_Item_00()
  SE_ZW16b_100a_OpeningScene.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
EndFunction

Function Fragment_Stage_0400_Item_00()
  Utility.Wait(1.0)
  Alias_HailingShip.GetShipRef().DisableWithGravJump()
  Alias_MapMarker.GetRef().DisableNoWait(False)
EndFunction
