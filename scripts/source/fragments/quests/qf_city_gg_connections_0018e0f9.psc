ScriptName Fragments:Quests:QF_City_GG_Connections_0018E0F9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CourierSlate Auto Const mandatory
ReferenceAlias Property Alias_CourierCorpse Auto Const mandatory
ObjectReference Property UC_GG_Connect_DebugMarker01 Auto Const mandatory
ObjectReference Property UC_GG_Connect_DebugMarker02 Auto Const mandatory
ReferenceAlias Property Alias_Bonifac Auto Const mandatory
Message Property UC_GG_Connect_Debug_RoomFullOfBlood Auto Const mandatory
Quest Property City_GG_Mark Auto Const mandatory
Scene Property City_GG_Connections_Helena_110_IntercomScene Auto Const mandatory
ReferenceAlias Property Alias_Package Auto Const mandatory
Scene Property City_GG_Connections_Companion_250_RxnToCorpse Auto Const mandatory
Quest Property UC_GG_Connect_Misc Auto Const mandatory
RefCollectionAlias Property Alias_ScanPoints Auto Const mandatory
GlobalVariable Property UC_GG_Connect_HelenaKnowsCourierIsDead Auto Const mandatory
ReferenceAlias Property Alias_MurderEnableMarker Auto Const mandatory
Scene Property City_GG_Connections_Helena_120_Leads Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().Moveto(UC_GG_Connect_DebugMarker01, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(200)
  Game.GetPlayer().Moveto(UC_GG_Connect_DebugMarker02, 0.0, 0.0, 0.0, True, False)
  Self.SetObjectiveCompleted(100, True)
EndFunction

Function Fragment_Stage_0100_Item_00()
  If UC_GG_Connect_Misc.IsRunning()
    UC_GG_Connect_Misc.SetStage(1000)
  EndIf
  Alias_CourierCorpse.GetRef().Enable(False)
  Alias_MurderEnableMarker.GetRef().Enable(False)
  Self.SetObjectiveDisplayed(110, True, False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(110, True, False)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveDisplayed(120, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(120, True)
  Self.SetObjectiveDisplayed(200, True, False)
  (Alias_ScanPoints as uc_gg_connect_scannerrefcolscript).BlockScannerState(False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Alias_Bonifac.GetRef().Disable(False)
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(250, True, False)
  City_GG_Connections_Companion_250_RxnToCorpse.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveCompleted(120, True)
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveCompleted(250, True)
  Self.SetObjectiveDisplayed(300, True, False)
  If City_GG_Connections_Helena_120_Leads.IsPlaying()
    City_GG_Connections_Helena_120_Leads.Stop()
  EndIf
EndFunction

Function Fragment_Stage_0310_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Package.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0315_Item_00()
  UC_GG_Connect_HelenaKnowsCourierIsDead.SetValue(1.0)
EndFunction

Function Fragment_Stage_1000_Item_00()
  (Alias_ScanPoints as uc_gg_connect_scannerrefcolscript).BlockScannerState(True)
  City_GG_Mark.Start()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
