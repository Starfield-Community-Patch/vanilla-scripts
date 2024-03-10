ScriptName SQ_Followers_ActiveFollowersScript Extends RefCollectionAlias
{ Script attached to ActiveFollowers refcollection alias.
Currently it is managing the COM_SandboxDistancePollSuccessful which is used to turn on/off the sandboxing while player is loitering }

;-- Variables ---------------------------------------
Int PollSuccessCount
Float PollSuccess_Distance = 5.0 Const
Int PollSuccessesNeeded = 3 Const
Float Timer_Dur_DistancePoll = 10.0 Const
Int Timer_ID_DistancePoll = 1 Const
Actor[] activeFollowers
Bool activeFollowersArrayLock
Int iPollSuccess = 1 Const
Int iPollUnsetOrNotYetSuccess = 0 Const

;-- Properties --------------------------------------
GlobalVariable Property COM_SandboxDistancePollSuccessful Auto Const mandatory
{ Used to conditionalize sandbox package }

;-- Functions ---------------------------------------

Event OnPackageChange(ObjectReference akSenderRef, Package akOldPackage)
  ; Empty function
EndEvent

Event OnPackageEnd(ObjectReference akSenderRef, Package akOldPackage)
  ; Empty function
EndEvent

Event OnPackageStart(ObjectReference akSenderRef, Package akNewPackage)
  ; Empty function
EndEvent

Event OnAliasInit()
  Actor PlayerRef = Game.GetPlayer()
  Self.RegisterForRemoteEvent(PlayerRef as ScriptObject, "OnPlayerLoiteringBegin")
  Self.RegisterForRemoteEvent(PlayerRef as ScriptObject, "OnPlayerLoiteringEnd")
  activeFollowers = Self.GetArray() as Actor[]
EndEvent

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  While activeFollowersArrayLock
    Utility.Wait(0.100000001)
  EndWhile
  activeFollowersArrayLock = True
  activeFollowers = Self.GetArray() as Actor[]
  activeFollowersArrayLock = False
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == Timer_ID_DistancePoll
    Bool shouldKeepPolling = Self.KeepPolling()
    If shouldKeepPolling
      Self.StartTimer(Timer_Dur_DistancePoll, Timer_ID_DistancePoll)
    Else
      COM_SandboxDistancePollSuccessful.SetValue(iPollSuccess as Float)
      Self.EvaluatePackageForAll()
    EndIf
  EndIf
EndEvent

Event Actor.OnPlayerLoiteringBegin(Actor akSenderRef)
  Self.StartTimer(Timer_Dur_DistancePoll, Timer_ID_DistancePoll)
  Self.EvaluatePackageForAll()
EndEvent

Event Actor.OnPlayerLoiteringEnd(Actor akSenderRef)
  Self.CancelTimer(Timer_ID_DistancePoll)
  PollSuccessCount = 0
  COM_SandboxDistancePollSuccessful.SetValue(iPollUnsetOrNotYetSuccess as Float)
  Self.EvaluatePackageForAll()
EndEvent

Bool Function KeepPolling()
  While activeFollowersArrayLock
    Utility.Wait(0.100000001)
  EndWhile
  activeFollowersArrayLock = True
  Actor PlayerRef = Game.GetPlayer()
  Bool returnVal = True
  Int I = 0
  While I < activeFollowers.Length && returnVal == True
    ObjectReference nearbyFollower = None
    If activeFollowers[I].GetDistance(PlayerRef as ObjectReference) <= PollSuccess_Distance
      PollSuccessCount += 1
      If PollSuccessCount >= PollSuccessesNeeded
        PollSuccessCount = 0
        returnVal = False
      EndIf
    EndIf
    I += 1
  EndWhile
  activeFollowersArrayLock = False
  Return returnVal
EndFunction

Function EvaluatePackageForAll()
  While activeFollowersArrayLock
    Utility.Wait(0.100000001)
  EndWhile
  activeFollowersArrayLock = True
  Int I = 0
  While I < activeFollowers.Length
    activeFollowers[I].EvaluatePackage(False)
    I += 1
  EndWhile
  activeFollowersArrayLock = False
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
