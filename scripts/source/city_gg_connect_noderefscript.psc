ScriptName City_GG_Connect_NodeRefScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property City_GG_Connect_ActiveScanner_Keyword Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  If !Self.HasKeyword(City_GG_Connect_ActiveScanner_Keyword)
    Self.BlockActivation(True, True)
  EndIf
EndEvent
