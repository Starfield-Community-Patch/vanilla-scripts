ScriptName GrantTradeTowerLobbyKeyScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Key Property TradeTowerLobbyKey Auto Const mandatory
Keyword Property PenthouseVisitorKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef is Actor
    Actor actorRef = akActionRef as Actor
    actorRef.AddItem(TradeTowerLobbyKey as Form, 1, False)
    actorRef.AddKeyword(PenthouseVisitorKeyword)
  EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  If akActionRef is Actor
    Actor actorRef = akActionRef as Actor
    Bool hasPenthouseVisitorKeyword = actorRef.HasKeyword(PenthouseVisitorKeyword)
    Int keyCount = actorRef.GetItemCount(None)
    If hasPenthouseVisitorKeyword && keyCount > 0
      actorRef.RemoveItem(TradeTowerLobbyKey as Form, 1, False, None)
      actorRef.RemoveKeyword(PenthouseVisitorKeyword)
    EndIf
  EndIf
EndEvent
