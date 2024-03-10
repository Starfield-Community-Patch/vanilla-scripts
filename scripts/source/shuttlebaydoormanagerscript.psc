ScriptName ShuttleBayDoorManagerScript Extends ObjectReference
{ Script on the Shuttle Bay Door Manager dummy object. Manages the system of doors. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AudioProperties
  wwiseevent Property DRS_IndBayDoorShield01_Open Auto Const mandatory
  wwiseevent Property DRS_IndBayDoorShield01_Close Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function OpenShuttleBayDoors()
  Self.SendCustomEvent("shuttlebaydoormanagerscript_OpenShuttleBayDoorsEvent", None)
  DRS_IndBayDoorShield01_Open.Play(Self as ObjectReference, None, None)
EndFunction

Function CloseShuttleBayDoors()
  Self.SendCustomEvent("shuttlebaydoormanagerscript_CloseShuttleBayDoorsEvent", None)
  DRS_IndBayDoorShield01_Close.Play(Self as ObjectReference, None, None)
EndFunction
