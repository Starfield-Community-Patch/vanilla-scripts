ScriptName SQ_CaptiveScript Extends Quest
{ sends the CaptiveSetFree event for DefaultCaptiveXXX scripts to respond to. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  affinityevent Property SQ_Captive_Freed Auto Const mandatory
  affinityevent Property SQ_Wounded_Actor_Healed Auto Const mandatory
  sq_followersscript Property SQ_Followers Auto Const mandatory
  ReferenceAlias Property PrimaryActor Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function SendCaptiveSetFree(Actor captive, Bool playerIsLiberator, Bool showInventory)
  Var[] akArgs = new Var[3]
  akArgs[0] = captive as Var
  akArgs[1] = playerIsLiberator as Var
  akArgs[2] = showInventory as Var
  Self.SendCustomEvent("sq_captivescript_CaptiveSetFree", akArgs)
  SQ_Captive_Freed.Send(captive as ObjectReference)
EndFunction

Function SendWoundedActorHealed(Actor woundedActor, Bool playerIsHealer)
  Var[] akArgs = new Var[3]
  akArgs[0] = woundedActor as Var
  akArgs[1] = playerIsHealer as Var
  Self.SendCustomEvent("sq_captivescript_WoundedActorHealed", akArgs)
  SQ_Wounded_Actor_Healed.Send(woundedActor as ObjectReference)
EndFunction

Function CaptiveFollowerWaitSceneEnded()
  Actor primaryActorRef = PrimaryActor.GetActorReference()
  SQ_Followers.CommandWait(primaryActorRef, None)
EndFunction

Function CaptiveFollowerFollowSceneEnded()
  Actor primaryActorRef = PrimaryActor.GetActorReference()
  SQ_Followers.CommandFollow(primaryActorRef)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
