ScriptName Fragments:Quests:QF_FC08SpaceEnc01_0038DB7B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0200_Item_00()
  spaceshipreference ShipREF = Alias_Ship01.GetRef() as spaceshipreference
  ShipREF.SetValue(Aggression, 2.0)
  ShipREF.AddToFaction(PlayerEnemyFaction)
EndFunction
