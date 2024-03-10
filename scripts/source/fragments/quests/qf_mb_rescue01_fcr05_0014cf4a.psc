ScriptName Fragments:Quests:QF_MB_Rescue01_FCR05_0014CF4A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory
Quest Property FC02 Auto Const mandatory
ReferenceAlias Property Alias_EnemyShipPilotSeat Auto Const mandatory
ReferenceAlias Property Alias_prisoner Auto Const mandatory
ActorValue Property SQ_CaptiveStateNoBlockingHellos Auto Const mandatory
RefCollectionAlias Property Alias_enemies Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  If FC02.IsRunning() && FC02.GetStageDone(160)
    FC02.SetStage(170)
  EndIf
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_EnemyShipPilotSeat.GetRef().BlockActivation(True, False)
  Alias_prisoner.TryToSetValue(SQ_CaptiveStateNoBlockingHellos, 1.0)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Int enemies = Alias_enemies.GetCount()
  Int enemiesDead = Alias_enemies.GetCountDead()
  If enemiesDead >= enemies
    Self.SetStage(90)
  EndIf
EndFunction

Function Fragment_Stage_0060_Item_00()
  Int nRand = Utility.RandomInt(0, 20)
  Int nReward = 800 + nRand * 50
  Game.GetPlayer().AddItem(Credits as Form, nReward, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  missionrescuequestscript kmyQuest = __temp as missionrescuequestscript
  defaultcaptivealias CaptiveNPC = Alias_prisoner as defaultcaptivealias
  CaptiveNPC.FreePrisoner(True, False)
  If FC02.IsRunning() && FC02.GetStageDone(160)
    FC02.SetStage(180)
  EndIf
  kmyQuest.MissionComplete()
  fcrquestscript myFCRQuest = (kmyQuest as Quest) as fcrquestscript
  myFCRQuest.FCRMissionComplete()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  missionrescuequestscript kmyQuest = __temp as missionrescuequestscript
  kmyQuest.MissionComplete()
  kmyQuest.MissionShutdown()
  Alias_EnemyShipPilotSeat.GetRef().BlockActivation(False, False)
EndFunction
