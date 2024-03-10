ScriptName Fragments:Quests:QF_FC03_SpaceEncounterQuest_001FE72F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory
ReferenceAlias Property Alias_OutlawShipRookie01 Auto Const mandatory
ReferenceAlias Property Alias_OutlawShipRookie02 Auto Const mandatory
ActorValue Property Health Auto Const mandatory
RefCollectionAlias Property Alias_OutlawShipsAll Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0200_Item_00()
  Alias_OutlawShipsAll.SetValue(Aggression, 2.0)
  Alias_OutlawShipsAll.AddToFaction(PlayerEnemyFaction)
  Alias_Ship01.GetShipRef().EnablePartRepair(Health, False)
  Alias_OutlawShipRookie01.GetShipRef().EnablePartRepair(Health, False)
  Alias_OutlawShipRookie02.GetShipRef().EnablePartRepair(Health, False)
  Float fBlastDamage01 = Alias_Ship01.GetShipRef().GetBaseValue(Health) * 0.400000006
  Alias_Ship01.GetShipRef().DamageValue(Health, fBlastDamage01)
  Float fBlastDamage02 = Alias_OutlawShipRookie01.GetShipRef().GetBaseValue(Health) * 0.600000024
  Alias_OutlawShipRookie01.GetShipRef().DamageValue(Health, fBlastDamage02)
  Float fBlastDamage03 = Alias_OutlawShipRookie02.GetShipRef().GetBaseValue(Health) * 0.5
  Alias_OutlawShipRookie02.GetShipRef().DamageValue(Health, fBlastDamage03)
EndFunction
