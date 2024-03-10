ScriptName Fragments:Quests:QF_PlayerSkills_002C59E4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Health Auto Const mandatory
ActorValue Property CarryWeight Auto Const mandatory
ActorValue Property Oxygen Auto Const mandatory
Int Property WellnessBonus Auto Const mandatory
Int Property FitnessBonus Auto Const mandatory
Int Property WeightLiftingBonus Auto Const mandatory
Int Property BotanyBonus Auto Const mandatory
Int Property GeologyBonus Auto Const mandatory
ActorValue Property ScanningPowerLevel Auto Const mandatory
ActorValue Property ZoologyRank Auto Const mandatory
ActorValue Property BotanyRank Auto Const mandatory
GlobalVariable Property Outpost_BuildLimit_CrewStations Auto Const
Int Property OutpostManagementBonus = 1 Auto Const
GlobalVariable Property Outpost_BuildLimit_CargoLinks Auto Const
Int Property OutpostManagementCargoLinksBonus Auto Const
ActorValue Property OutpostMaxDeployed Auto Const
Int Property OutpostMaxDeployedBonus = 20 Auto Const
ActorValue Property PayloadLevel Auto Const
ActorValue Property SecurityMenuRingHighlightingEnabled Auto Const mandatory
ActorValue Property SecurityMenuDisableUnusedKeysOptionEnabled Auto Const mandatory
ActorValue Property SecurityMenuAutoattemptPointsMultiplier Auto Const mandatory
ActorValue Property SecurityMenuMaxAutoattemptPoints Auto Const mandatory
GlobalVariable Property Outpost_BuildLimit_Robots Auto Const
ActorValue Property GalaxyBodyScanAbility Auto Const mandatory
ActorValue Property SurveyingPowerLevel Auto Const mandatory
ActorValue Property SurveyingTraitBonus Auto Const mandatory
GlobalVariable Property SpeechChallengeBribeHighImportance_Cheap Auto Const mandatory
GlobalVariable Property SpeechChallengeBribeHighImportance_Expensive Auto Const mandatory
GlobalVariable Property SpeechChallengeBribeLowImportance_Cheap Auto Const mandatory
GlobalVariable Property SpeechChallengeBribeLowImportance_Expensive Auto Const mandatory
GlobalVariable Property SpeechChallengeBribeHighImportance_CheapBase Auto Const mandatory
GlobalVariable Property SpeechChallengeBribeHighImportance_ExpensiveBase Auto Const mandatory
GlobalVariable Property SpeechChallengeBribeLowImportance_CheapBase Auto Const mandatory
GlobalVariable Property SpeechChallengeBribeLowImportance_ExpensiveBase Auto Const mandatory
GlobalVariable Property FloraPlantRareMin Auto Const mandatory
GlobalVariable Property FloraMineralRareMin Auto Const mandatory
GlobalVariable Property Ships_Piracy_Low Auto Const mandatory
GlobalVariable Property Ships_Piracy_High Auto Const mandatory
GlobalVariable Property Ships_Piracy_High_Base Auto Const mandatory
GlobalVariable Property Ships_Piracy_Low_Base Auto Const mandatory
GlobalVariable Property Skill_Astrophysics_DiscoverTraitChance Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0501_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0502_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0503_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0201_Item_00()
  Game.GetPlayer().SetValue(SecurityMenuMaxAutoattemptPoints, Game.GetPlayer().GetValue(SecurityMenuMaxAutoattemptPoints) + 1.0)
EndFunction

Function Fragment_Stage_0202_Item_00()
  Self.SetStage(201)
  Actor player = Game.GetPlayer()
  player.SetValue(SecurityMenuRingHighlightingEnabled, 1.0)
  player.SetValue(SecurityMenuMaxAutoattemptPoints, Game.GetPlayer().GetValue(SecurityMenuMaxAutoattemptPoints) + 1.0)
EndFunction

Function Fragment_Stage_0203_Item_00()
  Self.SetStage(202)
  Actor player = Game.GetPlayer()
  player.SetValue(SecurityMenuMaxAutoattemptPoints, Game.GetPlayer().GetValue(SecurityMenuMaxAutoattemptPoints) + 1.0)
EndFunction

Function Fragment_Stage_0204_Item_00()
  Self.SetStage(203)
  Actor player = Game.GetPlayer()
  player.SetValue(SecurityMenuAutoattemptPointsMultiplier, 2.0)
  player.SetValue(SecurityMenuDisableUnusedKeysOptionEnabled, 1.0)
  player.SetValue(SecurityMenuMaxAutoattemptPoints, Game.GetPlayer().GetValue(SecurityMenuMaxAutoattemptPoints) + 1.0)
EndFunction

