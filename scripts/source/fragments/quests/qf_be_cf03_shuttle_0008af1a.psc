ScriptName Fragments:Quests:QF_BE_CF03_Shuttle_0008AF1A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property Alias_EnemyShipInteriorLocation Auto Const mandatory
Keyword Property SQ_Followers_DisallowTeleportWaitingFollowersToShip Auto Const mandatory
Keyword Property SpaceshipPreventRampOpenOnLanding Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip Auto Const mandatory
Keyword Property BE_CF03_ShuttleShipKeyword Auto Const mandatory
Keyword Property SpaceshipTakeOffPriorityCameraKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Location enemyShipInteriorLoc = Alias_EnemyShipInteriorLocation.GetLocation()
  enemyShipInteriorLoc.AddKeyword(SQ_Followers_DisallowTeleportWaitingFollowersToShip)
  enemyShipInteriorLoc.AddKeyword(SpaceshipTakeOffPriorityCameraKeyword)
  enemyShipInteriorLoc.AddKeyword(BE_CF03_ShuttleShipKeyword)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  Alias_EnemyShipInteriorLocation.GetLocation().RemoveKeyword(SQ_Followers_DisallowTeleportWaitingFollowersToShip)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  Self.SetStage(20)
  Alias_EnemyShip.GetShipRef().RemoveKeyword(SpaceshipPreventRampOpenOnLanding)
  Alias_EnemyShipInteriorLocation.GetLocation().RemoveKeyword(SpaceshipTakeOffPriorityCameraKeyword)
  kmyQuest.CleanupAndStop()
EndFunction
