ScriptName DBTestPCMAIScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property FoundPackins Auto Const mandatory
ReferenceAlias Property NearbyPackin Auto Const mandatory
Scene Property DBTestPCMAI_InvestigatePackinScene Auto Const mandatory
Int Property AtTargetLocationStage = 100 Auto Const

;-- Functions ---------------------------------------

Event OnQuestInit()
  If NearbyPackin.GetRef() == None
    Self.CheckForNearbyPackin()
  Else
    DBTestPCMAI_InvestigatePackinScene.Start()
  EndIf
EndEvent

Bool Function CheckForNearbyPackin()
  FoundPackins.AddRef(NearbyPackin.GetRef())
  NearbyPackin.ClearAndRefillAlias()
  If NearbyPackin.GetRef()
    DBTestPCMAI_InvestigatePackinScene.Stop()
    Utility.wait(1.0)
    DBTestPCMAI_InvestigatePackinScene.Start()
  EndIf
  If Self.GetStageDone(AtTargetLocationStage) == False
    Self.StartTimer(10.0, 0)
  EndIf
EndFunction

Event OnTimer(Int aiTimerID)
  If DBTestPCMAI_InvestigatePackinScene.IsPlaying()
    Self.StartTimer(10.0, 0)
  Else
    Self.CheckForNearbyPackin()
  EndIf
EndEvent