Function Fragment_Stage_0301_Item_00()
  Game.GetPlayer().ModValue(Health, WellnessBonus as Float)
EndFunction

Function Fragment_Stage_0302_Item_00()
  Game.GetPlayer().ModValue(Health, WellnessBonus as Float)
EndFunction

Function Fragment_Stage_0303_Item_00()
  Game.GetPlayer().ModValue(Health, WellnessBonus as Float)
EndFunction

Function Fragment_Stage_0304_Item_00()
  Game.GetPlayer().ModValue(Health, (WellnessBonus * 2) as Float)
EndFunction

Function Fragment_Stage_0401_Item_00()
  Game.GetPlayer().SetValue(BotanyRank, 1.0)
EndFunction

Function Fragment_Stage_0402_Item_00()
  Game.GetPlayer().SetValue(BotanyRank, 2.0)
EndFunction

Function Fragment_Stage_0403_Item_00()
  Game.GetPlayer().SetValue(BotanyRank, 3.0)
EndFunction

Function Fragment_Stage_0404_Item_00()
  Game.GetPlayer().SetValue(BotanyRank, 4.0)
EndFunction

Function Fragment_Stage_0601_Item_00()
  Game.GetPlayer().SetValue(ScanningPowerLevel, 1.0)
EndFunction

Function Fragment_Stage_0602_Item_00()
  Game.GetPlayer().SetValue(ScanningPowerLevel, 2.0)
EndFunction

Function Fragment_Stage_0603_Item_00()
  Game.GetPlayer().SetValue(ScanningPowerLevel, 3.0)
EndFunction

Function Fragment_Stage_0604_Item_00()
  Game.GetPlayer().SetValue(ScanningPowerLevel, 4.0)
EndFunction

Function Fragment_Stage_0701_Item_00()
  Outpost_BuildLimit_CargoLinks.Mod(OutpostManagementCargoLinksBonus as Float)
EndFunction

Function Fragment_Stage_0702_Item_00()
  Outpost_BuildLimit_Robots.Mod(OutpostManagementBonus as Float)
EndFunction

Function Fragment_Stage_0703_Item_00()
  Outpost_BuildLimit_CrewStations.Mod(OutpostManagementBonus as Float)
EndFunction

Function Fragment_Stage_0801_Item_00()
  Game.GetPlayer().SetValue(ZoologyRank, 1.0)
EndFunction

Function Fragment_Stage_0802_Item_00()
  Game.GetPlayer().SetValue(ZoologyRank, 2.0)
EndFunction

Function Fragment_Stage_0803_Item_00()
  Game.GetPlayer().SetValue(ZoologyRank, 3.0)
EndFunction

Function Fragment_Stage_0804_Item_00()
  Game.GetPlayer().SetValue(ZoologyRank, 4.0)
EndFunction

Function Fragment_Stage_0901_Item_00()
  Game.GetPlayer().SetValue(OutpostMaxDeployed, 12.0)
EndFunction

Function Fragment_Stage_0902_Item_00()
  Game.GetPlayer().SetValue(OutpostMaxDeployed, 16.0)
EndFunction

Function Fragment_Stage_0903_Item_00()
  Game.GetPlayer().SetValue(OutpostMaxDeployed, 20.0)
EndFunction

Function Fragment_Stage_0904_Item_00()
  Game.GetPlayer().SetValue(OutpostMaxDeployed, 24.0)
EndFunction

Function Fragment_Stage_1101_Item_00()
  Game.GetPlayer().SetValue(GalaxyBodyScanAbility, 1.0)
  Skill_Astrophysics_DiscoverTraitChance.SetValueInt(10)
EndFunction

Function Fragment_Stage_1102_Item_00()
  Game.GetPlayer().SetValue(GalaxyBodyScanAbility, 2.0)
  Skill_Astrophysics_DiscoverTraitChance.SetValueInt(20)
EndFunction

Function Fragment_Stage_1103_Item_00()
  Game.GetPlayer().SetValue(GalaxyBodyScanAbility, 3.0)
  Skill_Astrophysics_DiscoverTraitChance.SetValueInt(30)
EndFunction

Function Fragment_Stage_1104_Item_00()
  Game.GetPlayer().SetValue(GalaxyBodyScanAbility, 3.0)
  Skill_Astrophysics_DiscoverTraitChance.SetValueInt(50)
EndFunction

Function Fragment_Stage_1201_Item_00()
  Game.GetPlayer().SetValue(SurveyingPowerLevel, 1.0)
EndFunction

Function Fragment_Stage_1202_Item_00()
  Game.GetPlayer().SetValue(SurveyingPowerLevel, 2.0)
EndFunction

Function Fragment_Stage_1203_Item_00()
  Actor playerRef = Game.GetPlayer()
  playerRef.SetValue(SurveyingPowerLevel, 3.0)
  playerRef.SetValue(SurveyingTraitBonus, 1.0)
