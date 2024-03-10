ScriptName Fragments:Quests:QF_UCR03_001E8FF7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property TestGoToSpaceQuest Auto Const mandatory
RefCollectionAlias Property Alias_SpaceCell Auto Const mandatory
RefCollectionAlias Property Alias_spawnPointObj Auto Const mandatory
Quest Property DialogueUCNewAtlantisUCFaction Auto Const mandatory
GlobalVariable Property UCR03_TimesCompleted Auto Const mandatory
RefCollectionAlias Property Alias_Enemies Auto Const mandatory
Quest Property UCR03_SpaceEncounter Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0002_Item_00()
  TestGoToSpaceQuest.SetStage(10)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Cell ParentCell = Alias_spawnPointObj.GetAt(0).GetParentCell()
  String cellHexFormID = Utility.IntToHex(ParentCell.GetFormID())
EndFunction

Function Fragment_Stage_0004_Item_00()
  Alias_Enemies.KillAll(None)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  ucr03questscript kmyQuest = __temp as ucr03questscript
  kmyQuest.SelectEnemySeed()
  If DialogueUCNewAtlantisUCFaction.GetStageDone(3)
    Self.SetActive(True)
  EndIf
  Self.SetObjectiveDisplayed(100, True, False)
  If !DialogueUCNewAtlantisUCFaction.GetStageDone(550)
    DialogueUCNewAtlantisUCFaction.SetStage(550)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  UCR03_SpaceEncounter.Start()
EndFunction

Function Fragment_Stage_0210_Item_00()
  Quest __temp = Self as Quest
  ucr03questscript kmyQuest = __temp as ucr03questscript
  kmyQuest.SpawnEnemies(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  UCR03_TimesCompleted.SetValue(UCR03_TimesCompleted.GetValue() + 1.0)
  Self.CompleteAllObjectives()
  UCR03_SpaceEncounter.Stop()
  UCR03_SpaceEncounter.Reset()
  Self.Stop()
  Self.Reset()
EndFunction
