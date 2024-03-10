ScriptName CF_Main_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property CrimeFactionUC Auto Const mandatory
Quest Property CF02 Auto Const mandatory
Quest Property CF03 Auto Const mandatory
Quest Property CF04 Auto Const mandatory
Quest Property CF05 Auto Const mandatory
Quest Property CF06 Auto Const mandatory
Quest Property CF07 Auto Const mandatory
GlobalVariable Property CF04_UCArrested Auto Const mandatory
GlobalVariable Property CF05_UCArrested Auto Const mandatory

;-- Functions ---------------------------------------

Function SendPlayerToJail()
  CrimeFactionUC.SendPlayerToJail(True, False)
EndFunction

Function RegisterForLoadScreenEvent()
  Self.RegisterForMenuOpenCloseEvent("LoadingMenu")
EndFunction

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If !abOpening
    If CF04_UCArrested.GetValue() == 1.0
      Utility.Wait(3.0)
      CF04.SetStage(1000)
      Self.UnregisterForMenuOpenCloseEvent("LoadingMenu")
    ElseIf CF05_UCArrested.GetValue() == 1.0
      Utility.Wait(3.0)
      CF05.SetStage(10000)
      Self.UnregisterForMenuOpenCloseEvent("LoadingMenu")
    EndIf
  EndIf
EndEvent

Function SysDefShutdown()
  If CF02.IsRunning() == True
    CF02.SetStage(18)
  EndIf
  If CF03.IsRunning() == True
    CF03.SetStage(18)
  EndIf
  If CF04.IsRunning() == True
    CF04.SetStage(18)
  EndIf
  If CF05.IsRunning() == True
    CF05.SetStage(38)
  EndIf
  If CF07.IsRunning() == True
    CF07.SetStage(18)
  EndIf
EndFunction
