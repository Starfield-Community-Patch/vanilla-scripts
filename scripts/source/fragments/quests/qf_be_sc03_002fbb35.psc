ScriptName Fragments:Quests:QF_BE_SC03_002FBB35 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property BE_SC03_McGrathEncounterStateGlobal Auto Const mandatory
Scene Property BE_SC03_WelcomeScene Auto Const mandatory
LeveledItem Property BE_SC03_ExtortionReward Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  kmyQuest.SetCrewPlayerFriend(True, True)
EndFunction

Function Fragment_Stage_0020_Item_00()
  BE_SC03_WelcomeScene.Start()
EndFunction

Function Fragment_Stage_0021_Item_00()
  BE_SC03_WelcomeScene.Stop()
EndFunction

Function Fragment_Stage_0027_Item_00()
  Game.GetPlayer().AddItem(BE_SC03_ExtortionReward as Form, 1, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  spaceshipreference enemyShipRef = Alias_EnemyShip.GetShipRef()
  If enemyShipRef.GetValue(SpaceshipCrew) > 0.0
    enemyShipRef.DisableWithGravJump()
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  kmyQuest.SetCrewPlayerFriend(False, True)
  BE_SC03_McGrathEncounterStateGlobal.SetValue(2.0)
EndFunction

Function Fragment_Stage_1000_Item_00()
  If Self.GetStageDone(30) && BE_SC03_McGrathEncounterStateGlobal.GetValue() == 0.0
    BE_SC03_McGrathEncounterStateGlobal.SetValue(1.0)
  EndIf
EndFunction
