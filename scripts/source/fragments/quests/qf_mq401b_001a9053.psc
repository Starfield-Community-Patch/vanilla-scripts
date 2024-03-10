ScriptName Fragments:Quests:QF_MQ401b_001A9053 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property ConstellationFaction Auto Const mandatory
Key Property LodgeKey Auto Const mandatory
Quest Property MQ402 Auto Const mandatory
Quest Property MQ401 Auto Const mandatory
ReferenceAlias Property Alias_OtherPlayer Auto Const mandatory
Faction Property AvailableCrewFaction Auto Const mandatory
Scene Property MQ401b_001_LodgeIntro Auto Const mandatory
Faction Property PotentialCrewFaction Auto Const mandatory
GlobalVariable Property MQ401_SkipMQ Auto Const mandatory
Quest Property OtherYouEliteCrewQuest Auto Const
ObjectReference Property MQ401B_OtherPlayerMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  mq401variantquestscript kmyQuest = __temp as mq401variantquestscript
  MQ401_SkipMQ.SetValueInt(1)
  (MQ401 as mq401questscript).NormalStart()
  kmyQuest.EnableQuestActors()
  Actor OtherPlayerREF = Alias_OtherPlayer.GetActorRef()
  OtherPlayerREF.Disable(False)
  OtherPlayerREF.moveto(MQ401B_OtherPlayerMarker, 0.0, 0.0, 0.0, True, False)
  OtherPlayerREF.Enable(False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  MQ401b_001_LodgeIntro.Start()
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_OtherPlayer.GetActorRef().AddtoFaction(PotentialCrewFaction)
  OtherYouEliteCrewQuest.SetStage(1)
  MQ401.SetStage(300)
  Self.Stop()
EndFunction
