ScriptName Fragments:Quests:QF_City_GG_Mark_0018BC56 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Bonifac Auto Const mandatory
ReferenceAlias Property Alias_CaptiveMarker Auto Const mandatory
ReferenceAlias Property Alias_Maldonado Auto Const mandatory
ReferenceAlias Property Alias_BonCaptiveAlias Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Faction Property PlayerAllyFaction Auto Const mandatory
Scene Property City_GG_Mark_295_Bonifac_MalDead Auto Const mandatory
Scene Property City_GG_Mark_110_Bonifac_Attract Auto Const mandatory
Scene Property City_GG_Mark_310_Bonifac_MeetAtGG Auto Const mandatory
ReferenceAlias Property Alias_Data Auto Const mandatory
ReferenceAlias Property Alias_EdgeMarker Auto Const mandatory
ReferenceAlias Property Alias_BossContainer Auto Const mandatory
ObjectReference Property UC_GG_Connect_DebugMarker01 Auto Const mandatory
Scene Property City_GG_Mark_155_Bon_FindAWeapon Auto Const mandatory
Scene Property City_GG_Mark_260_MalBonifac_Intro Auto Const mandatory
Scene Property City_GG_Mark_299_Mal_PostBonDeath Auto Const mandatory
ObjectReference Property BonifacTeleportMarker Auto Const mandatory
ReferenceAlias Property Alias_CourierCorpse Auto Const mandatory
GlobalVariable Property GG_Mark_KilledBonifac Auto Const mandatory
GlobalVariable Property GG_Mark_PlayerToldHelenaBonifacDead Auto Const mandatory
ReferenceAlias Property Alias_BonifacTeleportMarker Auto Const mandatory
Quest Property City_GG_Connections Auto Const mandatory
Perk Property BackgroundBouncer Auto Const mandatory
Quest Property SQ_Followers Auto Const mandatory
ActorValue Property UC_GG_Mark_Foreknowledge_BonifacKidnappedAV Auto Const mandatory
LocationAlias Property Alias_DungeonLoc Auto Const mandatory
Keyword Property LocEncEcliptic_Exclusive Auto Const mandatory
Keyword Property LocEncCrimsonFleet_Exclusive Auto Const mandatory
ReferenceAlias Property Alias_EavesdroppingTrigger Auto Const mandatory
Perk Property Intimidation Auto Const mandatory
RefCollectionAlias Property Alias_Corpses Auto Const mandatory
GlobalVariable Property GG_Mark_ReturnedSlate Auto Const mandatory
GlobalVariable Property GG_Mark_PlayerToldHelenaAboutMaldonado Auto Const mandatory
ReferenceAlias Property Alias_MurderEnableMarker Auto Const mandatory
Keyword Property COM_NotCivilian Auto Const mandatory
ReferenceAlias Property Alias_EavesdroppingEnemies Auto Const mandatory
ReferenceAlias Property Alias_QuestEnemies Auto Const mandatory
Quest Property City_GG_Mark_EnemyHolder Auto Const mandatory
GlobalVariable Property GG_Mark_BlockHelenaScene Auto Const mandatory
Faction Property City_GG_Mark_MaldonadoEnemyFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  City_GG_Connections.Start()
  City_GG_Connections.SetStage(1000)
  Game.GetPlayer().AddPerk(Intimidation, False)
  Game.GetPlayer().MoveTo(Alias_EdgeMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  City_GG_Connections.Start()
  City_GG_Connections.SetStage(1000)
  Game.GetPlayer().AddPerk(Intimidation, False)
  Self.SetStage(300)
  Game.GetPlayer().MoveTo(UC_GG_Connect_DebugMarker01, 0.0, 0.0, 0.0, True, False)
  Self.SetObjectiveCompleted(100, True)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_Bonifac.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  Alias_CaptiveMarker.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_DungeonLoc.GetLocation().RemoveKeyword(LocEncCrimsonFleet_Exclusive)
  Alias_DungeonLoc.GetLocation().AddKeyword(LocEncEcliptic_Exclusive)
  Alias_EavesdroppingTrigger.GetRef().Disable(False)
  Alias_EavesdroppingEnemies.GetRef().Disable(False)
  Alias_QuestEnemies.GetRef().Enable(False)
  Actor MalACT = Alias_Maldonado.GetActorRef()
  Actor BonACT = Alias_Bonifac.GetActorRef()
  MalACT.Enable(False)
  MalACT.EvaluatePackage(False)
  BonACT.MoveTo(Alias_CaptiveMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  BonACT.SetRestrained(True)
  BonACT.AddToFaction(PlayerAllyFaction)
  BonACT.IgnoreFriendlyHits(True)
  If BonACT.IsDisabled()
    BonACT.Enable(False)
  EndIf
  BonACT.EvaluatePackage(False)
  Alias_Corpses.DisableAll(False)
  Self.SetObjectiveDisplayed(100, True, False)
  City_GG_Mark_EnemyHolder.Start()
EndFunction

Function Fragment_Stage_0110_Item_00()
  City_GG_Mark_110_Bonifac_Attract.Start()
  Alias_CourierCorpse.GetRef().Disable(False)
  Alias_MurderEnableMarker.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0115_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(110, True, False)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Alias_Bonifac.GetActorRef().SetRestrained(False)
  Alias_BonCaptiveAlias.Clear()
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetStage(200)
  City_GG_Mark_155_Bon_FindAWeapon.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(110, True)
  If !Self.GetStageDone(310)
    Self.SetObjectiveDisplayed(200, True, False)
    Actor BonACT = Alias_Bonifac.GetActorRef()
    BonACT.AddToFaction(PlayerAllyFaction)
    (SQ_Followers as sq_followersscript).SetRoleActive(BonACT, False, True, 0.0, 0.0)
    (SQ_Followers as sq_followersscript).CommandFollow(BonACT)
  Else
    Self.SetObjectiveDisplayed(310, True, False)
  EndIf
  Game.GetPlayer().SetValue(UC_GG_Mark_Foreknowledge_BonifacKidnappedAV, 1.0)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Actor BonACT = Alias_Bonifac.GetActorRef()
  Actor PlayACT = Game.GetPlayer()
  If PlayACT.IsInCombat() || BonACT.IsInCombat()
    Self.SetObjectiveDisplayed(261, True, False)
  Else
    Self.SetObjectiveDisplayed(250, True, False)
  EndIf
  (SQ_Followers as sq_followersscript).SetRoleInactive(BonACT, False, False, True)
  BonACT.MoveTo(Alias_BonifacTeleportMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  City_GG_Mark_260_MalBonifac_Intro.Start()
EndFunction

Function Fragment_Stage_0263_Item_00()
  Self.SetObjectiveCompleted(261, True)
  If Self.GetStageDone(250)
    Self.SetObjectiveDisplayed(250, True, False)
  EndIf
  If Self.GetStageDone(310) && !Self.GetStageDone(314)
    City_GG_Mark_310_Bonifac_MeetAtGG.Start()
  EndIf
EndFunction

Function Fragment_Stage_0265_Item_00()
  Alias_Maldonado.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0267_Item_00()
  Alias_Bonifac.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0270_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveCompleted(250, True)
  Self.SetObjectiveDisplayed(270, True, False)
EndFunction

Function Fragment_Stage_0285_Item_00()
  Actor BonACT = Alias_Bonifac.GetActorRef()
  ActorBase BonBase = BonACT.GetBaseObject() as ActorBase
  BonACT.AddKeyword(COM_NotCivilian)
  BonBase.SetEssential(False)
  (SQ_Followers as sq_followersscript).SetRoleInactive(BonACT, False, False, True)
  BonACT.RemoveFromFaction(PlayerAllyFaction)
  BonACT.IgnoreFriendlyHits(False)
  BonACT.AddToFaction(PlayerEnemyFaction)
  BonACT.AddToFaction(City_GG_Mark_MaldonadoEnemyFaction)
  BonACT.StartCombat(Game.GetPlayer() as ObjectReference, False)
  Self.SetObjectiveCompleted(270, True)
  Self.SetObjectiveDisplayed(285, True, False)
EndFunction

Function Fragment_Stage_0290_Item_00()
  Actor MalACT = Alias_Maldonado.GetActorRef()
  MalACT.SetProtected(False)
  MalACT.AddToFaction(PlayerEnemyFaction)
  MalACT.StartCombat(Game.GetPlayer() as ObjectReference, False)
  If City_GG_Mark_260_MalBonifac_Intro.IsPlaying()
    City_GG_Mark_260_MalBonifac_Intro.Stop()
  EndIf
  If Self.GetStageDone(200) && !Self.GetStageDone(299) && !Self.GetStageDone(310)
    Self.SetObjectiveCompleted(270, True)
    Self.SetObjectiveDisplayed(290, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0295_Item_00()
  GG_Mark_KilledBonifac.SetValue(1.0)
  Self.SetObjectiveCompleted(200, True)
  Self.SetStage(307)
  If !Self.GetStageDone(299)
    If !Self.GetStageDone(310) && !Self.GetStageDone(285)
      City_GG_Mark_295_Bonifac_MalDead.Start()
    EndIf
    Self.SetStage(300)
  EndIf
EndFunction

Function Fragment_Stage_0299_Item_00()
  Self.SetObjectiveCompleted(285, True)
  Self.SetObjectiveDisplayed(310, True, False)
  GG_Mark_BlockHelenaScene.SetValue(0.0)
  Utility.Wait(1.0)
  City_GG_Mark_299_Mal_PostBonDeath.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(290, True)
  Self.SetObjectiveDisplayed(300, True, False)
  Actor BonACT = Alias_Bonifac.GetActorRef()
  BonACT.RemoveFromFaction(PlayerAllyFaction)
EndFunction

Function Fragment_Stage_0305_Item_00()
  Game.GetPlayer().AddItem(Alias_Data.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveCompleted(270, True)
  Self.SetObjectiveCompleted(300, True)
  Self.SetStage(307)
  If Self.GetStageDone(190)
    If Self.GetStageDone(263) && !Self.GetStageDone(314) && !Self.GetStageDone(280)
      City_GG_Mark_310_Bonifac_MeetAtGG.Start()
    EndIf
    If Self.GetStageDone(280) && !Self.GetStageDone(299)
      GG_Mark_BlockHelenaScene.SetValue(1.0)
    Else
      Self.SetObjectiveDisplayed(310, True, False)
    EndIf
  EndIf
  If Self.GetStageDone(190) || Self.GetStageDone(200)
    (SQ_Followers as sq_followersscript).SetRoleInactive(Alias_Bonifac.GetActorRef(), False, False, True)
  EndIf
EndFunction

Function Fragment_Stage_0311_Item_00()
  If City_GG_Mark_310_Bonifac_MeetAtGG.IsPlaying()
    City_GG_Mark_310_Bonifac_MeetAtGG.Stop()
  EndIf
EndFunction

Function Fragment_Stage_0320_Item_00()
  Alias_Maldonado.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0960_Item_00()
  GG_Mark_PlayerToldHelenaBonifacDead.SetValue(1.0)
EndFunction

Function Fragment_Stage_0965_Item_00()
  GG_Mark_PlayerToldHelenaAboutMaldonado.SetValue(1.0)
EndFunction

Function Fragment_Stage_0970_Item_00()
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_0980_Item_00()
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Data.GetRef() as Form, 1, False, None)
  Actor BonACT = Alias_Bonifac.GetActorRef()
  If !BonACT.IsDead()
    BonACT.MoveTo(BonifacTeleportMarker, 0.0, 0.0, 0.0, True, False)
  EndIf
  Alias_CourierCorpse.GetRef().Disable(False)
  Alias_MurderEnableMarker.GetRef().Disable(False)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
