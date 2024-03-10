ScriptName Fragments:Quests:QF_Patch_Update02_0020D241 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_NA_Well01 Auto Const
Quest Property City_NA_Well02 Auto Const
ReferenceAlias Property Well01Door01 Auto Const
ReferenceAlias Property Well01Door02 Auto Const
ReferenceAlias Property Well01Door03 Auto Const
ReferenceAlias Property Well01Door04 Auto Const
ReferenceAlias Property Well01Puzzle01 Auto Const
ReferenceAlias Property Well01Puzzle02 Auto Const
ReferenceAlias Property Well01Puzzle03 Auto Const
ReferenceAlias Property Well01Puzzle04 Auto Const
ReferenceAlias Property Well01BlockingDoor Auto Const
ReferenceAlias Property Well02Door01 Auto Const
ReferenceAlias Property Well02Door02 Auto Const
ReferenceAlias Property Well02Door03 Auto Const
ReferenceAlias Property Well02Door04 Auto Const
ReferenceAlias Property Well02ApartmentDoor Auto Const
Quest Property UC08 Auto Const
ReferenceAlias Property UC08_TransformRoomDoor Auto Const
ActorValue Property Aggression Auto Const mandatory
Quest Property LC088_Key Auto Const mandatory
ReferenceAlias Property Alias_LC088KeyDelgado Auto Const mandatory
Quest Property City_NA_Viewport03 Auto Const
ReferenceAlias Property City_NA_Viewport03_Sub12Door Auto Const
ReferenceAlias Property MS01InfirmaryDoor Auto Const
Quest Property MS01 Auto Const
Quest Property FC05 Auto Const
Scene Property FC05_MeiAnnounceRunScene Auto Const
Location Property SettleRedMileLocation Auto Const
Scene Property DialogueRedMile_Mei_Greeting Auto Const
ReferenceAlias Property Alias_Companion_Andreja Auto Const mandatory
ReferenceAlias Property Alias_Companion_Barrett Auto Const mandatory
ReferenceAlias Property Alias_Companion_SamCoe Auto Const mandatory
ReferenceAlias Property Alias_Companion_SarahMorgan Auto Const mandatory
ReferenceAlias Property Alias_ActiveCompanion Auto Const mandatory
Quest Property MQ202 Auto Const mandatory
Quest Property MQ204 Auto Const mandatory
Quest Property MQ201B Auto Const mandatory
ActorValue Property COM_PQ_LockedIn Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory
Quest Property COM_Companion_Andreja Auto Const mandatory
Quest Property Com_Companion_Barrett Auto Const mandatory
Quest Property COM_Companion_SamCoe Auto Const mandatory
Quest Property COM_Companion_SarahMorgan Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  If City_NA_Well01.IsRunning()
    If City_NA_Well01.GetStageDone(20) && Well01Door01.GetRef().IsLocked()
      Well01Door01.GetRef().Lock(False, False, True)
    EndIf
    If City_NA_Well01.GetStageDone(50) && Well01Door02.GetRef().IsLocked()
      Well01Door02.GetRef().Lock(False, False, True)
    EndIf
    If City_NA_Well01.GetStageDone(100) && Well01Door03.GetRef().IsLocked()
      Well01Door03.GetRef().Lock(False, False, True)
    EndIf
    If City_NA_Well01.GetStageDone(150) && Well01Door04.GetRef().IsLocked()
      Well01Door04.GetRef().Lock(False, False, True)
      Well01Puzzle01.GetRef().Lock(False, False, True)
      Well01Puzzle02.GetRef().Lock(False, False, True)
      Well01Puzzle03.GetRef().Lock(False, False, True)
      Well01Puzzle04.GetRef().Lock(False, False, True)
    EndIf
    If City_NA_Well01.GetStageDone(185) && Well01BlockingDoor.GetRef().IsLocked()
      Well01BlockingDoor.GetRef().Lock(False, False, True)
      Well01BlockingDoor.GetRef().SetOpen(True)
    EndIf
  EndIf
  If City_NA_Well02.IsRunning()
    If City_NA_Well02.GetStageDone(50) && Well02Door01.GetRef().IsLocked()
      Well02Door01.GetRef().Lock(False, False, True)
    EndIf
    If City_NA_Well02.GetStageDone(70) && Well02Door02.GetRef().IsLocked()
      Well02Door02.GetRef().Lock(False, False, True)
      Well02Door03.GetRef().Lock(False, False, True)
    EndIf
    If (City_NA_Well02.GetStageDone(90) || City_NA_Well02.GetStageDone(110)) && Well02Door04.GetRef().IsLocked()
      Well02Door04.GetRef().Lock(False, False, True)
    EndIf
    If City_NA_Well02.GetStageDone(150) && Well02ApartmentDoor.GetRef().IsLocked()
      Well02ApartmentDoor.GetRef().SetLockLevel(25)
    EndIf
  EndIf
  If UC08.GetStageDone(430) && UC08_TransformRoomDoor.GetRef().IsLocked()
    UC08_TransformRoomDoor.GetRef().BlockActivation(False, False)
    UC08_TransformRoomDoor.GetRef().Unlock(False)
  EndIf
  If LC088_Key.GetStage() == 600
    Alias_LC088KeyDelgado.GetActorRef().SetValue(Aggression, 0.0)
  EndIf
  If City_NA_Viewport03.GetStageDone(40) && City_NA_Viewport03_Sub12Door.GetRef().IsLocked()
    City_NA_Viewport03_Sub12Door.GetRef().Lock(False, False, True)
  EndIf
  If MS01.GetStageDone(420) && MS01InfirmaryDoor.GetRef().IsLocked()
    MS01InfirmaryDoor.GetRef().Unlock(False)
  EndIf
  If FC05.GetStageDone(700) && !FC05.GetStageDone(800) && !FC05_MeiAnnounceRunScene.IsPlaying()
    If Game.GetPlayer().GetCurrentLocation() == SettleRedMileLocation
      FC05.SetStage(800)
    Else
      FC05.SetStage(790)
    EndIf
  EndIf
  If DialogueRedMile_Mei_Greeting.IsPlaying()
    DialogueRedMile_Mei_Greeting.Stop()
  EndIf
  If MQ202.IsRunning() && !MQ202.GetStageDone(20)
    Actor AndrejaREF = Alias_Companion_Andreja.GetActorRef()
    Actor BarrettREF = Alias_Companion_Barrett.GetActorRef()
    Actor SamCoeREF = Alias_Companion_SamCoe.GetActorRef()
    Actor SarahMorganREF = Alias_Companion_SarahMorgan.GetActorRef()
    Actor ActiveCompanionREF = Alias_ActiveCompanion.GetActorRef()
    If AndrejaREF.GetValue(COM_PQ_LockedIn) == 1.0 && AndrejaREF != ActiveCompanionREF
      (SQ_Companions as sq_companionsscript).SetRoleActive(AndrejaREF, True, True, 0.0, 0.0)
      AndrejaREF.MoveToPackageLocation()
    EndIf
    If BarrettREF.GetValue(COM_PQ_LockedIn) == 1.0 && BarrettREF != ActiveCompanionREF
      (SQ_Companions as sq_companionsscript).SetRoleActive(BarrettREF, True, True, 0.0, 0.0)
      BarrettREF.MoveToPackageLocation()
    EndIf
    If SamCoeREF.GetValue(COM_PQ_LockedIn) == 1.0 && SamCoeREF != ActiveCompanionREF
      (SQ_Companions as sq_companionsscript).SetRoleActive(SamCoeREF, True, True, 0.0, 0.0)
      SamCoeREF.MoveToPackageLocation()
    EndIf
    If SarahMorganREF.GetValue(COM_PQ_LockedIn) == 1.0 && SarahMorganREF != ActiveCompanionREF
      (SQ_Companions as sq_companionsscript).SetRoleActive(SarahMorganREF, True, True, 0.0, 0.0)
      SarahMorganREF.MoveToPackageLocation()
    EndIf
  EndIf
  If MQ201B.IsRunning() || MQ202.IsRunning() || MQ204.IsRunning()
    If COM_Companion_Andreja.IsObjectiveDisplayed(10)
      COM_Companion_Andreja.SetObjectiveDisplayed(10, False, False)
    EndIf
    If Com_Companion_Barrett.IsObjectiveDisplayed(900)
      Com_Companion_Barrett.SetObjectiveDisplayed(900, False, False)
    EndIf
    If COM_Companion_SamCoe.IsObjectiveDisplayed(10)
      COM_Companion_SamCoe.SetObjectiveDisplayed(10, False, False)
    EndIf
    If COM_Companion_SamCoe.IsObjectiveDisplayed(798)
      COM_Companion_SamCoe.SetObjectiveDisplayed(798, False, False)
    EndIf
    If COM_Companion_SarahMorgan.IsObjectiveDisplayed(10)
      COM_Companion_SarahMorgan.SetObjectiveDisplayed(10, False, False)
    EndIf
  EndIf
  Self.Stop()
EndFunction
