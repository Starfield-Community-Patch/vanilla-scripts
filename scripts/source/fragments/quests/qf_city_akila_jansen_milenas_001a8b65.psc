ScriptName Fragments:Quests:QF_City_Akila_Jansen_MilenaS_001A8B65 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Scene Property City_Akila_Jansen_MilenaSpace_500_EnemiesDown Auto Const mandatory
ReferenceAlias Property Alias_MilenaAxelrod Auto Const mandatory
ReferenceAlias Property Alias_MileaShipCaptainMarker Auto Const mandatory
Quest Property City_Akila_Jansen Auto Const mandatory
ReferenceAlias Property Alias_MilenaShip Auto Const mandatory
ReferenceAlias Property Alias_DallianceMapMarker Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_MilenaShip.GetRef().MoveTo(Alias_DallianceMapMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  City_Akila_Jansen_MilenaSpace_500_EnemiesDown.Start()
  City_Akila_Jansen.SetStage(300)
  Alias_MilenaShip.GetShipRef().SetValue(DockingPermission, 0.0)
EndFunction
