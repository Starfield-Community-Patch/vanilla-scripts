ScriptName ShipLiftActivator Extends ObjectReference conditional
{ Handles raising and lowering of ship interior lift }

;-- Variables ---------------------------------------
ObjectReference player

;-- Properties --------------------------------------
Group AnimationName_Properties
  String Property raiseAnim = "Stage2" Auto
  { Animation to play when raising }
  String Property lowerAnim = "Stage1" Auto
  { Animation to play when lowering }
  String Property raiseEvent = "TransitionComplete" Auto
  { Raise event name - waits for this event before considering itself "raised" }
  String Property lowerEvent = "TransitionComplete" Auto
  { Lower event name - waits for this event before considering itself "lowered" }
  String Property startRaiseAnim = "Stage2" Auto
  { OnLoad calls this if the object starts in the raised state }
EndGroup

Group Optional_Properties
  Bool Property isRaised = False Auto conditional
  { Set to TRUE to start raised. }
  Bool Property doOnce = False Auto
  { Set to TRUE to raise/lower on first trigger only. }
  Bool Property shouldSetDefaultState = True Auto Const
  { Should this use SetDefaultState? Set to False only for Activators with identical raise/lower events. }
  Bool Property AllowInterrupt = False Auto
  { Allow interrupts while animation? Default: FALSE }
  Bool Property InvertCollision = False Auto
  { Typically this will be False (DEFAULT).  The References LinkRef'd Chained with the TwoStateCollisionKeyword will typically be 
	Disabled onOpen, and Enabled on Close.  If you want that functionality inverted set this to TRUE }
EndGroup

Group Autofill_Properties
  Keyword Property TwoStateCollisionKeyword Auto
  { Keword to link to the collision you want to enable/disable based on this activators raised/lowered state. }
EndGroup

Bool Property isAnimating = False Auto conditional hidden
{ Is the ramp currently animating from one state to another? }
Bool Property shouldRaiseNext = True Auto conditional hidden
{ Used for SetRaiseNoWait. Should we raise when the timer fires? }
Int Property myState = 1 Auto conditional hidden
{ true when static or animating
 0 == raise or raising
 1 == lower or lowering }

;-- Functions ---------------------------------------

Event OnLoad()
  player = Game.GetPlayer() as ObjectReference
  If shouldSetDefaultState
    Self.SetDefaultState()
  EndIf
EndEvent

Event OnReset()
  If shouldSetDefaultState
    Self.SetDefaultState()
  EndIf
EndEvent

Function SetDefaultState()
  If isRaised
    Self.playAnimationandWait(startRaiseAnim, raiseEvent)
    If InvertCollision == False
      Self.DisableLinkChain(TwoStateCollisionKeyword, False)
    Else
      Self.EnableLinkChain(TwoStateCollisionKeyword, False)
    EndIf
    myState = 0
  Else
    Self.playAnimationandWait(lowerAnim, lowerEvent)
    If InvertCollision == False
      Self.EnableLinkChain(TwoStateCollisionKeyword, False)
    Else
      Self.DisableLinkChain(TwoStateCollisionKeyword, False)
    EndIf
    myState = 1
  EndIf
EndFunction

Function SetRaiseNoWait(Bool adRaise)
  shouldRaiseNext = adRaise
  Self.StartTimer(0.0, 0)
EndFunction

Event OnTimer(Int timerID)
  Self.SetRaise(shouldRaiseNext)
EndEvent

Function SetRaise(Bool adRaise)
  While Self.getState() == "busy"
    Utility.wait(1.0)
  EndWhile
  isAnimating = True
  Self.gotoState("busy")
  If adRaise
    Self.playAnimationandWait(raiseAnim, raiseEvent)
    isRaised = True
  Else
    Self.playAnimationandWait(lowerAnim, lowerEvent)
    isRaised = False
  EndIf
  Self.gotoState("waiting")
  isAnimating = False
EndFunction

;-- State -------------------------------------------
State busy

  Event onActivate(ObjectReference triggerRef)
    If AllowInterrupt == True
      Self.SetRaise(!isRaised)
    EndIf
  EndEvent
EndState

;-- State -------------------------------------------
State done

  Event onActivate(ObjectReference triggerRef)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State waiting

  Event onActivate(ObjectReference triggerRef)
    If triggerRef == player
      Self.SetRaise(!isRaised)
      If doOnce
        Self.gotoState("done")
      EndIf
    EndIf
  EndEvent
EndState
