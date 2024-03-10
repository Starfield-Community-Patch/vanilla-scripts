ScriptName Fragments:Quests:QF_Patch_Update01_00205A9B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
lc030_questscript Property LC030 Auto Const mandatory
Quest Property MQ204_NA_StateChangeHandler Auto Const mandatory
Quest Property UC01 Auto Const mandatory
Quest Property UC02 Auto Const mandatory
ReferenceAlias Property LC012ScowTrigger Auto Const
ReferenceAlias Property LC012ScowDoor Auto Const
Quest Property FFLodge04 Auto Const
ReferenceAlias Property Companion_SarahMorgan Auto Const
Location Property CityNewAtlantisLodgeLocation Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  If LC030.GetStageDone(640) && !LC030.GetStageDone(650)
    LC030.StartShuttleBayMonitor()
  EndIf
  If UC01.IsCompleted() && !UC02.GetStageDone(100)
    If MQ204_NA_StateChangeHandler.IsRunning() && !MQ204_NA_StateChangeHandler.GetStageDone(100)
      MQ204_NA_StateChangeHandler.SetStage(100)
    EndIf
    UC02.Start()
  EndIf
  If !LC012ScowTrigger.GetRef().IsEnabled() && LC012ScowDoor.GetRef().GetOpenState() == 3
    LC012ScowDoor.GetRef().SetOpen(True)
  EndIf
  If !FFLodge04.GetStageDone(50) && FFLodge04.IsRunning() && Companion_SarahMorgan.GetRef().GetCurrentLocation() != CityNewAtlantisLodgeLocation
    FFLodge04.SetStage(200)
  EndIf
  Self.Stop()
EndFunction
