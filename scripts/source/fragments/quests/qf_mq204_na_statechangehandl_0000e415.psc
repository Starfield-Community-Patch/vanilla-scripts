ScriptName Fragments:Quests:QF_MQ204_NA_StateChangeHandl_0000E415 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Activator Property UC04_PlayerOnly_WeatherTrigger Auto Const mandatory
GlobalVariable Property UC04_DisableSpaceportCrowds Auto Const mandatory
ObjectReference Property UC04_Spaceport_WarningSign_EnableMarker Auto Const mandatory
ObjectReference Property UC03_Spaceport_EnableMarker Auto Const mandatory
Scene Property MQ204_NA_StateChangeHandlerScene Auto Const mandatory
MusicType Property _MUSExplore_WwiseSilence Auto Const mandatory
ObjectReference Property MQ204_Spaceport_EnableMarker_Actors Auto Const mandatory
Quest Property FFNewAtlantis01 Auto Const mandatory
ReferenceAlias Property Alias_TommyBitlow Auto Const mandatory
GlobalVariable Property UC04_AttackActive Auto Const mandatory
Quest Property CF05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  UC04_DisableSpaceportCrowds.SetValueInt(1)
  UC04_Spaceport_WarningSign_EnableMarker.disable(False)
  UC03_Spaceport_EnableMarker.disable(False)
  MQ204_Spaceport_EnableMarker_Actors.disable(False)
  If FFNewAtlantis01.IsRunning()
    FFNewAtlantis01.SetStage(2)
  EndIf
  Actor TommyREF = Alias_TommyBitlow.GetActorRef()
  TommyREF.DisableNoWait(False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  MQ204_NA_StateChangeHandlerScene.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  If UC04_AttackActive.GetValueInt() == 0
    UC04_DisableSpaceportCrowds.SetValueInt(0)
    UC04_Spaceport_WarningSign_EnableMarker.Enable(False)
    UC03_Spaceport_EnableMarker.Enable(False)
    MQ204_Spaceport_EnableMarker_Actors.Enable(False)
  EndIf
  Self.Stop()
EndFunction

Function Fragment_Stage_0200_Item_00()
  _MUSExplore_WwiseSilence.Remove()
  If FFNewAtlantis01.IsRunning()
    FFNewAtlantis01.SetStage(3)
  EndIf
  If CF05.GetStageDone(703)
    CF05.SetStage(704)
  EndIf
  Actor TommyREF = Alias_TommyBitlow.GetActorRef()
  TommyREF.EnableNoWait(False)
EndFunction
