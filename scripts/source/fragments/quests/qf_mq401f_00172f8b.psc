ScriptName Fragments:Quests:QF_MQ401f_00172F8B Extends Quest Const hidden

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
ReferenceAlias Property Alias_Zealot02 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact03 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact04 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact05 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact06 Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Zealot01 Auto Const mandatory
ReferenceAlias Property Alias_Zealot03 Auto Const mandatory
ReferenceAlias Property Alias_Zealot04 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const mandatory
ObjectReference Property MQHoldingCellCenterMarker Auto Const mandatory
Faction Property EyeBoardingFaction Auto Const mandatory
Spell Property ffStarbornTeleport Auto Const mandatory
Spell Property MQ204HunterInvisibility Auto Const mandatory
ReferenceAlias Property Alias_Armillary Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  mq401variantquestscript kmyQuest = __temp as mq401variantquestscript
  Actor AndrejaREF = Alias_Andreja.GetActorRef()
  Self.SetObjectiveDisplayed(10, True, False)
  MQ401_SkipMQ.SetValueInt(1)
  (MQ401 as mq401questscript).CleanUpNormalMainQuest()
  kmyQuest.EnableQuestActors()
  Alias_Andreja.GetActorRef().AddSpell(MQ204HunterInvisibility, True)
  Alias_Armillary.GetRef().DisableNoWait(False)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Actor HunterREF = Alias_Andreja.GetActorRef()
  HunterREF.RemoveSpell(MQ204HunterInvisibility)
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(100, True, False)
  MQ401c_001_IntroScene.Start()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.StopDialogueCamera(False, False)
  MQ401c_001_IntroScene.Stop()
  Actor PlayerREF = Game.GetPlayer()
  Actor HunterREF = Alias_Andreja.GetActorRef()
  HunterREF.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion as Form, 1, False, False, True, None, None, True)
  HunterREF.Moveto(MQHoldingCellCenterMarker, 0.0, 0.0, 0.0, True, False)
  HunterREF.DisableNoWait(False)
  PlayerREF.AddtoFaction(ConstellationFaction)
  PlayerREF.additem(LodgeKey as Form, 1, False)
  PlayerREF.AddtoFaction(EyeBoardingFaction)
  Self.CompleteAllObjectives()
  MQ402.SetStage(100)
  MQ402.SetStage(510)
EndFunction
