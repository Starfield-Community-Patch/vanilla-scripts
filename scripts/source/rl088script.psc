ScriptName RL088Script Extends Quest

;-- Variables ---------------------------------------
Int EngineinstanceID
Bool bGravityActive = True
Int gravTimerID = 10
Bool tutorialMSG

;-- Properties --------------------------------------
Cell Property RL088ArmoredStarship Auto Const mandatory
ReferenceAlias Property LightsEnableMarker Auto Const
ReferenceAlias Property EngineRotationHelper Auto Const
wwiseevent Property WwiseEvent_QST_RL088ArmoredShip_Power_Off Auto Const
wwiseevent Property WwiseEvent_QST_RL088ArmoredShip_Power_On Auto Const
wwiseevent Property WwiseEvent_QST_RL088ArmoredShip_Power_LightsOn Auto Const
wwiseevent Property WwiseEvent_AMB_RL088_SpinningMachine Auto Const
Quest Property MQ_TutorialQuest Auto Const
Explosion Property RL088_NoVFXExplosion Auto Const
ObjectReference Property ExplosionXmarker Auto

;-- Functions ---------------------------------------

Function StartGravityCountdown(Int minNum, Int maxNum)
  Self.StartTimer(Utility.RandomInt(minNum, maxNum) as Float, 10)
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == gravTimerID
    If Game.GetPlayer().GetParentCell() == RL088ArmoredStarship
      If bGravityActive
        Self.DisableGravityAutoDuration()
      Else
        Self.EnableGravityAutoDuration()
      EndIf
    EndIf
  EndIf
EndEvent

Function EnableGravityAutoDuration()
  bGravityActive = True
  WwiseEvent_QST_RL088ArmoredShip_Power_On.Play(Game.GetPlayer() as ObjectReference, None, None)
  Game.ShakeCamera(None, 0.200000003, 0.0)
  Utility.Wait(2.0)
  Game.ShakeCamera(None, 0.5, 0.0)
  WwiseEvent_QST_RL088ArmoredShip_Power_LightsOn.Play(Game.GetPlayer() as ObjectReference, None, None)
  LightsEnableMarker.getref().enable(False)
  Utility.Wait(0.300000012)
  LightsEnableMarker.getref().disable(False)
  Utility.Wait(0.300000012)
  LightsEnableMarker.getref().enable(False)
  RL088ArmoredStarship.SetGravityScale(1.0)
  Self.SpeedRotationHelper()
  Self.StartGravityCountdown(9, 13)
EndFunction

Function DisableGravityAutoDuration()
  bGravityActive = False
  WwiseEvent_QST_RL088ArmoredShip_Power_Off.Play(Game.GetPlayer() as ObjectReference, None, None)
  Game.ShakeCamera(None, 0.200000003, 0.0)
  Utility.Wait(2.0)
  Game.ShakeCamera(None, 0.5, 0.0)
  WwiseEvent_QST_RL088ArmoredShip_Power_LightsOn.Play(Game.GetPlayer() as ObjectReference, None, None)
  LightsEnableMarker.getref().disable(False)
  Utility.Wait(0.300000012)
  LightsEnableMarker.getref().enable(False)
  Utility.Wait(0.300000012)
  LightsEnableMarker.getref().disable(False)
  RL088ArmoredStarship.SetGravityScale(0.0)
  ExplosionXmarker.PlaceAtMe(RL088_NoVFXExplosion as Form, 1, False, False, True, None, None, True)
  If tutorialMSG == False
    MQ_TutorialQuest.SetStage(10)
  EndIf
  tutorialMSG = True
  Self.SlowRotationHelper()
  Self.StartGravityCountdown(12, 15)
EndFunction

Function SpeedRotationHelper()
  EngineRotationHelper.getref().SetAnimationVariableFloat("Speed", 0.200000003)
  EngineRotationHelper.getref().PlayAnimation("RotateCW_Loop")
  EngineinstanceID = WwiseEvent_AMB_RL088_SpinningMachine.Play(EngineRotationHelper.getref(), None, None)
EndFunction

Function SlowRotationHelper()
  EngineRotationHelper.getref().SetAnimationVariableFloat("Speed", 0.0)
  EngineRotationHelper.getref().PlayAnimation("RotateCW_Loop")
  wwiseevent.StopInstance(EngineinstanceID)
EndFunction
