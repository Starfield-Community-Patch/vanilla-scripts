ScriptName TestOpenCharGenScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Game.ShowRaceMenu(None, 0, None, None, None)
  Self.RegisterForMenuOpenCloseEvent("ChargenMenu")
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If asMenuName == "ChargenMenu"
    If abOpening == False
      Self.UnRegisterForMenuOpenCloseEvent("ChargenMenu")
      Game.FadeOutGame(False, True, 0.0, 0.100000001, False)
    EndIf
  EndIf
EndEvent
