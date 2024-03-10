ScriptName Fragments:Quests:QF_MQ401j_00025233 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property ConstellationFaction Auto Const mandatory
Key Property LodgeKey Auto Const mandatory
Quest Property MQ402 Auto Const mandatory
Quest Property MQ401 Auto Const mandatory
Scene Property MQ401c_001_IntroScene Auto Const mandatory
GlobalVariable Property MQ401_SkipMQ Auto Const mandatory
Book Property MQ401I_ArtifactLocations Auto Const mandatory
Scene Property MQ401i_002_OutroScene Auto Const mandatory
Scene Property MQ401j_001_IntroScene Auto Const mandatory
ReferenceAlias Property Alias_Noel Auto Const mandatory
ReferenceAlias Property Alias_Plant Auto Const mandatory
Scene Property MQ401j_002_OutroScene Auto Const mandatory
Faction Property EyeBoardingFaction Auto Const mandatory
ReferenceAlias Property Alias_Armillary Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ObjectReference PlantREF = Alias_Plant.GetRef()
  Self.SetObjectiveDisplayed(10, True, False)
  MQ401_SkipMQ.SetValueInt(1)
  (MQ401 as mq401questscript).CleanUpNormalMainQuest()
  PlantREF.Enable(False)
  PlantREF.BlockActivation(True, False)
  Alias_Armillary.GetRef().DisableNoWait(False)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  MQ401j_001_IntroScene.Start()
EndFunction

Function Fragment_Stage_0120_Item_00()
  Game.StopDialogueCamera(False, False)
  MQ401j_001_IntroScene.Stop()
  Alias_Plant.GetRef().BlockActivation(True, True)
  Alias_Noel.GetActorRef().Enable(False)
  Utility.Wait(1.0)
  MQ401j_002_OutroScene.Start()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(110, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  PlayerREF.AddtoFaction(ConstellationFaction)
  PlayerREF.additem(LodgeKey as Form, 1, False)
  PlayerREF.AddtoFaction(EyeBoardingFaction)
  Self.CompleteAllObjectives()
  MQ402.SetStage(100)
  MQ402.SetStage(510)
EndFunction
