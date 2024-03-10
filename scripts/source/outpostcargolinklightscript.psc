ScriptName OutpostCargoLinkLightScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property OutpostCargoLinkLightsKeyword Auto Const mandatory
{ used to get my outpost cargo link }
ActorValue Property OutpostCargoLinkAnimState Auto Const mandatory
{ actor value to set on myself for code to use as default ship carry weight }

;-- Functions ---------------------------------------

Event OnLoad()
  outpostcargolinkmarkerscript myCargoLinkRef = Self.GetLinkedRef(OutpostCargoLinkLightsKeyword) as outpostcargolinkmarkerscript
  If myCargoLinkRef
    Self.RegisterForCustomEvent(myCargoLinkRef as ScriptObject, "outpostcargolinkmarkerscript_SetAnimationStateEvent")
    Int stateEnum = myCargoLinkRef.GetValueInt(OutpostCargoLinkAnimState)
    sq_outpostcargolinkscript:animdata theData = myCargoLinkRef.SQ_OutpostCargoLink.GetAnimationData(stateEnum)
    If theData
      Self.PlayAnimation(theData.lightColorEvent)
      Self.PlayAnimation(theData.lightStateEvent)
    EndIf
  EndIf
EndEvent

Event OutpostCargoLinkMarkerScript.SetAnimationStateEvent(outpostcargolinkmarkerscript akSender, Var[] akArgs)
  sq_outpostcargolinkscript:animdata theData = akArgs[0] as sq_outpostcargolinkscript:animdata
  If theData
    Self.PlayAnimation(theData.lightColorEvent)
    Self.PlayAnimation(theData.lightStateEvent)
  EndIf
EndEvent

Event OnUnload()
  Self.UnregisterForAllCustomEvents()
EndEvent
