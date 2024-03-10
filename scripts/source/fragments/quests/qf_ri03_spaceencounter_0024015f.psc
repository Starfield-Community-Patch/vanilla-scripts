ScriptName Fragments:Quests:QF_RI03_SpaceEncounter_0024015F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory
Quest Property RI03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0200_Item_00()
  spaceshipreference ShipREF = Alias_Ship01.GetRef() as spaceshipreference
  ShipREF.SetValue(Aggression, 2.0)
  ShipREF.AddToFaction(PlayerEnemyFaction)
EndFunction

Function Fragment_Stage_0500_Item_00()
  RI03.SetStage(420)
EndFunction
