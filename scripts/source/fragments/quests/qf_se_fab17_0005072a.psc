ScriptName Fragments:Quests:QF_SE_FAB17_0005072A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory
Scene Property SE_FAB17_050_InitialScene Auto Const mandatory
ReferenceAlias Property Alias_Smuggler Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0001_Item_00()
  Alias_Smuggler.GetShipRef().DisableWithGravJump()
  spaceshipreference ShipRef = Alias_HailingShip.GetShipRef()
  ShipRef.AddtoFaction(PlayerEnemyFaction)
  ShipRef.SetValue(Aggression, 1.0)
EndFunction

Function Fragment_Stage_0005_Item_00()
  PHailTemplate_100a_Hailing.Stop()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Utility.wait(5.0)
  SE_FAB17_050_InitialScene.Start()
EndFunction

Function Fragment_Stage_0066_Item_00()
  spaceshipreference SmugglerShip = Alias_Smuggler.GetShipRef()
  SE_FAB17_050_InitialScene.Stop()
  SmugglerShip.AddtoFaction(PlayerEnemyFaction)
  SmugglerShip.SetValue(Aggression, 1.0)
  Utility.wait(2.0)
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0100_Item_00()
  PHailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
EndFunction

Function Fragment_Stage_0325_Item_00()
  SE_FAB17_050_InitialScene.Stop()
EndFunction

Function Fragment_Stage_0350_Item_00()
  SE_FAB17_050_InitialScene.Stop()
  (Alias_Smuggler.GetRef() as spaceshipreference).DisableWithGravJumpNoWait()
EndFunction
