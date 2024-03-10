ScriptName Fragments:Quests:QF_OE_MP_MysteriousTragedy Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property PCM_TerrormorphEncountersAllowed Auto Const mandatory
ReferenceAlias Property Alias_Note Auto Const mandatory
GlobalVariable Property UC09_Result Auto Const mandatory
Perk Property BackgroundBigGameHunter Auto Const mandatory
Perk Property BackgroundExplorer Auto Const mandatory
ReferenceAlias Property Alias_Trigger Auto Const mandatory
ReferenceAlias Property Alias_Terrormorph Auto Const mandatory
ReferenceAlias Property Alias_Enemy Auto Const mandatory
ReferenceAlias Property Alias_ApexPredator Auto Const mandatory
ReferenceAlias Property Alias_Predator Auto Const mandatory
ReferenceAlias[] Property Alias_Predators Auto Const mandatory
RefCollectionAlias Property Alias_Enemies Auto Const
RefCollectionAlias Property Alias_Critters Auto Const mandatory
ReferenceAlias Property Alias_Predator_Corpse00 Auto Const mandatory
ReferenceAlias Property Alias_Predator_Corpse01 Auto Const mandatory
ReferenceAlias Property Alias_Predator_Corpse02 Auto Const mandatory
ReferenceAlias Property Alias_ApexPredator_Corpse Auto Const mandatory
ReferenceAlias Property Alias_EnemyCorpse00 Auto Const mandatory
ReferenceAlias Property Alias_EnemyCorpse01 Auto Const mandatory
LeveledItem Property LL_OE_AlternativeReward Auto Const mandatory
ReferenceAlias Property Alias_RewardContainer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Int PlayerLevel = Game.GetPlayer().GetLevel()
  Int EncounterPoints = Utility.RandomInt(1, 10)
  If PlayerLevel > 200
    EncounterPoints += 10
  ElseIf PlayerLevel > 100
    EncounterPoints += 5
  ElseIf PlayerLevel > 75
    EncounterPoints += 4
  ElseIf PlayerLevel > 50
    EncounterPoints += 3
  ElseIf PlayerLevel > 25
    EncounterPoints += 2
  ElseIf PlayerLevel > 15
    EncounterPoints += 1
  EndIf
  If Game.GetPlayer().HasPerk(BackgroundBigGameHunter)
    EncounterPoints += 4
  EndIf
  If Game.GetPlayer().HasPerk(BackgroundExplorer)
    EncounterPoints += 2
  EndIf
  If EncounterPoints > Utility.RandomInt(1, 10)
    Self.SetStage(20)
    EncounterPoints -= 5
  Else
    Alias_Enemy.TryToDisable()
    Alias_Enemies.DisableAll(False)
    EncounterPoints += 2
  EndIf
  If EncounterPoints > Utility.RandomInt(1, 10)
    Self.SetStage(30)
    EncounterPoints -= 1
  Else
    Alias_EnemyCorpse00.TryToDisable()
    Alias_EnemyCorpse01.TryToDisable()
    EncounterPoints += 1
  EndIf
  If EncounterPoints > Utility.RandomInt(1, 10)
    Self.SetStage(50)
    EncounterPoints -= 2
  EndIf
  If EncounterPoints > Utility.RandomInt(1, 10)
    Self.SetStage(60)
    EncounterPoints -= 1
  EndIf
  If EncounterPoints > Utility.RandomInt(1, 10)
    Self.SetStage(70)
    EncounterPoints -= 3
  EndIf
  If EncounterPoints < 3
    Self.SetStage(150)
    Self.SetStage(80)
  Else
    Self.SetStage(350)
  EndIf
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_Enemy.TryToEnable()
  Alias_Enemies.EnableAll(False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  If !Self.GetStageDone(10)
    Self.SetStage(10)
  EndIf
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_ApexPredator_Corpse.TryToEnable()
EndFunction

Function Fragment_Stage_0060_Item_00()
  Int numToSpawn = Utility.RandomInt(1, 4)
  Alias_Predator_Corpse00.TryToEnable()
  If numToSpawn > 1
    Alias_Predator_Corpse01.TryToEnable()
  EndIf
  If numToSpawn > 2
    Alias_Predator_Corpse02.TryToEnable()
  EndIf
EndFunction

Function Fragment_Stage_0080_Item_00()
  Alias_RewardContainer.TryToEnable()
  Alias_RewardContainer.GetRef().AddItem(LL_OE_AlternativeReward as Form, 1, False)
  Alias_RewardContainer.GetRef().Lock(True, False, True)
EndFunction

Function Fragment_Stage_0100_Item_00()
  If !Self.GetStageDone(10)
    Self.SetStage(10)
  EndIf
  If Self.GetStageDone(40)
    If Utility.RandomInt(1, 2) == 1
      Self.SetStage(150)
    EndIf
  EndIf
  If Self.GetStageDone(20)
    Self.SetStage(110)
  EndIf
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_Enemy.GetActorRef().AddItem(Alias_Note.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0125_Item_00()
  If Self.GetStageDone(100)
    Self.SetStage(200)
  EndIf
EndFunction

Function Fragment_Stage_0150_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  kmyQuest.LaunchShip(0, None, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Bool apexAllowed = Alias_ApexPredator.GetRef() == None
  apexAllowed = !apexAllowed
  Bool predatorsAllowed = Alias_Predator.GetRef() == None
  predatorsAllowed = !predatorsAllowed
  Bool terrormorphAllowed = Alias_Trigger.GetRef().GetCurrentPlanet().HasKeyword(PCM_TerrormorphEncountersAllowed)
  Int EncounterPoints = Utility.RandomInt(1, 10)
  Int PlayerLevel = Game.GetPlayer().GetLevel()
  If PlayerLevel > 200
    EncounterPoints += 10
  ElseIf PlayerLevel > 100
    EncounterPoints += 5
  ElseIf PlayerLevel > 75
    EncounterPoints += 4
  ElseIf PlayerLevel > 50
    EncounterPoints += 3
  ElseIf PlayerLevel > 25
    EncounterPoints += 2
  ElseIf PlayerLevel > 15
    EncounterPoints += 1
  EndIf
  If Game.GetPlayer().HasPerk(BackgroundBigGameHunter)
    EncounterPoints += 4
  EndIf
  If Game.GetPlayer().HasPerk(BackgroundExplorer)
    EncounterPoints += 2
  EndIf
  If PlayerLevel < 25
    If Self.GetStageDone(20)
      EncounterPoints -= 3
    EndIf
    If Self.GetStageDone(30)
      EncounterPoints -= 2
    EndIf
    If Self.GetStageDone(50) || Self.GetStageDone(60) || Self.GetStageDone(70)
      EncounterPoints -= 1
    EndIf
  ElseIf Self.GetStageDone(20)
    EncounterPoints -= 2
  EndIf
  If terrormorphAllowed
    If EncounterPoints > Utility.RandomInt(1, 10)
      Self.SetStage(310)
      EncounterPoints -= 5
    EndIf
  EndIf
  If apexAllowed
    If EncounterPoints > Utility.RandomInt(1, 10)
      Self.SetStage(320)
      EncounterPoints -= 4
    EndIf
  ElseIf predatorsAllowed
    If EncounterPoints > Utility.RandomInt(1, 10)
      Self.SetStage(330)
      EncounterPoints -= 2
    EndIf
  Else
    Self.SetStage(350)
  EndIf
EndFunction

Function Fragment_Stage_0310_Item_00()
  If UC09_Result.GetValue() == 1.0
    Alias_Terrormorph.TryToEnable()
  EndIf
EndFunction

Function Fragment_Stage_0320_Item_00()
  Alias_ApexPredator.TryToEnable()
  Alias_ApexPredator.TryToSetValue(Game.GetAggressionAV(), 1.0)
EndFunction

Function Fragment_Stage_0330_Item_00()
  ActorValue aggression = Game.GetAggressionAV()
  Int numToEnable = Utility.RandomInt(2, Alias_Predators.Length)
  Int I = 0
  While I < numToEnable
    Alias_Predators[I].TryToEnable()
    Alias_Predators[I].TryToSetValue(aggression, 1.0)
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0350_Item_00()
  Alias_Critters.EnableAll(False)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.Stop()
EndFunction
