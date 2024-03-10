ScriptName Rad01_MoveRefsQuestScript Extends Quest

;-- Structs -----------------------------------------
Struct EnableStateDatum
  ReferenceAlias AliasToSetEnableState
  Bool ShouldBeEnabled
EndStruct

Struct ForceAliasDatum
  Alias SourceAlias
  Alias TargetAlias
EndStruct

Struct MoveToDatum
  ReferenceAlias AliasToMove
  ReferenceAlias AliasToMoveTo
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
rad01_moverefsquestscript:forcealiasdatum[] Property ForceAliasData Auto Const mandatory
rad01_moverefsquestscript:movetodatum[] Property MoveToData Auto Const mandatory
rad01_moverefsquestscript:enablestatedatum[] Property EnableStateData Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.ForceAliases()
  Self.MoveAliases()
  Self.EnableDisableAliases()
EndEvent

Function ForceAliases()
  Int I = 0
  While I < ForceAliasData.Length
    rad01_moverefsquestscript:forcealiasdatum currentDatum = ForceAliasData[I]
    Bool copied = currentDatum.SourceAlias.CopyIntoAlias(currentDatum.TargetAlias, True, True)
    If copied == False
      
    EndIf
    I += 1
  EndWhile
EndFunction

Function MoveAliases()
  Int I = 0
  I = 0
  While I < MoveToData.Length
    rad01_moverefsquestscript:movetodatum currentDatum = MoveToData[I]
    ObjectReference refToMove = currentDatum.AliasToMove.GetReference()
    ObjectReference refToMoveTo = currentDatum.AliasToMoveTo.GetReference()
    If refToMove as Bool && refToMoveTo as Bool
      refToMove.MoveTo(refToMoveTo, 0.0, 0.0, 0.0, True, False)
    EndIf
    Actor ActorToMove = refToMove as Actor
    If ActorToMove
      If refToMoveTo.GetBaseObject() is Furniture
        ActorToMove.SnapIntoInteraction(refToMoveTo)
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

Function EnableDisableAliases()
  Int I = 0
  While I < EnableStateData.Length
    rad01_moverefsquestscript:enablestatedatum currentDatum = EnableStateData[I]
    If currentDatum.ShouldBeEnabled
      currentDatum.AliasToSetEnableState.TryToEnableNoWait()
    Else
      currentDatum.AliasToSetEnableState.TryToDisableNoWait()
    EndIf
    I += 1
  EndWhile
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
