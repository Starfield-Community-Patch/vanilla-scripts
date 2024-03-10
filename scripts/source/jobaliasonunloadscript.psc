ScriptName JobAliasOnUnloadScript Extends ReferenceAlias

;-- Functions ---------------------------------------

Event OnUnload()
  If Self != None
    Self.Clear()
  EndIf
EndEvent
