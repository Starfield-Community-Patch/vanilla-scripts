ScriptName TestGenericLoreTerminal Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property SQ_GenericLoreTerminalEvent Auto Const mandatory
{ Keyword to start the quest that handles this system }
Quest Property GenericLoreQuest Auto Const mandatory
{ Quest that handles this system }

;-- Functions ---------------------------------------

Event OnCellLoad()
  If GenericLoreQuest.IsRunning()
    GenericLoreQuest.Stop()
  EndIf
  SQ_GenericLoreTerminalEvent.SendStoryEvent(Self.GetCurrentLocation(), Self as ObjectReference, None, 0, 0)
EndEvent

Event OnUnload()
  GenericLoreQuest.Stop()
EndEvent
