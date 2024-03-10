ScriptName DefaultMoveToEditorLocationOnLoad Extends ObjectReference Const default
{ Script that will move this reference to it's editor location any time it loads. }

;-- Functions ---------------------------------------

Event OnLoad()
  Self.MoveToMyEditorLocation()
EndEvent
