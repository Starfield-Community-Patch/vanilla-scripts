ScriptName Fragments:Quests:QF_SE_FAB12_00062B49 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_SecurityShip Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  PHailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0066_Item_00()
  spaceshipreference HailingShip = Alias_HailingShip.GetShipRef()
  spaceshipreference SecurityShip = Alias_SecurityShip.GetShipRef()
  HailingShip.AddtoFaction(PlayerEnemyFaction)
  HailingShip.SetValue(Aggression, 1.0)
  SecurityShip.AddtoFaction(PlayerEnemyFaction)
  SecurityShip.SetValue(Aggression, 1.0)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Utility.wait(4.0)
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
EndFunction
