ScriptName Fragments:Quests:QF_LC082_002BF365 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_CF01InterrogationRoomGuards Auto Const mandatory
RefCollectionAlias Property Alias_BrigClutter Auto Const mandatory
ReferenceAlias Property Alias_VigilanceShip Auto Const mandatory
ReferenceAlias Property Alias_Kibwe Auto Const mandatory
ObjectReference Property LC082_StartDockingBay Auto Const mandatory
ObjectReference Property LC082_InterrogationRoomDoorRef Auto Const mandatory
ObjectReference Property LC082_OperationsCenterElevatorAccessDoorRef Auto Const mandatory
ObjectReference Property LC082_PlayerShipDockingPortAccessDoorRef Auto Const mandatory
ObjectReference Property CF01KibweOpsMarker Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
Quest Property CF01 Auto Const mandatory
Quest Property CF02 Auto Const mandatory
Quest Property CF03 Auto Const mandatory
Quest Property CF04 Auto Const mandatory
Quest Property CF05 Auto Const mandatory
Quest Property CF06 Auto Const mandatory
Quest Property CF07 Auto Const mandatory
Quest Property LC088 Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
Faction Property CrimsonFleetFaction Auto Const mandatory
Faction Property UCSysDefFaction Auto Const mandatory
Scene Property LC082_SysDefKickoutScene Auto Const mandatory
Perk Property LC088_Space_VigilanceDamageImmunityPerk Auto Const mandatory
Keyword Property DisallowAsCombatTargetKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0200_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(LC082_StartDockingBay, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Quest __temp = Self as Quest
  lc082_vigilancequestscript kmyQuest = __temp as lc082_vigilancequestscript
  kmyQuest.DEBUG_SetupVigilanceCombatDemo()
EndFunction

Function Fragment_Stage_0006_Item_00()
  Quest __temp = Self as Quest
  lc082_vigilancequestscript kmyQuest = __temp as lc082_vigilancequestscript
  kmyQuest.DEBUG_SetupBatteryCombatDemo()
EndFunction

Function Fragment_Stage_0010_Item_00()
  spaceshipreference vigilanceRef = Alias_VigilanceShip.GetShipRef()
  vigilanceRef.AddKeyword(DisallowAsCombatTargetKeyword)
  vigilanceRef.AddPerk(LC088_Space_VigilanceDamageImmunityPerk, False)
  Alias_BrigClutter.DisableAll(False)
EndFunction

Function Fragment_Stage_0010_Item_01()
  CF01.SetStage(2)
EndFunction

Function Fragment_Stage_0011_Item_00()
  Quest __temp = Self as Quest
  lc082_vigilancequestscript kmyQuest = __temp as lc082_vigilancequestscript
  LC082_InterrogationRoomDoorRef.Unlock(False)
  LC082_OperationsCenterElevatorAccessDoorRef.SetOpen(True)
  LC082_PlayerShipDockingPortAccessDoorRef.SetOpen(True)
  Alias_Kibwe.TryToMoveTo(CF01KibweOpsMarker)
  Self.SetStage(25)
  If LC088.GetStage() > 0 || CF07.IsRunning()
    kmyQuest.UpdateVigilanceLocation("CF07")
  ElseIf CF06.IsRunning()
    kmyQuest.UpdateVigilanceLocation("CF06")
  ElseIf CF05.IsRunning()
    kmyQuest.UpdateVigilanceLocation("CF05")
  ElseIf CF04.IsRunning()
    kmyQuest.UpdateVigilanceLocation("CF04")
  Else
    kmyQuest.UpdateVigilanceLocation("CF01")
  EndIf
EndFunction

Function Fragment_Stage_0025_Item_00()
  Alias_CF01InterrogationRoomGuards.DisableAll(False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Quest __temp = Self as Quest
  lc082_vigilancequestscript kmyQuest = __temp as lc082_vigilancequestscript
  kmyQuest.ProtectVigilanceMainActors(True)
EndFunction

Function Fragment_Stage_0211_Item_00()
  Quest __temp = Self as Quest
  lc082_vigilancequestscript kmyQuest = __temp as lc082_vigilancequestscript
  kmyQuest.ProtectVigilanceMainActors(False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Quest __temp = Self as Quest
  lc082_vigilancequestscript kmyQuest = __temp as lc082_vigilancequestscript
  CF_Main.SetStage(300)
  kmyQuest.ActivateTurrets()
  kmyQuest.SetAllowDockingWithVigilance(False)
  kmyQuest.UpdateVigilanceLocation("Shutdown")
  kmyQuest.TryToStartKickoutScene()
EndFunction

Function Fragment_Stage_0251_Item_00()
  LC082_SysDefKickoutScene.Start()
EndFunction

Function Fragment_Stage_0252_Item_00()
  Alias_VigilanceShip.GetShipRef().DisableWithGravJumpNoWait()
EndFunction
