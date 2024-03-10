ScriptName Fragments:Quests:QF_MQ304b_0015D399 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_KeeperAquilus Auto Const mandatory
Scene Property MQ304_002c_CompanionReaction_AquilusDead Auto Const mandatory
Scene Property MQ304_002c_CompanionReaction_AquilusLives Auto Const mandatory
ReferenceAlias Property Alias_Hunter Auto Const mandatory
ReferenceAlias Property Alias_HunterShip Auto Const mandatory
ObjectReference Property HelixOborumMarker Auto Const mandatory
ObjectReference Property MQ207_HunterMarker01 Auto Const mandatory
Faction Property MQScorpiusBoardingFaction Auto Const mandatory
Quest Property City_NA_Aquilus01 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Alias_KeeperAquilus.GetActorRef().SetEssential(False)
  Game.GetPlayer().addtoFaction(MQScorpiusBoardingFaction)
EndFunction

Function Fragment_Stage_0027_Item_00()
  Actor AquilusREF = Alias_KeeperAquilus.GetActorRef()
  AquilusREF.SendAssaultAlarm()
  AquilusREF.addtoFaction(PlayerEnemyFaction)
  AquilusREF.SetValue(Aggression, 1.0)
  AquilusREF.StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetStage(40)
  MQ304_002c_CompanionReaction_AquilusDead.Start()
EndFunction

Function Fragment_Stage_0035_Item_00()
  Self.SetStage(40)
  MQ304_002c_CompanionReaction_AquilusLives.Start()
EndFunction

Function Fragment_Stage_0037_Item_00()
  Alias_KeeperAquilus.GetActorRef().Disable(False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  spaceshipreference ScorpiusREF = Alias_HunterShip.GetShipRef()
  ScorpiusREF.MoveTo(HelixOborumMarker, 0.0, 0.0, 0.0, True, False)
  ScorpiusREF.Enable(False)
  Alias_Hunter.GetActorRef().MoveTo(MQ207_HunterMarker01, 0.0, 0.0, 0.0, True, False)
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Self.GetStageDone(42)
    Self.SetStage(1100)
  ElseIf Self.GetStageDone(44)
    Self.SetStage(1200)
  Else
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_1300_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
