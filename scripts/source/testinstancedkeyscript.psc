ScriptName TestInstancedKeyScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Function AddKey()
  Game.GetPlayer().AddKeyIfNeeded(Self as ObjectReference)
EndFunction
