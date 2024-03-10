ScriptName Fragments:Quests:QF_OE_MP_MysteriousTragedy_0008DF6F Extends Quest Const hidden

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

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Int PlayerLevel = Game.GetPlayer().GetLevel()
  Int Randomizer = Utility.RandomInt(1, 5)
  If PlayerLevel > 100
    Randomizer += 5
  ElseIf PlayerLevel > 75
    Randomizer += 4
  ElseIf PlayerLevel > 50
    Randomizer += 3
  ElseIf PlayerLevel > 25
    Randomizer += 2
  ElseIf PlayerLevel > 15
    Randomizer += 1
  EndIf
  If Game.GetPlayer().HasPerk(BackgroundBigGameHunter)
    Randomizer += 3
  EndIf
  If Game.GetPlayer().HasPerk(BackgroundExplorer)
    Randomizer += 1
  EndIf
  If Utility.RandomInt(1, 10) < Randomizer
    Self.SetStage(20)
  ElseIf Utility.RandomInt(1, 10) < Randomizer
    Self.SetStage(30)
  EndIf
  If Utility.RandomInt(1, 10) < Randomizer
    Self.SetStage(50)
  ElseIf Utility.RandomInt(1, 10) < Randomizer
    Self.SetStage(60)
  ElseIf Utility.RandomInt(1, 10) < Randomizer
    Self.SetStage(70)
  EndIf
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
  Int Randomizer = Utility.RandomInt(1, 5)
  Int PlayerLevel = Game.GetPlayer().GetLevel()
  If PlayerLevel > 100
    Randomizer += 5
  ElseIf PlayerLevel > 75
    Randomizer += 4
  ElseIf PlayerLevel > 50
    Randomizer += 3
  ElseIf PlayerLevel > 25
    Randomizer += 2
  ElseIf PlayerLevel > 15
    Randomizer += 1
  EndIf
  If PlayerLevel < 25 && Self.GetStageDone(20)
    Randomizer -= 3
  EndIf
  If Game.GetPlayer().HasPerk(BackgroundBigGameHunter)
    Randomizer += 3
  EndIf
  If Game.GetPlayer().HasPerk(BackgroundExplorer)
    Randomizer += 1
  EndIf
  If terrormorphAllowed
    If Utility.RandomInt(1, 10) < Randomizer
      Self.SetStage(310)
      Randomizer -= 4
    EndIf
  EndIf
  If apexAllowed
    If Utility.RandomInt(1, 10) < Randomizer
      Self.SetStage(320)
      Randomizer -= 3
    EndIf
  ElseIf predatorsAllowed
    If Utility.RandomInt(1, 10) < Randomizer
      Self.SetStage(330)
      Randomizer -= 2
    EndIf
  EndIf
  If !Self.GetStageDone(20) && !Self.GetStageDone(310) && !Self.GetStageDone(320) && !Self.GetStageDone(330)
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
