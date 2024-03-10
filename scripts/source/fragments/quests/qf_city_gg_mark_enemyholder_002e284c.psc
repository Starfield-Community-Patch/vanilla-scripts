ScriptName Fragments:Quests:QF_City_GG_Mark_EnemyHolder_002E284C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property enemies Auto Const mandatory
RefCollectionAlias Property Alias_enemies Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  enemies.AddRefCollection(Alias_enemies)
  Self.Stop()
EndFunction
