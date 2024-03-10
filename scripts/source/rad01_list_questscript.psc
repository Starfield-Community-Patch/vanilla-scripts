ScriptName Rad01_LIST_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group autofill
  Book Property Rad01_Pamphlet Auto Const mandatory
  GlobalVariable Property Rad01_PamphletCost Auto Const mandatory
EndGroup

Group Properties
  Int Property StageSurveyComplete = 190 Auto Const
  Int Property PamphletAmount = 5 Auto Const
  Int Property StagePlayerNeedsToScan = 100 Auto Const
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerPlanetSurveyComplete")
EndEvent

Function PurchasePamphlets()
  Game.GetPlayer().RemoveItem(Game.GetCredits() as Form, Rad01_PamphletCost.GetValueInt(), False, None)
  Game.GetPlayer().AddItem(Rad01_Pamphlet as Form, PamphletAmount, False)
EndFunction

Function SurveyCompleted()
  If Self.GetStageDone(StagePlayerNeedsToScan)
    Self.SetStage(StageSurveyComplete)
  EndIf
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
