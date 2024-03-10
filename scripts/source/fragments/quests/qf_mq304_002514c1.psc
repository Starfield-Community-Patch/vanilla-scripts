ScriptName Fragments:Quests:QF_MQ304_002514C1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Artifact01 Auto Const mandatory
ReferenceAlias Property Alias_Artifact02 Auto Const mandatory
ReferenceAlias Property Alias_Artifact03 Auto Const mandatory
ReferenceAlias Property Alias_Artifact04 Auto Const mandatory
ReferenceAlias Property Alias_Emissary Auto Const mandatory
ReferenceAlias Property Alias_Hunter Auto Const mandatory
GlobalVariable Property MQ106_SurrenderedArtifact Auto Const mandatory
ReferenceAlias Property Alias_MQ105_ArtifactHolder Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
ObjectReference Property MQ304ArtifactSpawnMarker01 Auto Const mandatory
ObjectReference Property MQ304ArtifactSpawnMarker02 Auto Const mandatory
ObjectReference Property MQ304ArtifactSpawnMarker03 Auto Const mandatory
ObjectReference Property MQ304ArtifactSpawnMarker04 Auto Const mandatory
ObjectReference Property MQ304ArtifactSpawnMarker05 Auto Const mandatory
ObjectReference Property MQ105ArtifactSpawnMarker Auto Const mandatory
Quest Property MQ303 Auto Const mandatory
Quest Property MQ302b Auto Const mandatory
Weapon Property InflictorRifle Auto Const mandatory
Spell Property AbStarbornDeath Auto Const mandatory
Spell Property FortifyQuantumEssenceSpell Auto Const mandatory
Message Property QuantumEssenceAddMSG Auto Const mandatory
Ammo Property AmmoParticleFuseHeavy Auto Const mandatory
Weapon Property FragGrenade Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Actor EmissaryREF = Alias_Emissary.GetActorRef()
  If MQ106_SurrenderedArtifact.GetValueInt() >= 1
    ObjectReference ArtifactREF06 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(7, MQ105ArtifactSpawnMarker)
    Alias_MQ105_ArtifactHolder.ForceRefTo(ArtifactREF06)
    ArtifactREF06.Enable(False)
    EmissaryREF.additem(ArtifactREF06 as Form, 1, False)
  Else
    Self.SetStage(136)
  EndIf
  ObjectReference ArtifactREF01 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(19, MQ304ArtifactSpawnMarker01)
  Alias_Artifact01.ForceRefTo(ArtifactREF01)
  ArtifactREF01.Enable(False)
  EmissaryREF.additem(ArtifactREF01 as Form, 1, False)
  ObjectReference ArtifactREF02 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(20, MQ304ArtifactSpawnMarker02)
  Alias_Artifact02.ForceRefTo(ArtifactREF02)
  ArtifactREF02.Enable(False)
  EmissaryREF.additem(ArtifactREF02 as Form, 1, False)
  ObjectReference ArtifactREF03 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(21, MQ304ArtifactSpawnMarker03)
  Alias_Artifact03.ForceRefTo(ArtifactREF03)
  ArtifactREF03.Enable(False)
  EmissaryREF.additem(ArtifactREF03 as Form, 1, False)
  ObjectReference ArtifactREF04 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(22, MQ304ArtifactSpawnMarker04)
  Alias_Artifact04.ForceRefTo(ArtifactREF04)
  ArtifactREF04.Enable(False)
  EmissaryREF.additem(ArtifactREF04 as Form, 1, False)
EndFunction

Function Fragment_Stage_0131_Item_00()
  If Self.GetStageDone(132) && Self.GetStageDone(133) && Self.GetStageDone(134) && Self.GetStageDone(136)
    Self.SetStage(200)
  EndIf
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(19)
EndFunction

Function Fragment_Stage_0132_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(133) && Self.GetStageDone(134) && Self.GetStageDone(136)
    Self.SetStage(200)
  EndIf
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(20)
EndFunction

Function Fragment_Stage_0133_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(132) && Self.GetStageDone(134) && Self.GetStageDone(136)
    Self.SetStage(200)
  EndIf
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(21)
EndFunction

Function Fragment_Stage_0134_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(132) && Self.GetStageDone(133) && Self.GetStageDone(136)
    Self.SetStage(200)
  EndIf
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(22)
EndFunction

Function Fragment_Stage_0136_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(132) && Self.GetStageDone(133) && Self.GetStageDone(134)
    Self.SetStage(200)
  EndIf
EndFunction

Function Fragment_Stage_0137_Item_00()
  If Self.GetStageDone(200)
    Self.SetStage(210)
  EndIf
EndFunction

Function Fragment_Stage_0150_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  PlayerREF.additem(Alias_Artifact01.GetRef() as Form, 1, False)
  PlayerREF.additem(Alias_Artifact02.GetRef() as Form, 1, False)
  PlayerREF.additem(Alias_Artifact03.GetRef() as Form, 1, False)
  PlayerREF.additem(Alias_Artifact04.GetRef() as Form, 1, False)
  If MQ106_SurrenderedArtifact.GetValueInt() >= 1
    PlayerREF.additem(Alias_MQ105_ArtifactHolder.GetRef() as Form, 1, False)
  EndIf
  MQ302b.SetObjectiveCompleted(250, True)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor EmissaryREF = Alias_Emissary.GetActorRef()
  MQ302b.SetObjectiveCompleted(240, True)
  If MQ303.GetStageDone(200)
    MQ302b.SetStage(1280)
  EndIf
  If EmissaryREF.IsDead()
    If Self.GetStageDone(137)
      Self.SetStage(210)
    EndIf
  Else
    Self.Stop()
  EndIf
EndFunction

Function Fragment_Stage_0210_Item_00()
  Actor EmissaryREF = Alias_Emissary.GetActorRef()
  EmissaryREF.BlockActivation(True, True)
  AbStarbornDeath.Cast(EmissaryREF as ObjectReference, EmissaryREF as ObjectReference)
  FortifyQuantumEssenceSpell.Cast(EmissaryREF as ObjectReference, Game.GetPlayer() as ObjectReference)
  QuantumEssenceAddMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Utility.Wait(5.0)
  EmissaryREF.Disable(False)
  Self.Stop()
EndFunction
