ScriptName MQ207Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
inputenablelayer Property MQ207EnableLayer Auto hidden
ReferenceAlias Property Hunter Auto Const mandatory
VoiceType Property NPCMKeeperAquilus Auto Const mandatory
VoiceType Property StarbornNPCMHunter Auto Const mandatory
Idle Property Stage1 Auto Const mandatory
Idle Property Stage2 Auto Const mandatory
Idle Property Stage3 Auto Const mandatory
Idle Property Stage4 Auto Const mandatory
wwiseevent Property WwiseEvent_QST_MQ207_StarbornHelmetTransition Auto Const mandatory
Actor[] Property FollowersToldtoWait Auto

;-- Functions ---------------------------------------

Function SwitchToAquilus()
  Actor HunterREF = Hunter.GetActorRef()
  HunterREF.SetOverrideVoiceType(NPCMKeeperAquilus)
  HunterREF.PlayIdle(Stage3)
  WwiseEvent_QST_MQ207_StarbornHelmetTransition.Play(HunterREF as ObjectReference, None, None)
EndFunction

Function SwitchToHunter()
  Actor HunterREF = Hunter.GetActorRef()
  HunterREF.SetOverrideVoiceType(StarbornNPCMHunter)
  HunterREF.PlayIdle(Stage4)
  WwiseEvent_QST_MQ207_StarbornHelmetTransition.Play(HunterREF as ObjectReference, None, None)
EndFunction
