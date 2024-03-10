ScriptName HavokCorpseOnLoad Extends Actor

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property DoOnce = False Auto

;-- Functions ---------------------------------------

Event OnLoad()
  If DoOnce == False
    DoOnce = True
    Self.ApplyHavokImpulse(1.0, 1.0, 1.0, 1.0)
  EndIf
EndEvent
