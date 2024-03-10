ScriptName Fragments:Quests:QF_SE_FAB03_0008553C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory
ActorValue Property ShipSystemEngineHealth Auto Const mandatory
ActorValue Property ShipSystemGravDriveHealth Auto Const mandatory
ActorValue Property ShipSystemReactorHealth Auto Const mandatory
ActorValue Property ShipSystemShieldsHealth Auto Const mandatory
ActorValue Property ShipSystemWeaponGroup1Health Auto Const mandatory
ActorValue Property ShipSystemWeaponGroup2Health Auto Const mandatory
ActorValue Property ShipSystemWeaponGroup3Health Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
Faction Property PPlayerEnemyFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  spaceshipreference sTarg = Alias_HailingShip.GetRef() as spaceshipreference
  ActorValue avSystem = ShipSystemEngineHealth
  sTarg.EnablePartRepair(avSystem, False)
  sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem))
  avSystem = ShipSystemGravDriveHealth
  sTarg.EnablePartRepair(avSystem, False)
  sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem))
  avSystem = ShipSystemReactorHealth
  sTarg.EnablePartRepair(avSystem, False)
  sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem))
  avSystem = ShipSystemShieldsHealth
  sTarg.EnablePartRepair(avSystem, False)
  sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem))
  avSystem = ShipSystemWeaponGroup1Health
  sTarg.EnablePartRepair(avSystem, False)
  sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem))
  avSystem = ShipSystemWeaponGroup2Health
  sTarg.EnablePartRepair(avSystem, False)
  sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem))
  avSystem = ShipSystemWeaponGroup3Health
  sTarg.EnablePartRepair(avSystem, False)
  sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem))
EndFunction

Function Fragment_Stage_0050_Item_00()
  PHailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Utility.Wait(4.0)
  Self.SetStage(210)
EndFunction

Function Fragment_Stage_0210_Item_00()
  spaceshipreference sTarg = Alias_HailingShip.GetRef() as spaceshipreference
  sTarg.StartCombat(Alias_playerShip.GetRef() as spaceshipreference, False)
  sTarg.AddToFaction(PPlayerEnemyFaction)
  ActorValue avSystem = ShipSystemEngineHealth
  sTarg.EnablePartRepair(avSystem, True)
  sTarg.RestoreValue(avSystem, 100.0)
  avSystem = ShipSystemReactorHealth
  sTarg.EnablePartRepair(avSystem, True)
  sTarg.RestoreValue(avSystem, 100.0)
  avSystem = ShipSystemShieldsHealth
  sTarg.EnablePartRepair(avSystem, True)
  sTarg.RestoreValue(avSystem, 100.0)
  avSystem = ShipSystemWeaponGroup1Health
  sTarg.EnablePartRepair(avSystem, True)
  sTarg.RestoreValue(avSystem, 100.0)
  avSystem = ShipSystemWeaponGroup2Health
  sTarg.EnablePartRepair(avSystem, True)
  sTarg.RestoreValue(avSystem, 100.0)
  avSystem = ShipSystemWeaponGroup3Health
  sTarg.EnablePartRepair(avSystem, True)
  sTarg.RestoreValue(avSystem, 100.0)
EndFunction

Function Fragment_Stage_0220_Item_00()
  spaceshipreference sTarg = Alias_HailingShip.GetRef() as spaceshipreference
  ActorValue avSystem = ShipSystemShieldsHealth
  sTarg.EnablePartRepair(avSystem, True)
  sTarg.RestoreValue(avSystem, 100.0)
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
EndFunction
