ScriptName Fragments:Quests:QF_MQ401h_00045F9F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property ConstellationFaction Auto Const mandatory
Key Property LodgeKey Auto Const mandatory
Quest Property MQ402 Auto Const mandatory
Quest Property MQ401 Auto Const mandatory
Scene Property MQ401c_001_IntroScene Auto Const mandatory
GlobalVariable Property MQ401_SkipMQ Auto Const mandatory
ReferenceAlias Property Alias_Andreja Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact01 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact02 Auto Const mandatory
ReferenceAlias Property Alias_ArtifaceDataSlate Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact03 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact04 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact05 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact06 Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_OtherPlayer Auto Const mandatory
Scene Property MQ401H_002_OutroScene Auto Const mandatory
ObjectReference Property MQ204LodgeAttackClutterEnableMarker Auto Const mandatory
Faction Property EyeBoardingFaction Auto Const mandatory
Spell Property ffStarbornDeath Auto Const mandatory
Spell Property FortifyQuantumEssenceSpell Auto Const mandatory
Message Property QuantumEssenceAddMSG Auto Const mandatory
wwiseevent Property QST_MQ401_Magshear_SingleShot Auto Const mandatory
ReferenceAlias Property Alias_Armillary Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Actor AndrejaREF = Alias_OtherPlayer.GetActorRef()
  Self.SetObjectiveDisplayed(10, True, False)
  MQ401_SkipMQ.SetValueInt(1)
  (MQ401 as mq401questscript).CleanUpNormalMainQuest()
  If MQ402.IsRunning() == False
    MQ402.Start()
  EndIf
  (MQ402 as mq402script).AddLodgeArtifacts(AndrejaREF)
  (AndrejaREF.GetBaseObject() as ActorBase).SetEssential(False)
  MQ204LodgeAttackClutterEnableMarker.Enable(False)
  Alias_Armillary.GetRef().DisableNoWait(False)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  MQ401c_001_IntroScene.Start()
EndFunction

Function Fragment_Stage_0105_Item_00()
  Actor OtherPlayerREF = Alias_OtherPlayer.GetActorRef()
  OtherPlayerREF.Enable(False)
  Actor SarahREF = Alias_Andreja.GetActorRef()
  QST_MQ401_Magshear_SingleShot.Play(Game.GetPlayer() as ObjectReference, None, None)
  SarahREF.KillEssential(None)
  MQ401H_002_OutroScene.Start()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Actor PlayerREF = Game.GetPlayer()
  Actor OtherPlayerREF = Alias_OtherPlayer.GetActorRef()
  OtherPlayerREF.AddtoFaction(PlayerEnemyFaction)
  OtherPlayerREF.SetValue(Aggression, 1.0)
  OtherPlayerREF.StartCombat(PlayerREF as ObjectReference, False)
  If PlayerREF.GetItemCount(LodgeKey as Form) == 0
    PlayerREF.additem(LodgeKey as Form, 1, True)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  MQ402.SetStage(100)
  If Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290)
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0220_Item_00()
  If Self.GetStageDone(210) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290)
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0230_Item_00()
  If Self.GetStageDone(220) && Self.GetStageDone(210) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290)
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0240_Item_00()
  If Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(210) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290)
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0250_Item_00()
  If Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(210) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290)
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0260_Item_00()
  If Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(210) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290)
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0270_Item_00()
  If Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(210) && Self.GetStageDone(280) && Self.GetStageDone(290)
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0280_Item_00()
  If Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(210) && Self.GetStageDone(290)
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0290_Item_00()
  If Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(210)
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  PlayerREF.AddtoFaction(ConstellationFaction)
  If PlayerREF.GetItemCount(LodgeKey as Form) == 0
    PlayerREF.additem(LodgeKey as Form, 1, True)
  EndIf
  PlayerREF.AddtoFaction(EyeBoardingFaction)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_2000_Item_00()
  Actor OtherPlayerREF = Alias_OtherPlayer.GetActorRef()
  OtherPlayerREF.BlockActivation(True, True)
  ffStarbornDeath.Cast(OtherPlayerREF as ObjectReference, OtherPlayerREF as ObjectReference)
  FortifyQuantumEssenceSpell.Cast(OtherPlayerREF as ObjectReference, Game.GetPlayer() as ObjectReference)
  QuantumEssenceAddMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Utility.Wait(5.0)
  OtherPlayerREF.Disable(False)
EndFunction
