ScriptName TerminalScript Extends ObjectReference
{ script for all terminals that need to animate }

;-- Variables ---------------------------------------
Float checkStateTimeEnter = 0.100000001 Const
Float checkStateTimeExit = 2.0 Const
Int checkStateTimerID = 1 Const
ObjectReference myTrigger
Bool requiresPower = False

;-- Properties --------------------------------------
Float Property AnimateDistanceOpen = 3.0 Auto Const
{ used for the "animate open" distance check if no trigger is linked }
Float Property AnimateDistanceClose = 6.0 Auto Const
{ used for the "animate close" distance check if no trigger is linked }
String Property myOpenAnimation = "play01" Auto Const
String Property myCloseAnimation = "play02" Auto Const
ActorValue Property PowerCanBePowered Auto Const
{ to check for terminals that require power (e.g. outpost) }

;-- Functions ---------------------------------------

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
  ; Empty function
EndEvent

Event ObjectReference.OnTriggerLeave(ObjectReference akSource, ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnPowerOn(ObjectReference akPowerGenerator)
  If requiresPower
    Self.StartTimer(checkStateTimeEnter, checkStateTimerID)
  EndIf
EndEvent

Event OnPowerOff()
  If requiresPower
    Self.StartTimer(checkStateTimeEnter, checkStateTimerID)
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == checkStateTimerID
    Self.CheckOpenState()
  EndIf
EndEvent

Function CheckOpenState()
  Bool checkSucceeded = True
  If Self.Is3dLoaded()
    If requiresPower && Self.IsPowered() == False
      If Self.IsFurnitureInUse(False) == False && Self.GetOpenState() < 3
        checkSucceeded = Self.PlayAnimationAndWait(myCloseAnimation, "done")
      EndIf
    ElseIf Self.IsFurnitureInUse(False) && Self.GetOpenState() > 2
      checkSucceeded = Self.PlayAnimationAndWait(myOpenAnimation, "done")
    ElseIf myTrigger
      If myTrigger.IsInTrigger(Game.GetPlayer() as ObjectReference) && Self.GetOpenState() > 2
        checkSucceeded = Self.PlayAnimationAndWait(myOpenAnimation, "done")
      ElseIf Self.IsFurnitureInUse(False) == False && Self.GetOpenState() < 3
        checkSucceeded = Self.PlayAnimationAndWait(myCloseAnimation, "done")
      EndIf
    Else
      ObjectReference player = Game.GetPlayer() as ObjectReference
      If Self.GetDistance(player) < AnimateDistanceClose && Self.GetOpenState() > 2
        checkSucceeded = Self.PlayAnimationAndWait(myOpenAnimation, "done")
      ElseIf Self.GetDistance(player) >= AnimateDistanceClose
        If Self.IsFurnitureInUse(False) == False && Self.GetOpenState() < 3
          checkSucceeded = Self.PlayAnimationAndWait(myCloseAnimation, "done")
        EndIf
      EndIf
    EndIf
    If checkSucceeded == False && Self.Is3dLoaded()
      Self.StartTimer(checkStateTimeEnter, checkStateTimerID)
    EndIf
  EndIf
EndFunction

Event OnActivate(ObjectReference akActionRef)
  If akActionRef != Game.GetPlayer() as ObjectReference
    Self.CheckOpenState()
  ElseIf requiresPower
    If Self.IsPowered() && Self.IsActivationBlocked()
      Self.Activate(akActionRef, False)
      Self.IncrementAchievement()
    EndIf
  Else
    Self.IncrementAchievement()
  EndIf
EndEvent

Function IncrementAchievement()
  sq_parentscript SQ_Parent = Game.GetFormFromFile(461100, "Starfield.esm") as sq_parentscript
  If SQ_Parent
    SQ_Parent.IncrementComputersAchievement(Self as ObjectReference)
  EndIf
EndFunction

;-- State -------------------------------------------
State loaded

  Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
    Self.StartTimer(checkStateTimeEnter, checkStateTimerID)
  EndEvent

  Event ObjectReference.OnTriggerLeave(ObjectReference akSource, ObjectReference akActionRef)
    Self.StartTimer(checkStateTimeExit, checkStateTimerID)
  EndEvent

  Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
    Self.StartTimer(checkStateTimeExit, checkStateTimerID)
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, AnimateDistanceOpen, 0)
  EndEvent

  Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
    Self.StartTimer(checkStateTimeEnter, checkStateTimerID)
    Self.RegisterForDistanceGreaterThanEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, AnimateDistanceClose, 0)
  EndEvent

  Event OnExitFurniture(ObjectReference akActionRef)
    If akActionRef != Game.GetPlayer() as ObjectReference
      If myTrigger
        Self.CheckOpenState()
      Else
        Self.RegisterForDistanceGreaterThanEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, AnimateDistanceClose, 0)
      EndIf
    EndIf
  EndEvent

  Event OnUnload()
    Self.gotoState("unloaded")
    Self.CancelTimer(checkStateTimerID)
    If myTrigger
      Self.UnregisterForRemoteEvent(myTrigger as ScriptObject, "OnTriggerEnter")
      Self.UnregisterForRemoteEvent(myTrigger as ScriptObject, "OnTriggerLeave")
    Else
      Self.UnregisterForDistanceEvents(Self as ScriptObject, Game.GetPlayer() as ScriptObject, -1)
    EndIf
  EndEvent
EndState

;-- State -------------------------------------------
Auto State unloaded

  Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
    ; Empty function
  EndEvent

  Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
    ; Empty function
  EndEvent

  Event OnLoad()
    Self.gotoState("loaded")
    myTrigger = Self.GetLinkedRef(None)
    If myTrigger
      Self.RegisterForRemoteEvent(myTrigger as ScriptObject, "OnTriggerEnter")
      Self.RegisterForRemoteEvent(myTrigger as ScriptObject, "OnTriggerLeave")
    Else
      Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, AnimateDistanceOpen, 0)
    EndIf
    If PowerCanBePowered as Bool && Self.GetValue(PowerCanBePowered) > 0.0
      requiresPower = True
      Self.BlockActivation(True, False)
    EndIf
    Self.CheckOpenState()
  EndEvent
EndState
