ScriptName Fragments:Quests:QF_FFRedMileR01_002DFEDB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PlayerCompletedRedMile Auto Const mandatory
Quest Property FFRedMileR01Misc Auto Const mandatory
Quest Property DialogueRedMile Auto Const mandatory
ReferenceAlias Property Alias_RedMileStartingDoor Auto Const mandatory
RefCollectionAlias Property Alias_LightRotationHelpers Auto Const mandatory
ReferenceAlias Property Alias_DoorLightsEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_StageLightsEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Mei Auto Const mandatory
GlobalVariable Property FFRedMileR01_RunCount Auto Const mandatory
GlobalVariable Property FFRedMileR01_RunCountRecord Auto Const mandatory
LeveledItem Property LL_Weapon_AA99_Unique_02 Auto Const mandatory
LeveledItem Property CreditsReward Auto Const
LeveledItem Property LL_FFRedMileR01_Reward Auto Const mandatory
Message Property FFRedMileR01_BuildRewardMsg Auto Const mandatory
LeveledItem Property LL_Weapon_Pacifier_Unique_01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  PlayerCompletedRedMile.SetValue(18.0)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript
  Alias_Mei.GetActorRef().EvaluatePackage(False)
  If FFRedMileR01Misc.IsRunning()
    FFRedMileR01Misc.SetStage(1000)
  EndIf
  Self.SetObjectiveDisplayed(100, True, False)
  Alias_StageLightsEnableMarker.GetRef().Enable(False)
  kmyQuest.SpawnCreatures(0)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  kmyQuest.RMDisableFastTravel()
  Alias_RedMileStartingDoor.GetRef().SetOpen(True)
  Alias_DoorLightsEnableMarker.GetRef().Enable(False)
  Alias_StageLightsEnableMarker.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  kmyQuest.SpawnCreatures(1)
EndFunction

Function Fragment_Stage_0400_Item_00()
  PlayerCompletedRedMile.Mod(1.0)
  Self.UpdateCurrentInstanceGlobal(PlayerCompletedRedMile)
  DialogueRedMile.UpdateCurrentInstanceGlobal(PlayerCompletedRedMile)
  Alias_RedMileStartingDoor.GetRef().SetOpen(False)
  Alias_DoorLightsEnableMarker.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_10000_Item_00()
  Alias_RedMileStartingDoor.GetRef().SetOpen(False)
  Self.Stop()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest
  ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript
  Self.CompleteAllObjectives()
  Float runCountNewValue = FFRedMileR01_RunCount.Mod(1.0)
  Actor playerRef = Game.GetPlayer()
  playerRef.AddItem(CreditsReward as Form, 1, False)
  If runCountNewValue == 1.0
    playerRef.AddItem(LL_Weapon_Pacifier_Unique_01 as Form, 1, False)
  ElseIf runCountNewValue == FFRedMileR01_RunCountRecord.GetValue()
    playerRef.AddItem(LL_Weapon_AA99_Unique_02 as Form, 1, False)
    FFRedMileR01_BuildRewardMsg.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Else
    playerRef.AddItem(LL_FFRedMileR01_Reward as Form, 1, False)
  EndIf
  kmyQuest.RMEnableFastTravel()
EndFunction

Function Fragment_Stage_2000_Item_00()
  Quest __temp = Self as Quest
  ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript
  Self.FailAllObjectives()
  kmyQuest.RMEnableFastTravel()
  Alias_RedMileStartingDoor.GetRef().SetOpen(False)
  Alias_DoorLightsEnableMarker.GetRef().Disable(False)
  Self.Stop()
EndFunction
