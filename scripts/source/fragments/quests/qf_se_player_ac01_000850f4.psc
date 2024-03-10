ScriptName Fragments:Quests:QF_SE_Player_AC01_000850F4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
GlobalVariable Property PSE_Player_AC01_RunOnce Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0066_Item_00()
  spaceshipreference ShipRef = Alias_HailingShip.GetShipRef()
  ShipRef.AddtoFaction(PlayerEnemyFaction)
  ShipRef.SetValue(Aggression, 1.0)
  ShipRef.StartCombat(Alias_PlayerShip.GetShipRef(), False)
  Self.Setstage(300)
EndFunction

Function Fragment_Stage_0100_Item_00()
  PSE_Player_AC01_RunOnce.SetValue(1.0)
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.SetGhost(True)
  Utility.wait(3.0)
  oTarg.DisableWithGravJump()
  Alias_MapMarker.GetRef().DisableNoWait(False)
  Self.Setstage(1000)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
