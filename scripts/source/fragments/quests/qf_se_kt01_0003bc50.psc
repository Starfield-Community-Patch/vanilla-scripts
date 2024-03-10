ScriptName Fragments:Quests:QF_SE_KT01_0003BC50 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
ReferenceAlias Property Alias_HailingShip_FemaleEvenToned Auto Const mandatory
ReferenceAlias Property Alias_HailingShip_Male06 Auto Const mandatory
ReferenceAlias Property Alias_HailingShip_Male08 Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
Quest Property BE_KT01 Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const
Faction Property REPlayerAlly Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
LocationAlias Property Alias_HailingShipInterior Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Int random = Utility.RandomInt(0, 2)
  spaceshipreference FemaleEvenToned = Alias_HailingShip_FemaleEvenToned.GetShipRef()
  spaceshipreference Male06 = Alias_HailingShip_Male06.GetShipRef()
  spaceshipreference Male08 = Alias_HailingShip_Male08.GetShipRef()
  If random == 0
    Alias_HailingShip.ForceRefTo(FemaleEvenToned as ObjectReference)
  ElseIf random == 1
    Alias_HailingShip.ForceRefTo(Male06 as ObjectReference)
  ElseIf random == 2
    Alias_HailingShip.ForceRefTo(Male08 as ObjectReference)
  EndIf
  spaceshipreference pShip = Alias_HailingShip.GetShipRef()
  pShip.EnableNoWait(False)
  pShip.IgnoreFriendlyHits(True)
  pShip.SetValue(SpaceshipCrew, 1.0)
EndFunction

Function Fragment_Stage_0000_Item_01()
  spaceshipreference FemaleEvenToned = Alias_HailingShip_FemaleEvenToned.GetShipRef()
  Alias_HailingShip.ForceRefTo(FemaleEvenToned as ObjectReference)
  Alias_HailingShip.GetShipRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0000_Item_02()
  spaceshipreference Male06 = Alias_HailingShip_Male06.GetShipRef()
  Alias_HailingShip.ForceRefTo(Male06 as ObjectReference)
  Alias_HailingShip.GetShipRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0000_Item_03()
  spaceshipreference Male08 = Alias_HailingShip_Male08.GetShipRef()
  spaceshipreference Male06 = Alias_HailingShip_Male06.GetShipRef()
  Alias_HailingShip.ForceRefTo(Male08 as ObjectReference)
  Alias_HailingShip.GetShipRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 0.0)
EndFunction

Function Fragment_Stage_0006_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 4.0)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
EndFunction

Function Fragment_Stage_0040_Item_00()
  BE_KT01.SetObjectiveSkipped(10)
  BE_KT01.SetObjectiveSkipped(20)
  Self.SetObjectiveSkipped(20)
EndFunction

Function Fragment_Stage_0040_Item_01()
  Actor CaptainRef = Alias_Captain.GetActorRef()
  CaptainRef.RemoveFromFaction(REPlayerAlly)
  CaptainRef.AddtoFaction(PlayerEnemyFaction)
  CaptainRef.SetValue(Aggression, 1.0)
  CaptainRef.StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  PHailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0066_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(SpaceshipCrew, 0.0)
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
  Alias_MapMarker.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveFailed(20, True)
  Self.Stop()
EndFunction