EndFunction

Function Fragment_Stage_1204_Item_00()
  Actor playerRef = Game.GetPlayer()
  playerRef.SetValue(SurveyingPowerLevel, 4.0)
  playerRef.SetValue(SurveyingTraitBonus, 2.0)
EndFunction

Function Fragment_Stage_1302_Item_00()
  Float bribeLowExpensive = SpeechChallengeBribeLowImportance_ExpensiveBase.GetValue()
  Float bribeHighExpensive = SpeechChallengeBribeHighImportance_ExpensiveBase.GetValue()
  Float bribeLowCheap = SpeechChallengeBribeLowImportance_CheapBase.GetValue()
  Float bribeHighCheap = SpeechChallengeBribeHighImportance_CheapBase.GetValue()
  Float costMult = 0.75
  SpeechChallengeBribeLowImportance_Expensive.SetValueInt((bribeLowExpensive * costMult) as Int)
  SpeechChallengeBribeHighImportance_Expensive.SetValueInt((bribeHighExpensive * costMult) as Int)
  SpeechChallengeBribeLowImportance_Cheap.SetValueInt((bribeLowCheap * costMult) as Int)
  SpeechChallengeBribeHighImportance_Cheap.SetValueInt((bribeHighCheap * costMult) as Int)
EndFunction

Function Fragment_Stage_1303_Item_00()
  Float bribeLowExpensive = SpeechChallengeBribeLowImportance_ExpensiveBase.GetValue()
  Float bribeHighExpensive = SpeechChallengeBribeHighImportance_ExpensiveBase.GetValue()
  Float bribeLowCheap = SpeechChallengeBribeLowImportance_CheapBase.GetValue()
  Float bribeHighCheap = SpeechChallengeBribeHighImportance_CheapBase.GetValue()
  Float costMult = 0.5
  SpeechChallengeBribeLowImportance_Expensive.SetValueInt((bribeLowExpensive * costMult) as Int)
  SpeechChallengeBribeHighImportance_Expensive.SetValueInt((bribeHighExpensive * costMult) as Int)
  SpeechChallengeBribeLowImportance_Cheap.SetValueInt((bribeLowCheap * costMult) as Int)
  SpeechChallengeBribeHighImportance_Cheap.SetValueInt((bribeHighCheap * costMult) as Int)
EndFunction

Function Fragment_Stage_1401_Item_00()
  Game.GetPlayer().SetValue(PayloadLevel, 1.0)
  Float piracyLow = Ships_Piracy_Low_Base.GetValue()
  Float piracyHigh = Ships_Piracy_High_Base.GetValue()
  Float piracyMult = 1.100000024
  Float piracyLowNew = piracyLow * piracyMult
  Ships_Piracy_Low.SetValue(piracyLowNew)
  Float piracyHighNew = piracyHigh * piracyMult
  Ships_Piracy_High.SetValue(piracyHighNew)
EndFunction

Function Fragment_Stage_1402_Item_00()
  Game.GetPlayer().SetValue(PayloadLevel, 2.0)
  Float piracyLow = Ships_Piracy_Low_Base.GetValue()
  Float piracyHigh = Ships_Piracy_High_Base.GetValue()
  Float piracyMult = 1.200000048
  Float piracyLowNew = piracyLow * piracyMult
  Ships_Piracy_Low.SetValue(piracyLowNew)
  Float piracyHighNew = piracyHigh * piracyMult
  Ships_Piracy_High.SetValue(piracyHighNew)
EndFunction

Function Fragment_Stage_1403_Item_00()
  Game.GetPlayer().SetValue(PayloadLevel, 3.0)
  Float piracyLow = Ships_Piracy_Low_Base.GetValue()
  Float piracyHigh = Ships_Piracy_High_Base.GetValue()
  Float piracyMult = 1.299999952
  Float piracyLowNew = piracyLow * piracyMult
  Ships_Piracy_Low.SetValue(piracyLowNew)
  Float piracyHighNew = piracyHigh * piracyMult
  Ships_Piracy_High.SetValue(piracyHighNew)
EndFunction

Function Fragment_Stage_1404_Item_00()
  Game.GetPlayer().SetValue(PayloadLevel, 4.0)
  Float piracyLow = Ships_Piracy_Low_Base.GetValue()
  Float piracyHigh = Ships_Piracy_High_Base.GetValue()
  Float piracyMult = 1.5
  Float piracyLowNew = piracyLow * piracyMult
  Ships_Piracy_Low.SetValue(piracyLowNew)
  Float piracyHighNew = piracyHigh * piracyMult
  Ships_Piracy_High.SetValue(piracyHighNew)
EndFunction
