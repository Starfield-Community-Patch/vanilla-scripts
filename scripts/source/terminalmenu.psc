ScriptName TerminalMenu Extends Form Native hidden

;-- Functions ---------------------------------------

Function AddDynamicBodyTextItem(ObjectReference aTerminalRef, Int aiTemplateIndex, Int aiItemID, Form[] akTagReplacementForms) Native

Function AddDynamicMenuItem(ObjectReference aTerminalRef, Int aiTemplateIndex, Int aiItemID, Form[] akTagReplacementForms) Native

Function ClearDynamicBodyTextItems(ObjectReference aTerminalRef) Native

Function ClearDynamicMenuItems(ObjectReference aTerminalRef) Native

ObjectReference Function GetCurrentTerminalObjectRef() Global Native

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  ; Empty function
EndEvent

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  ; Empty function
EndEvent
