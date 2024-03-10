ScriptName Fragments:Quests:QF_MQ401i_00029DA1 Extends Quest Const hidden

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
Faction Property EyeBoardingFaction Auto Const mandatory
ReferenceAlias Property Alias_Child_SarahMorgan Auto Const mandatory
ReferenceAlias Property Alias_Child_SamCoe Auto Const mandatory
ReferenceAlias Property Alias_Child_Noel Auto Const mandatory
ReferenceAlias Property Alias_Child_Barrett Auto Const mandatory
ReferenceAlias Property Alias_Armillary Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  MQ401_SkipMQ.SetValueInt(1)
  (MQ401 as mq401questscript).CleanUpNormalMainQuest()
  Alias_Armillary.GetRef().DisableNoWait(False)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(100, True, False)
  MQ401c_001_IntroScene.Start()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  MQ401i_002_OutroScene.Start()
  PlayerREF.AddtoFaction(ConstellationFaction)
  PlayerREF.additem(LodgeKey as Form, 1, False)
  PlayerREF.additem(MQ401I_ArtifactLocations as Form, 1, False)
  PlayerREF.AddtoFaction(EyeBoardingFaction)
  Alias_Child_SarahMorgan.GetActorRef().EvaluatePackage(False)
  Alias_Child_SamCoe.GetActorRef().EvaluatePackage(False)
  Alias_Child_Noel.GetActorRef().EvaluatePackage(False)
  Alias_Child_Barrett.GetActorRef().EvaluatePackage(False)
  Self.CompleteAllObjectives()
  MQ402.SetStage(100)
  MQ402.SetStage(510)
EndFunction
