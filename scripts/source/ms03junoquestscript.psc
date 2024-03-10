ScriptName MS03JunoQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  ReferenceAlias Property JunoMoveToMarker Auto Const mandatory
  ReferenceAlias Property JunoShip Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property RyujinShip Auto Const mandatory
  RefCollectionAlias Property EclipticShips Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.MoveJuno()
  Self.StartCombat()
EndEvent

Function MoveJuno()
  JunoShip.GetReference().MoveTo(JunoMoveToMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
  RyujinShip.GetReference().Enable(False)
EndFunction

Function StartCombat()
  spaceshipreference[] enemyShips = EclipticShips.GetArray() as spaceshipreference[]
  Int I = 0
  While I < enemyShips.Length
    spaceshipreference currentShipRef = enemyShips[I]
    currentShipRef.StartCombat(Game.GetPlayerHomeSpaceShip(), False)
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
