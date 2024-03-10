ScriptName Fragments:Quests:QF_CF02_Ragana_SpaceEncounte_0022EF4E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory
Quest Property CF02 Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
ReferenceAlias Property Alias_EscortShip Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_RaganaSpeechChallenge Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_RaganaSpeechChallenge.ForceRefTo(Alias_Ship01.GetRef())
EndFunction

Function Fragment_Stage_0200_Item_00()
  spaceshipreference ShipRaganaRef = Alias_Ship01.GetRef() as spaceshipreference
  spaceshipreference ShipEscortRef = Alias_EscortShip.GetRef() as spaceshipreference
  ShipRaganaRef.SetValue(Aggression, 2.0)
  ShipRaganaRef.AddToFaction(PlayerEnemyFaction)
  ShipRaganaRef.SetValue(DockingPermission, 4.0)
  ShipEscortRef.SetValue(Aggression, 2.0)
  ShipEscortRef.AddToFaction(PlayerEnemyFaction)
  ShipEscortRef.Startcombat(Alias_playerShip.GetShipRef(), False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  CF02.SetStage(520)
EndFunction
