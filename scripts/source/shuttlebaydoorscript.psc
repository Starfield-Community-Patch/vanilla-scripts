ScriptName ShuttleBayDoorScript Extends ObjectReference
{ Script on the Shuttle Bay Doors. Handles opening and closing the doors in response to events from the ShuttleBayDoorManagerScript object. }

;-- Functions ---------------------------------------

Event OnLoad()
  shuttlebaydoormanagerscript myManager = Self.GetLinkedRef(None) as shuttlebaydoormanagerscript
  If myManager == None
    
  Else
    Self.RegisterForCustomEvent(myManager as ScriptObject, "shuttlebaydoormanagerscript_OpenShuttleBayDoorsEvent")
    Self.RegisterForCustomEvent(myManager as ScriptObject, "shuttlebaydoormanagerscript_CloseShuttleBayDoorsEvent")
  EndIf
EndEvent

Event ShuttleBayDoorManagerScript.OpenShuttleBayDoorsEvent(shuttlebaydoormanagerscript akSender, Var[] akArgs)
  Self.PlayAnimation("StateA_Play")
EndEvent

Event ShuttleBayDoorManagerScript.CloseShuttleBayDoorsEvent(shuttlebaydoormanagerscript akSender, Var[] akArgs)
  Self.PlayAnimation("StateB_Play")
EndEvent
