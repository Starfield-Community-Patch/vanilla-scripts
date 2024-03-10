ScriptName Fragments:Quests:QF_CF_Main_00178B1E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property CrimsonFleetFaction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
Perk Property FactionCrimsonFleetPerk Auto Const mandatory
GlobalVariable Property CF_SysDefShutdown Auto Const mandatory
Quest Property LC082 Auto Const mandatory
Faction Property UCSysDefFaction Auto Const mandatory
Quest Property CFKey Auto Const mandatory
Quest Property DialogueCFTheKey Auto Const mandatory
GlobalVariable Property PlayerJoined_CrimsonFleet Auto Const mandatory
GlobalVariable Property PlayerJoined_SysDef Auto Const mandatory
Perk Property FactionUnitedColoniesSysDefPerk Auto Const mandatory
Quest Property CF01 Auto Const mandatory
Message Property CF_Main_SysDefKickout Auto Const mandatory
Quest Property LC088 Auto Const mandatory
Quest Property DialogueUCVigilance Auto Const mandatory
ObjectReference Property TheKeyMapMarkerHeadingRef Auto Const mandatory
ObjectReference Property TheKeyOriginMarkerRef Auto Const mandatory
ObjectReference Property TheKeyPlanetUniqueArrivalMarkerRef Auto Const mandatory
ObjectReference Property PrisonMarkerNewAtlantis Auto Const mandatory
GlobalVariable Property CF04_UCArrested Auto Const mandatory
Quest Property CF04 Auto Const mandatory
Quest Property CFSD01 Auto Const mandatory
Faction[] Property FleetFriendFactions Auto Const mandatory
Quest Property CF02 Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0250_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(10)
  Self.SetStage(20)
  LC082.SetStage(11)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(0)
  CFKey.SetStage(200)
  DialogueCFTheKey.SetStage(4)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Game.GetPlayer().AddtoFaction(CrimsonFleetFaction)
  Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk, False)
  PlayerJoined_CrimsonFleet.SetValue(1.0)
  TheKeyMapMarkerHeadingRef.MoveTo(TheKeyOriginMarkerRef, 0.0, 0.0, 0.0, True, False)
  TheKeyPlanetUniqueArrivalMarkerRef.MoveTo(TheKeyOriginMarkerRef, 0.0, 0.0, 0.0, True, False)
  Int I = 0
  While I < FleetFriendFactions.Length
    CrimsonFleetFaction.SetAlly(FleetFriendFactions[I], True, True)
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0020_Item_00()
  PlayerFaction.SetAlly(UCSysDefFaction, False, False)
  LC082.SetStage(200)
  PlayerJoined_SysDef.SetValue(1.0)
  Game.GetPlayer().AddPerk(FactionUnitedColoniesSysDefPerk, False)
  DialogueUCVigilance.SetStage(90)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Game.GetPlayer().RemoveFromFaction(CrimsonFleetFaction)
  PlayerFaction.SetEnemy(CrimsonFleetFaction, False, False)
  Game.GetPlayer().RemovePerk(FactionCrimsonFleetPerk)
  Int I = 0
  While I < FleetFriendFactions.Length
    CrimsonFleetFaction.SetEnemy(FleetFriendFactions[I], True, True)
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0275_Item_00()
  Quest __temp = Self as Quest
  cf_main_questscript kmyQuest = __temp as cf_main_questscript
  kmyQuest.RegisterForLoadScreenEvent()
  Game.GetPlayer().MoveTo(PrisonMarkerNewAtlantis, 0.0, 0.0, 0.0, True, False)
  kmyQuest.SendPlayerToJail()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  cf_main_questscript kmyQuest = __temp as cf_main_questscript
  PlayerFaction.SetEnemy(UCSysDefFaction, False, False)
  CF_SysDefShutdown.SetValue(1.0)
  kmyQuest.SysDefShutdown()
  LC082.SetStage(250)
  Game.GetPlayer().RemovePerk(FactionUnitedColoniesSysDefPerk)
  If CF02.GetStageDone(999) && !CF02.GetStageDone(1700)
    CF02.SetStage(998)
  EndIf
  If CFSD01.GetStageDone(5) == False
    CFSD01.SetStage(5)
  EndIf
  If LC088.GetStage() == 0
    CF_Main_SysDefKickout.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Else
    Self.SetStage(75)
  EndIf
  CFSD01.SetStage(1500)
  If CF01.IsRunning() && CF01.GetStageDone(175) == False
    If CF01.GetStageDone(310) == False
      CF01.SetStage(230)
    ElseIf CF01.GetStageDone(310) == True && CF01.GetStageDone(340) == False
      CF01.SetStage(309)
    EndIf
  EndIf
  DialogueUCVigilance.FailAllObjectives()
EndFunction
