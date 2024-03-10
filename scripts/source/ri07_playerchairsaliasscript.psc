ScriptName RI07_PlayerChairsAliasScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group OnEnterFurniture_GeneralCheck
  Int Property iStageToSet01 Auto Const
  Int Property iPreReqStage01 Auto Const
  Int Property iStartSceneStage Auto Const
EndGroup

Group OnActivate_CombatCheckStages
  Int Property iStageToSet03 Auto Const
  Int Property iPreReqStage03 Auto Const
EndGroup

Group Scenes
  Scene Property RI07_0400_Dalton_ConferenceRoomBScene Auto Const mandatory
  Scene Property RI07_0400_Dalton_ConferenceRoomACScene Auto Const mandatory
EndGroup

Group TrackingGlobals
  GlobalVariable Property RI05_Track_PlayerSidedWithMasako Auto Const mandatory
  GlobalVariable Property RI05_Track_PlayerSidedWithUlaru Auto Const mandatory
  GlobalVariable Property RI05_UlaruDead Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnEnterFurniture(ObjectReference akSenderRef, Actor akActionRef)
  Quest OwningQuest = Self.GetOwningQuest()
  If akActionRef == Game.GetPlayer()
    If OwningQuest.GetStageDone(iPreReqStage01)
      OwningQuest.SetStage(iStageToSet01)
    EndIf
    If OwningQuest.GetStageDone(iStartSceneStage)
      If RI05_Track_PlayerSidedWithMasako.GetValue() == 1.0 && RI05_UlaruDead.GetValue() == 0.0 || RI05_Track_PlayerSidedWithUlaru.GetValue() == 1.0
        RI07_0400_Dalton_ConferenceRoomACScene.Start()
      EndIf
      If RI05_Track_PlayerSidedWithMasako.GetValue() == 1.0 && RI05_UlaruDead.GetValue() == 1.0
        RI07_0400_Dalton_ConferenceRoomBScene.Start()
      EndIf
    EndIf
  EndIf
EndEvent

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  Actor PlayerRef = Game.GetPlayer()
  Quest OwningQuest = Self.GetOwningQuest()
  If akActionRef == PlayerRef as ObjectReference
    If OwningQuest.GetStageDone(iStageToSet03)
      (OwningQuest as ri07_questscript).FreezeControlsMeeting()
    EndIf
    If !PlayerRef.IsInCombat() && OwningQuest.GetStageDone(iPreReqStage03)
      OwningQuest.SetStage(iStageToSet03)
    EndIf
  EndIf
EndEvent
