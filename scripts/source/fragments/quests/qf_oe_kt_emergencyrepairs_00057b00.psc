ScriptName Fragments:Quests:QF_OE_KT_EmergencyRepairs_00057B00 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Marker_ShipLandingA Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory
LocationAlias Property Alias_ShipA_InteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_ShipA_InteriorMarker00 Auto Const mandatory
ReferenceAlias Property Alias_NPC_VanguardCaptain Auto Const mandatory
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory
ReferenceAlias Property Alias_ShipContainer Auto Const mandatory
Scene Property OE_KT_EmergencyRepairs_MoveToPostion Auto Const mandatory
GlobalVariable Property OE_KT_EmergencyRepairs_Global Auto Const mandatory
GlobalVariable Property OE_KT_EmergencyRepairs_Global02 Auto Const mandatory
GlobalVariable Property OE_KT_EmergencyRepairs_Global03 Auto Const mandatory
ReferenceAlias Property Alias_ShipLoadDoor Auto Const mandatory
LocationAlias Property Alias_ShipA_ExteriorLocation Auto Const mandatory
Faction Property OE_ShipOwnerFaction Auto Const mandatory
GlobalVariable Property OE_KT_EmergencyRepairs_Global04 Auto Const mandatory
ReferenceAlias Property Alias_ShipA_LandingDeckMarker00 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
LocationAlias Property Alias_OE_Location Auto Const mandatory
Keyword Property LocTypeOE_ThemeEmptyKeyword Auto Const mandatory
ReferenceAlias Property Alias_soundMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  OE_KT_EmergencyRepairs_Global.SetValue(1.0)
EndFunction

Function Fragment_Stage_0002_Item_00()
  OE_KT_EmergencyRepairs_Global02.SetValue(1.0)
EndFunction

Function Fragment_Stage_0003_Item_00()
  OE_KT_EmergencyRepairs_Global03.SetValue(1.0)
EndFunction

Function Fragment_Stage_0004_Item_00()
  OE_KT_EmergencyRepairs_Global04.SetValue(1.0)
EndFunction

Function Fragment_Stage_0009_Item_00()
  Alias_MapMarker.TryToEnable()
EndFunction

Function Fragment_Stage_0015_Item_00()
  Alias_ShipA.GetShipRef().PlayAnimation("to_ShipDamageState02")
EndFunction

Function Fragment_Stage_0019_Item_00()
  Alias_PilotSeat.GetRef().BlockActivation(True, False)
EndFunction

Function Fragment_Stage_0080_Item_00()
  Alias_ShipA.GetShipRef().SetExteriorLoadDoorInaccessible(False)
  OE_KT_EmergencyRepairs_MoveToPostion.Start()
  Actor PilotRef = Alias_NPC_VanguardCaptain.GetActorRef()
  Cell myShipCell = Alias_PilotSeat.GetRef().GetParentCell()
  myShipCell.SetFactionOwner(OE_ShipOwnerFaction)
  myShipCell.SetPublic(True)
EndFunction

Function Fragment_Stage_0090_Item_00()
  Alias_ShipA.RefillDependentAliases()
  Alias_soundMarker.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0099_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  Int Randomizer = Utility.RandomInt(1, 4)
  If Randomizer == 1
    Self.SetStage(11)
  ElseIf Randomizer == 2
    Self.SetStage(12)
  ElseIf Randomizer == 3
    Self.SetStage(13)
  ElseIf Randomizer == 4
    Self.SetStage(14)
  EndIf
  kmyQuest.LandShip(-1)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  Self.SetStage(10)
  Int I = 0
  While I < 1
    Int Randomizer = Utility.RandomInt(1, 4)
    If Randomizer == 1 && OE_KT_EmergencyRepairs_Global.GetValue() == 0.0
      Self.SetStage(11)
      I += 1
    ElseIf Randomizer == 2 && OE_KT_EmergencyRepairs_Global02.GetValue() == 0.0
      Self.SetStage(12)
      I += 1
    ElseIf Randomizer == 3 && OE_KT_EmergencyRepairs_Global03.GetValue() == 0.0
      Self.SetStage(13)
      I += 1
    ElseIf Randomizer == 4 && OE_KT_EmergencyRepairs_Global04.GetValue() == 0.0
      Self.SetStage(14)
      I += 1
    EndIf
  EndWhile
  kmyQuest.LandShip(-1)
EndFunction

Function Fragment_Stage_0100_Item_01()
  Self.SetStage(99)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  If Game.GetPlayer().GetDistance(Alias_ShipA_LandingDeckMarker00.GetRef()) > 10.0
    Alias_soundMarker.GetRef().DisableNoWait(False)
    spaceshipreference ShipRef = Alias_ShipA.GetShipRef()
    ShipRef.PlayAnimation("to_ShipFullHealth")
    ShipRef.SetExteriorLoadDoorInaccessible(True)
    kmyQuest.LaunchShip(0, None, False)
    If Alias_OE_Location.GetLocation().HasKeyword(LocTypeOE_ThemeEmptyKeyword)
      Alias_MapMarker.TryToDisable()
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
