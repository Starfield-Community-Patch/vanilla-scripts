ScriptName Fragments:Quests:QF_MQ303_00254243 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_HunterArtifact01 Auto Const mandatory
ReferenceAlias Property Alias_HunterArtifact02 Auto Const mandatory
ReferenceAlias Property Alias_HunterArtifact03 Auto Const mandatory
ReferenceAlias Property Alias_HunterArtifact04 Auto Const mandatory
ReferenceAlias Property Alias_HunterArtifact05 Auto Const mandatory
ReferenceAlias Property Alias_Hunter Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
ObjectReference Property MQ303ArtifactSpawnMarker01 Auto Const mandatory
ObjectReference Property MQ303ArtifactSpawnMarker02 Auto Const mandatory
ObjectReference Property MQ303ArtifactSpawnMarker03 Auto Const mandatory
ObjectReference Property MQ303ArtifactSpawnMarker04 Auto Const mandatory
ObjectReference Property MQ303ArtifactSpawnMarker05 Auto Const mandatory
Quest Property MQ303 Auto Const mandatory
Quest Property MQ302b Auto Const mandatory
Quest Property MQ304 Auto Const mandatory
ObjectReference Property MQ202ArtifactSpawnMarker Auto Const mandatory
ReferenceAlias Property MQ202ArtifactHolder Auto Const
Quest Property MQ404 Auto Const mandatory
Spell Property AbStarbornDeath Auto Const mandatory
LeveledItem Property LL_Weapon_Reward_MQ302B_Hunter Auto Const mandatory
Weapon Property Rocketlauncher Auto Const mandatory
Message Property QuantumEssenceAddMSG Auto Const mandatory
Spell Property FortifyQuantumEssenceSpell Auto Const mandatory
Ammo Property Ammo20mmXPL Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Actor HunterREF = Alias_Hunter.GetActorRef()
  ObjectReference ArtifactREF01 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(14, MQ303ArtifactSpawnMarker01)
  Alias_HunterArtifact01.ForceRefTo(ArtifactREF01)
  ArtifactREF01.Enable(False)
  HunterREF.additem(ArtifactREF01 as Form, 1, False)
  ObjectReference ArtifactREF02 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(15, MQ303ArtifactSpawnMarker02)
  Alias_HunterArtifact02.ForceRefTo(ArtifactREF02)
  ArtifactREF02.Enable(False)
  HunterREF.additem(ArtifactREF02 as Form, 1, False)
  ObjectReference ArtifactREF03 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(16, MQ303ArtifactSpawnMarker03)
  Alias_HunterArtifact03.ForceRefTo(ArtifactREF03)
  ArtifactREF03.Enable(False)
  HunterREF.additem(ArtifactREF03 as Form, 1, False)
  ObjectReference ArtifactREF04 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(17, MQ303ArtifactSpawnMarker04)
  Alias_HunterArtifact04.ForceRefTo(ArtifactREF04)
  ArtifactREF04.Enable(False)
  HunterREF.additem(ArtifactREF04 as Form, 1, False)
  ObjectReference ArtifactREF05 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(18, MQ303ArtifactSpawnMarker05)
  Alias_HunterArtifact05.ForceRefTo(ArtifactREF05)
  ArtifactREF05.Enable(False)
  HunterREF.additem(ArtifactREF05 as Form, 1, False)
  If MQ404.GetStageDone(200)
    ObjectReference ArtifactREF10 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(10, MQ202ArtifactSpawnMarker)
    MQ202ArtifactHolder.ForceRefTo(ArtifactREF10)
    ArtifactREF10.Enable(False)
    HunterREF.additem(ArtifactREF10 as Form, 1, False)
  Else
    Self.SetStage(136)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  PlayerREF.additem(Alias_HunterArtifact01.GetRef() as Form, 1, False)
  PlayerREF.additem(Alias_HunterArtifact02.GetRef() as Form, 1, False)
  PlayerREF.additem(Alias_HunterArtifact03.GetRef() as Form, 1, False)
  PlayerREF.additem(Alias_HunterArtifact04.GetRef() as Form, 1, False)
  PlayerREF.additem(Alias_HunterArtifact05.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0131_Item_00()
  If Self.GetStageDone(132) && Self.GetStageDone(133) && Self.GetStageDone(134) && Self.GetStageDone(135) && Self.GetStageDone(136)
    Self.SetStage(200)
  EndIf
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(14)
EndFunction

Function Fragment_Stage_0132_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(133) && Self.GetStageDone(134) && Self.GetStageDone(135) && Self.GetStageDone(136)
    Self.SetStage(200)
  EndIf
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(15)
EndFunction

Function Fragment_Stage_0133_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(132) && Self.GetStageDone(134) && Self.GetStageDone(135) && Self.GetStageDone(136)
    Self.SetStage(200)
  EndIf
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(16)
EndFunction

Function Fragment_Stage_0134_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(132) && Self.GetStageDone(133) && Self.GetStageDone(135) && Self.GetStageDone(136)
    Self.SetStage(200)
  EndIf
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(17)
EndFunction

Function Fragment_Stage_0135_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(132) && Self.GetStageDone(133) && Self.GetStageDone(134) && Self.GetStageDone(136)
    Self.SetStage(200)
  EndIf
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(18)
EndFunction

Function Fragment_Stage_0136_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(132) && Self.GetStageDone(133) && Self.GetStageDone(134) && Self.GetStageDone(135)
    Self.SetStage(200)
  EndIf
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(10)
EndFunction

Function Fragment_Stage_0137_Item_00()
  If Self.GetStageDone(200)
    Self.SetStage(210)
  EndIf
EndFunction

Function Fragment_Stage_0150_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  PlayerREF.additem(Alias_HunterArtifact01.GetRef() as Form, 1, False)
  PlayerREF.additem(Alias_HunterArtifact02.GetRef() as Form, 1, False)
  PlayerREF.additem(Alias_HunterArtifact03.GetRef() as Form, 1, False)
  PlayerREF.additem(Alias_HunterArtifact04.GetRef() as Form, 1, False)
  PlayerREF.additem(Alias_HunterArtifact05.GetRef() as Form, 1, False)
  If MQ404.GetStageDone(200)
    PlayerREF.additem(MQ202ArtifactHolder.GetRef() as Form, 1, False)
  EndIf
  MQ302b.SetObjectiveCompleted(260, True)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor HunterREF = Alias_Hunter.GetActorRef()
  MQ302b.SetObjectiveCompleted(230, True)
  If MQ304.GetStageDone(200)
    MQ302b.SetStage(1280)
  EndIf
  If HunterREF.IsDead()
    If Self.GetStageDone(137)
      Self.SetStage(210)
    EndIf
  Else
    Self.Stop()
  EndIf
EndFunction

Function Fragment_Stage_0210_Item_00()
  Actor HunterREF = Alias_Hunter.GetActorRef()
  HunterREF.BlockActivation(True, True)
  AbStarbornDeath.Cast(HunterREF as ObjectReference, HunterREF as ObjectReference)
  FortifyQuantumEssenceSpell.Cast(HunterREF as ObjectReference, Game.GetPlayer() as ObjectReference)
  QuantumEssenceAddMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Utility.Wait(5.0)
  HunterREF.Disable(False)
  Self.Stop()
EndFunction
