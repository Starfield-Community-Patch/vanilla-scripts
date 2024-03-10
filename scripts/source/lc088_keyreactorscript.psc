ScriptName LC088_KeyReactorScript Extends ReactorFloorMidA01Script
{ Script for the Reactors in LC088_Key. }

;-- Variables ---------------------------------------
Int reactorID

;-- Properties --------------------------------------
Group AutofillProperties
  lc088_keyquestscript Property LC088_Key Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function RegisterForReactorEvent(Int newReactorID)
  reactorID = newReactorID
  Self.RegisterForCustomEvent(LC088_Key as ScriptObject, "lc088_keyquestscript_LC088ReactorStateChangeEvent")
EndFunction

Event LC088_KeyQuestScript.LC088ReactorStateChangeEvent(lc088_keyquestscript akSender, Var[] akArgs)
  Int eventReactorID = akArgs[0] as Int
  If eventReactorID == reactorID
    Self.SetReactorState(akArgs[1] as Int, True)
  EndIf
EndEvent
