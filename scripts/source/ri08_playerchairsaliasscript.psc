ScriptName RI08_PlayerChairsAliasScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group OnEnterFurniture_GeneralCheck
  Int Property iStageToSet01 Auto Const
  Int Property iPreReqStage01 Auto Const
  Int Property iStartSceneStage Auto Const
EndGroup

Group OnEnterFurniture_ExtraCheckForRI08
  Int Property iStageToSet02 Auto Const
  Int Property iPreReqStage02 Auto Const
  Int Property iTurnOffStage02 Auto Const
EndGroup

Group OnActivate_CombatCheckStages
  Int Property iStageToSet03 Auto Const
  Int Property iPreReqStage03 Auto Const
EndGroup

Group Scenes
  Scene Property RI08_0910_Meeting_UlaruWinsScene Auto Const mandatory
  Scene Property RI08_0910_Meeting_MasakoWinsScene Auto Const mandatory
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
    If OwningQuest.GetStageDone(iPreReqStage02) && !OwningQuest.GetStageDone(iTurnOffStage02)
      OwningQuest.SetStage(iStageToSet02)
    EndIf
    If OwningQuest.GetStageDone(iStartSceneStage)
      If RI05_Track_PlayerSidedWithMasako.GetValue() == 1.0
        RI08_0910_Meeting_MasakoWinsScene.Start()
      Else
        RI08_0910_Meeting_UlaruWinsScene.Start()
      EndIf
    EndIf
  EndIf
EndEvent

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  Actor PlayerRef = Game.GetPlayer()
  Quest OwningQuest = Self.GetOwningQuest()
  If akActionRef == PlayerRef as ObjectReference
    If OwningQuest.GetStageDone(iStageToSet03)
      (OwningQuest as ri08_questscript).FreezeControlsMeeting()
    EndIf
    If !PlayerRef.IsInCombat() && OwningQuest.GetStageDone(iPreReqStage03)
      OwningQuest.SetStage(iStageToSet03)
    EndIf
  EndIf
EndEvent
