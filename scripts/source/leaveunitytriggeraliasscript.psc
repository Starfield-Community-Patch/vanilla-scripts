ScriptName LeaveUnityTriggerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const mandatory
ReferenceAlias Property PlayerShipPilotSeat Auto Const mandatory
ReferenceAlias Property PlayerShipCockpitEntrance Auto Const mandatory
ReferenceAlias Property Armillary Auto Const mandatory
Int Property TalkedToUnityStage = 100 Auto Const
Int Property LeftUnityStage = 300 Auto Const
ObjectReference Property LodgeStartMarker Auto Const mandatory
Quest Property MQ00 Auto Const mandatory
Int Property EnterUnityObjective = 100 Auto Const
Int Property LeaveUnityObjective = 110 Auto Const
Int Property ReturnUnityObjective = 120 Auto Const
Scene Property MQ305_002_Unity_04 Auto Const
GlobalVariable Property MQ305FinalSceneInt Auto Const mandatory
ObjectReference Property MQ305EndingMarkerEmissary Auto Const mandatory
ObjectReference Property Mq305EndingMarkerHunter Auto Const mandatory
ObjectReference Property MQ305EndingMarkerNeither Auto Const mandatory
ObjectReference Property MQ305EndingMarkerCF_SysDef Auto Const mandatory
ObjectReference Property MQ305EndingMarkerCF_Delgado Auto Const mandatory
ObjectReference Property MQ305EndingMarkerFSC_HopeDead Auto Const mandatory
ObjectReference Property MQ305EndingMarkerFSC_HopeNotDead Auto Const mandatory
ObjectReference Property MQ305EndingMarkerFSC_HopeLetGo Auto Const mandatory
ObjectReference Property MQ305EndingMarkerRI_NeuroAmp Auto Const mandatory
ObjectReference Property MQ305EndingMarkerRI_NeuroAmp_Masako Auto Const mandatory
ObjectReference Property MQ305EndingMarkerRI_NeuroAmp_Ularu Auto Const mandatory
ObjectReference Property MQ305EndingMarkerRI_NoNeuroAmp Auto Const mandatory
ObjectReference Property MQ305EndingMarkerRI_NoNeuroAmp_Masako Auto Const mandatory
ObjectReference Property MQ305EndingMarkerRI_NoNeuroAmp_Ularu Auto Const mandatory
ObjectReference Property MQ305EndingMarkerConstellation Auto Const mandatory
ObjectReference Property MQ305EndingMarkerUC_Terrormorph Auto Const mandatory
ObjectReference Property MQ305EndingMarkerUC_Aceles Auto Const mandatory
ObjectReference Property MQ305EndingMarkerAndreja Auto Const mandatory
ObjectReference Property MQ305EndingMarkerBarrett Auto Const mandatory
ObjectReference Property MQ305EndingMarkerSamCoe Auto Const mandatory
ObjectReference Property MQ305EndingMarkerSarahMorgan Auto Const mandatory
ReferenceAlias Property HomeShipArmillaryScreen Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerLeave(ObjectReference akActionRef)
  Actor PlayerREF = Game.GetPlayer()
  Quest myMQ305 = Self.GetOwningQuest()
  If (akActionRef == PlayerREF as ObjectReference) && myMQ305.GetStageDone(TalkedToUnityStage)
    MQ305_002_Unity_04.Stop()
    MQ305FinalSceneInt.SetValueInt(0)
    (myMQ305 as mq305script).MQ305EnableLayer.DisablePlayerControls(True, True, True, False, False, True, True, False, True, True, False)
    Game.FadeOutGame(True, False, 0.0, 1.0, True)
    Utility.Wait(1.0)
    Mq305EndingMarkerHunter.DisableNoWait(False)
    MQ305EndingMarkerEmissary.DisableNoWait(False)
    MQ305EndingMarkerNeither.DisableNoWait(False)
    MQ305EndingMarkerAndreja.DisableNoWait(False)
    MQ305EndingMarkerBarrett.DisableNoWait(False)
    MQ305EndingMarkerSamCoe.DisableNoWait(False)
    MQ305EndingMarkerSarahMorgan.DisableNoWait(False)
    MQ305EndingMarkerCF_SysDef.DisableNoWait(False)
    MQ305EndingMarkerCF_Delgado.DisableNoWait(False)
    MQ305EndingMarkerFSC_HopeDead.DisableNoWait(False)
    MQ305EndingMarkerFSC_HopeNotDead.DisableNoWait(False)
    MQ305EndingMarkerFSC_HopeLetGo.DisableNoWait(False)
    MQ305EndingMarkerRI_NoNeuroAmp.DisableNoWait(False)
    MQ305EndingMarkerRI_NoNeuroAmp_Masako.DisableNoWait(False)
    MQ305EndingMarkerRI_NoNeuroAmp_Ularu.DisableNoWait(False)
    MQ305EndingMarkerRI_NeuroAmp.DisableNoWait(False)
    MQ305EndingMarkerRI_NeuroAmp_Masako.DisableNoWait(False)
    MQ305EndingMarkerRI_NeuroAmp_Ularu.DisableNoWait(False)
    MQ305EndingMarkerUC_Aceles.DisableNoWait(False)
    MQ305EndingMarkerUC_Terrormorph.DisableNoWait(False)
    MQ305EndingMarkerConstellation.DisableNoWait(False)
    ObjectReference ArmillaryREF = Armillary.GetRef()
    (ArmillaryREF as armillaryscript).PackupArmillary(PlayerREF)
    ArmillaryREF.Disable(False)
    ObjectReference myShipCockpitEntrance = PlayerShipCockpitEntrance.GetRef()
    If myShipCockpitEntrance == None
      PlayerREF.moveto(LodgeStartMarker, 0.0, 0.0, 0.0, True, False)
    Else
      PlayerREF.moveto(myShipCockpitEntrance, 0.0, 0.0, 0.0, True, False)
      PlayerREF.WaitFor3DLoad()
      HomeShipArmillaryScreen.GetRef().PlayAnimation("Play02")
      PlayerShip.GetShipRef().SetGhost(False)
    EndIf
    If myMQ305.GetStageDone(LeftUnityStage) == False
      myMQ305.SetStage(LeftUnityStage)
    Else
      myMQ305.SetObjectiveDisplayed(EnterUnityObjective, False, False)
      myMQ305.SetObjectiveCompleted(LeaveUnityObjective, True)
      myMQ305.SetObjectiveCompleted(ReturnUnityObjective, False)
    EndIf
    (myMQ305 as mq305script).UnlockPlayerControlUnity()
  EndIf
EndEvent
