ScriptName RL036MusicControl Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property RL036_EnableMusic Auto Const
Keyword Property LinkedRefKeywordMusic Auto Const
Keyword Property LinkedRefKeywordEnemies Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If Self.GetLinkedRef(LinkedRefKeywordEnemies).IsDisabled()
    Self.GetLinkedRef(LinkedRefKeywordEnemies).Enable(False)
  EndIf
  If Self.GetLinkedRef(LinkedRefKeywordMusic).IsDisabled()
    Self.GetLinkedRef(LinkedRefKeywordMusic).Enable(False)
  Else
    Self.GetLinkedRef(LinkedRefKeywordMusic).Disable(False)
  EndIf
EndEvent
