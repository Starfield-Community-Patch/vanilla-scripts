ScriptName DefaultToggleLinkRefChainOnActivate Extends ObjectReference default
{ When this reference is activated, all LinkedRefs will toggle between OPEN or CLOSED. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Optional_Properties
  Bool Property DoOnce = False Auto Const
  { If you only want this to be activate once set to TRUE.  DEFAULT = FALSE }
  Bool Property CloseOrOpenRef = True Auto Const
  { If you also want this to OPEN/CLOSE all linked refs, set to TRUE.  DEFAULT = TRUE }
  Keyword Property LinkedRefKeyword Auto Const
  { The Keyword of the LinkedRef you want to activate when this activated. }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log. }
EndGroup


;-- Functions ---------------------------------------

Function ToggleLinkedRefChain(ObjectReference akActionRef, Keyword LinkedRefKeyword)
  Int count = 0
  Int countmax = 0
  If LinkedRefKeyword != None
    countmax = Self.CountLinkedRefChain(LinkedRefKeyword, 100)
  Else
    countmax = Self.CountLinkedRefChain(None, 100)
  EndIf
  While count <= countmax
    If LinkedRefKeyword != None
      count += 1
      Self.CloseOrOpen(count, akActionRef, LinkedRefKeyword)
    Else
      count += 1
      Self.CloseOrOpen(count, akActionRef, None)
    EndIf
  EndWhile
EndFunction

Function CloseOrOpen(Int count, ObjectReference akActionRef, Keyword LinkedRefKeyword)
  If CloseOrOpenRef
    Int openstate = Self.GetNthLinkedRef(count, None).GetOpenState()
    If openstate == 1 || openstate == 2
      If LinkedRefKeyword != None
        Self.GetNthLinkedRef(count, LinkedRefKeyword).SetOpen(False)
      Else
        Self.GetNthLinkedRef(count, None).SetOpen(False)
      EndIf
    ElseIf openstate == 3 || openstate == 4
      If LinkedRefKeyword != None
        Self.GetNthLinkedRef(count, LinkedRefKeyword).SetOpen(True)
      Else
        Self.GetNthLinkedRef(count, None).SetOpen(True)
      EndIf
    EndIf
  EndIf
EndFunction

;-- State -------------------------------------------
State PostActivation
EndState

;-- State -------------------------------------------
Auto State PreActivation

  Event OnActivate(ObjectReference akActionRef)
    If LinkedRefKeyword != None
      Self.ToggleLinkedRefChain(akActionRef, LinkedRefKeyword)
    Else
      Self.ToggleLinkedRefChain(akActionRef, None)
    EndIf
    If DoOnce
      Self.gotoState("PostActivation")
    EndIf
  EndEvent
EndState
