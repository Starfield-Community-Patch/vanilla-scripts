ScriptName UC01_PowerboxRefScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property TargetDestructionState = 1 Auto Const
{ If the object has switched to this state, disable its linked ref }
Keyword Property UC01_LaserGrid_SecondaryToggle_Keyword Auto Const mandatory
{ Keyword for if this powerbox has a secondary toggle }
Bool Property ChainDisable = False Auto Const
{ If true, this object is attached to a chain of markers and should turn all of them off }
Int Property StageToSet = -1 Auto Const
{ Is there a stage to set on UC01 once this change has been triggered? }
Int Property ShutDownStage = 401 Auto Const
{ If this stage has been set, don't set the "StageToSet" when this blows }
Quest Property UC01 Auto Const mandatory
{ UC01 quest object }

;-- Functions ---------------------------------------

Event OnDestructionStageChanged(Int aiOldStage, Int aiCurrentStage)
  If aiCurrentStage == TargetDestructionState
    If ChainDisable
      ObjectReference currLink = Self.GetLinkedRef(None)
      currLink.Disable(False)
      currLink.DisableLinkChain(None, False)
    Else
      Self.GetLinkedRef(None).Disable(False)
      ObjectReference SecondaryLink = Self.GetLinkedRef(UC01_LaserGrid_SecondaryToggle_Keyword)
      If SecondaryLink != None
        SecondaryLink.Disable(False)
      EndIf
    EndIf
    If StageToSet >= 0 && !UC01.GetStageDone(ShutDownStage)
      UC01.SetStage(StageToSet)
    EndIf
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
