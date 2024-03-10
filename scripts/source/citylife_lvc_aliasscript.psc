ScriptName CityLife_LVC_AliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property SceneCompleteStage = 200 Auto Const
{ When this stage is set, update this NPC }
ActorValue Property UC_NA_CL_SceneComplete Auto Const mandatory
{ Actor value used to tag these NPCs with their post scene packages }
Float Property MinEVPWait = 0.100000001 Auto Const
{ Minimum amount of wait time before eval'ing }
Float Property MaxEVPWait = 0.5 Auto Const
{ Max amount of wait time before eval'ing }
Bool Property DisablePostScene = True Auto Const
{ If TRUE, when SceneCompleteStage is set, this NPC will disable as soon as they unload the first time }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If auiStageID == SceneCompleteStage && akSender == Self.GetOwningQuest()
    Self.UnregisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
    Self.UpdateCLNPC()
  EndIf
EndEvent

Function UpdateCLNPC()
  Actor currAct = Self.GetActorRef()
  If currAct != None
    currAct.SetValue(UC_NA_CL_SceneComplete, 1.0)
    Float fRand = Utility.RandomFloat(MinEVPWait, MaxEVPWait)
    Utility.Wait(fRand)
    currAct.EvaluatePackage(False)
  EndIf
EndFunction

Event OnUnload()
  If DisablePostScene && Self.GetOwningQuest().GetStageDone(SceneCompleteStage)
    Self.GetRef().Disable(False)
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
