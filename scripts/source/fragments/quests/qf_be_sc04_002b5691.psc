ScriptName Fragments:Quests:QF_BE_SC04_002B5691 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property BE_SC04_BargainingScene Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const mandatory
ActorValue Property Health Auto Const mandatory
Scene Property BE_SC04_BargainingSceneIntro Auto Const mandatory
ReferenceAlias Property Alias_CaptainEssentialAlias Auto Const mandatory
Scene Property BE_SC04_BargainSucceeds Auto Const mandatory
Scene Property BE_SC04_BargainFails Auto Const mandatory
GlobalVariable Property BE_SC04_PirateKeepsBargainChanceGlobal Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip Auto Const mandatory
Keyword Property BE_SC04_Misc_Keyword Auto Const mandatory
Quest Property BE_SC04_Misc Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  BE_SC04_BargainingSceneIntro.Start()
EndFunction

Function Fragment_Stage_0021_Item_00()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  kmyQuest.SetCrewPlayerFriend(True, True)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  BE_SC04_BargainingSceneIntro.Stop()
  BE_SC04_BargainingScene.Stop()
  Actor captainRef = Alias_Captain.GetActorRef()
  If captainRef.GetValue(Health) <= 0.0
    captainRef.RestoreValue(Health, Math.Abs(captainRef.GetValue(Health)) + 1.0)
  EndIf
  Alias_CaptainEssentialAlias.Clear()
  kmyQuest.SetCrewPlayerFriend(False, True)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Quest __temp = Self as Quest
  be_sc04questscript kmyQuest = __temp as be_sc04questscript
  kmyQuest.SpawnJumpTravelMarker()
  If Self.GetStageDone(30) && !Self.GetStageDone(50)
    If Utility.RandomInt(0, 100) < BE_SC04_PirateKeepsBargainChanceGlobal.GetValueInt()
      BE_SC04_BargainSucceeds.Start()
    Else
      BE_SC04_BargainFails.Start()
    EndIf
  Else
    Self.SetStage(70)
  EndIf
EndFunction

Function Fragment_Stage_0061_Item_00()
  BE_SC04_Misc.SetStage(10)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Quest __temp = Self as Quest
  be_sc04questscript kmyQuest = __temp as be_sc04questscript
  spaceshipreference enemyShipRef = Alias_EnemyShip.GetShipRef()
  If enemyShipRef.GetValue(SpaceshipCrew) > 0.0
    enemyShipRef.DisableWithGravJump()
  EndIf
EndFunction
