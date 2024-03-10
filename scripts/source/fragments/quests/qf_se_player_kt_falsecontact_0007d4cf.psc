ScriptName Fragments:Quests:QF_SE_Player_KT_FalseContact_0007D4CF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory
GlobalVariable Property OE_FalseContact_Global Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
RefCollectionAlias Property Alias_ShipFighters Auto Const mandatory
ReferenceAlias Property Alias_HailingShip01 Auto Const mandatory
ReferenceAlias Property Alias_HailingShip02 Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
GlobalVariable Property OE_Credit_FalseContactCredits Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  spaceshipreference HailerRef = Alias_HailingShip.GetShipRef()
  spaceshipreference HailerRef01 = Alias_HailingShip01.GetShipRef()
  spaceshipreference HailerRef02 = Alias_HailingShip02.GetShipRef()
  Alias_ShipFighters.AddRef(HailerRef as ObjectReference)
  Alias_ShipFighters.AddRef(HailerRef01 as ObjectReference)
  Alias_ShipFighters.AddRef(HailerRef02 as ObjectReference)
  HailerRef.EnableWithGravJump()
  HailerRef01.EnableWithGravJump()
  HailerRef02.EnableWithGravJump()
  Alias_ShipFighters.SetValue(DockingPermission, 4.0)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Utility.Wait(4.0)
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0050_Item_00()
  PHailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, OE_Credit_FalseContactCredits.GetValueInt(), False, None)
  OE_FalseContact_Global.SetValue(0.0)
  Utility.Wait(2.0)
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_ShipFighters.AddtoFaction(PlayerEnemyFaction)
  Alias_ShipFighters.SetValue(Aggression, 1.0)
  Alias_ShipFighters.StartCombatAll(Alias_PlayerShip.GetShipRef() as ObjectReference)
  OE_FalseContact_Global.SetValue(0.0)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_HailingShip.GetShipRef().DisableWithGravJump()
  Utility.Wait(1.0)
  Alias_HailingShip01.GetShipRef().DisableWithGravJump()
  Alias_HailingShip02.GetShipRef().DisableWithGravJump()
EndFunction
