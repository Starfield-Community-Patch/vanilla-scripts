ScriptName Gang03_Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property Gang03_HangoutsCleared Auto Const mandatory
ObjectReference Property Gang03_FinaleEntranceMarker Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory

;-- Functions ---------------------------------------

Int Function HangOutsCleared()
  Int nCleared = 0
  If Self.GetStageDone(400)
    nCleared += 1
  EndIf
  If Self.GetStageDone(500)
    nCleared += 1
  EndIf
  If Self.GetStageDone(600)
    nCleared += 1
  EndIf
  Gang03_HangoutsCleared.SetValue(nCleared as Float)
  Self.UpdateCurrentInstanceGlobal(Gang03_HangoutsCleared)
  Self.SetObjectiveDisplayed(700, True, True)
  If nCleared >= 3
    Self.SetStage(700)
  EndIf
EndFunction

Function MoveStriker(Actor aStriker)
  ObjectReference oTarg = Gang03_FinaleEntranceMarker
  aStriker.Disable(True)
  aStriker.MoveTo(oTarg, 0.0, 0.0, 0.0, True, False)
  aStriker.RemoveFromFaction(PlayerFaction)
  aStriker.Enable(True)
EndFunction
