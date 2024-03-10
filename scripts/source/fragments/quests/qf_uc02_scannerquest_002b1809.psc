ScriptName Fragments:Quests:QF_UC02_ScannerQuest_002B1809 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property DebugMarker Auto Const
ReferenceAlias Property Alias_Terrormorph Auto Const mandatory
Scene Property UC02_TrackerQuest_100_Scene Auto Const mandatory
GlobalVariable Property UC02_LivestockTrackerEnabled Auto Const mandatory
Message Property UC02_DEBUG_Stopped Auto Const mandatory
Message Property UC02_DEBUG_Started Auto Const mandatory
wwiseevent Property WWiseScannerEvent Auto Const
Float Property WwiseEventInstanceID Auto Const
Quest Property UC02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_Terrormorph.GetRef().Enable(False)
  Game.GetPlayer().Moveto(DebugMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  UC02_LivestockTrackerEnabled.SetValue(1.0)
  If UC02.IsRunning()
    (UC02 as uc02_questscript).ToggleRestoreTrackerObj(False)
  EndIf
EndFunction

Function Fragment_Stage_0110_Item_00()
  Quest __temp = Self as Quest
  uc02_scannerquestscript kmyQuest = __temp as uc02_scannerquestscript
  kmyQuest.WwiseEventInstanceID = WWiseScannerEvent.Play(Alias_Terrormorph.GetRef(), None, None)
  If UC02.GetStageDone(601)
    kmyQuest.DisplayDistanceMessage()
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest
  uc02_scannerquestscript kmyQuest = __temp as uc02_scannerquestscript
  UC02_TrackerQuest_100_Scene.Stop()
  wwiseevent.StopInstance(kmyQuest.WwiseEventInstanceID)
  UC02_LivestockTrackerEnabled.SetValue(0.0)
  If UC02.IsRunning()
    (UC02 as uc02_questscript).ToggleRestoreTrackerObj(True)
  EndIf
  Self.Stop()
EndFunction
