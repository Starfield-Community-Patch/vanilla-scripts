ScriptName DefaultCounter Extends objectReference default
{ A simple counter. Place on an object, then increment with another script (such as defaultCounterIncrementOnDeath). When the target value is reached (or, optionally, exceeded), the counter:
 - Activates itself.
 - Optionally, sets a quest stage.
 - Optionally, performs a specified action on a specified linkedref. }

;-- Variables ---------------------------------------
Int count
Bool hasHitThreshold

;-- Properties --------------------------------------
Group Required_Properties
  Int Property TargetValue Auto Const mandatory
  { The first value at which the counter will trigger. }
EndGroup

Group Optional_Properties
  Quest Property QuestToSet Auto Const
  { Quest containing the Stage to set }
  Int Property StageToSet = -1 Auto Const
  { Stage to Set }
  Keyword Property LinkedRefKeyword Auto Const
  { The keyword for the LinkedRef to perform the action on. Defaults to the unnamed linkedref. }
  Int Property LinkedRefAction Auto Const
  { Determines what action to perform on the object's linkedref.
	0: Activate (default)
	1: Toggle Enable/Disable
	2: Enable Only
	3: Disable Only }
  Bool Property AllowDecrementing Auto Const
  { (Default: false) If true, we Decrementing via calls to "Decrement()", undoing the specified action (where possible) if the value falls below the target. }
EndGroup


;-- Functions ---------------------------------------

Function Increment()
  ; Empty function
EndFunction

Function Decrement()
  ; Empty function
EndFunction

;-- State -------------------------------------------
Auto State AllowCounting

  Function Decrement()
    If AllowDecrementing
      count -= 1
      If count <= 0
        count = 0
      EndIf
      If count < TargetValue && hasHitThreshold
        hasHitThreshold = False
        Self.Activate(Self as ObjectReference, False)
        If LinkedRefAction == 0
          Self.GetLinkedRef(LinkedRefKeyword).Activate(Self as ObjectReference, False)
        ElseIf LinkedRefAction == 1
          If Self.GetLinkedRef(LinkedRefKeyword).IsDisabled()
            Self.GetLinkedRef(LinkedRefKeyword).Enable(False)
          Else
            Self.GetLinkedRef(LinkedRefKeyword).Disable(False)
          EndIf
        ElseIf LinkedRefAction == 2
          Self.GetLinkedRef(LinkedRefKeyword).Disable(False)
        ElseIf LinkedRefAction == 3
          Self.GetLinkedRef(LinkedRefKeyword).Enable(False)
        EndIf
      EndIf
    EndIf
  EndFunction

  Function Increment()
    count += 1
    If count >= TargetValue
      hasHitThreshold = True
      If !AllowDecrementing
        Self.GoToState("StopCounting")
      EndIf
      Self.Activate(Self as ObjectReference, False)
      If QuestToSet != None
        QuestToSet.SetStage(StageToSet)
      EndIf
      If LinkedRefAction == 0
        Self.GetLinkedRef(LinkedRefKeyword).Activate(Self as ObjectReference, False)
      ElseIf LinkedRefAction == 1
        If Self.GetLinkedRef(LinkedRefKeyword).IsDisabled()
          Self.GetLinkedRef(LinkedRefKeyword).Enable(False)
        Else
          Self.GetLinkedRef(LinkedRefKeyword).Disable(False)
        EndIf
      ElseIf LinkedRefAction == 2
        Self.GetLinkedRef(LinkedRefKeyword).Enable(False)
      ElseIf LinkedRefAction == 3
        Self.GetLinkedRef(LinkedRefKeyword).Disable(False)
      EndIf
    EndIf
  EndFunction
EndState

;-- State -------------------------------------------
State StopCounting
EndState
