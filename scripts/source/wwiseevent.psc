ScriptName WwiseEvent Extends Form Native hidden

;-- Structs -----------------------------------------
Struct WwiseRTPCParam
  String Name
  Float value
EndStruct

Struct WwiseSwitchParam
  String GroupName
  String StateName
EndStruct


;-- Functions ---------------------------------------

Bool Function PlayAndWaitImpl(ObjectReference akSource, String[] aSwitchGroups, String[] aSwitchStates, String[] aRTPCNames, Float[] aRTPCValues) Native

Int Function PlayImpl(ObjectReference akSource, String[] aSwitchGroups, String[] aSwitchStates, String[] aRTPCNames, Float[] aRTPCValues) Native

Function PlayMenuSound(String asSoundID) Global Native

Bool Function PlayUIAndWaitImpl(String[] aSwitchGroups, String[] aSwitchStates, String[] aRTPCNames, Float[] aRTPCValues) Native

Int Function PlayUIImpl(String[] aSwitchGroups, String[] aSwitchStates, String[] aRTPCNames, Float[] aRTPCValues) Native

Int Function PlayUIWithRTPC(String asRTPCName, Float afRTPCValue) Native

Int Function PlayWithRTPC(ObjectReference akSource, String asRTPCName, Float afRTPCValue) Native

Function SetGlobalRTPC(String asRTPCName, Float afRTPCValue) Global Native

Function SetGlobalState(String asStateGroup, String asStateName) Global Native

Function StopInstance(Int aiPlaybackInstance) Global Native

Function UpdateInstanceRTPC(Int aiPlaybackInstance, String asRTPCName, Float afRTPCValue) Global Native

Function UpdateInstanceRTPCsImpl(Int aiPlaybackInstance, String[] aRTPCNames, Float[] aRTPCValues) Global Native

wwiseevent:wwiseswitchparam Function MakeNewWwiseSwitchParam(String aGroupName, String aStateName) Global
  wwiseevent:wwiseswitchparam retval = new wwiseevent:wwiseswitchparam
  retval.GroupName = aGroupName
  retval.StateName = aStateName
  Return retval
EndFunction

wwiseevent:wwisertpcparam Function MakeNewWwiseRTPCParam(String aName, Float aValue) Global
  wwiseevent:wwisertpcparam retval = new wwiseevent:wwisertpcparam
  retval.Name = aName
  retval.value = aValue
  Return retval
EndFunction

Int Function Play(ObjectReference akSource, wwiseevent:wwiseswitchparam[] aSwitchParams, wwiseevent:wwisertpcparam[] aRTPCParams)
  Return Self.PlayImpl(akSource, WwiseEvent.ExtractSwitchGroups(aSwitchParams), WwiseEvent.ExtractSwitchStates(aSwitchParams), WwiseEvent.ExtractRTPCNames(aRTPCParams), WwiseEvent.ExtractRTPCValues(aRTPCParams))
EndFunction

Int Function PlayUI(wwiseevent:wwiseswitchparam[] aSwitchParams, wwiseevent:wwisertpcparam[] aRTPCParams)
  Return Self.PlayUIImpl(WwiseEvent.ExtractSwitchGroups(aSwitchParams), WwiseEvent.ExtractSwitchStates(aSwitchParams), WwiseEvent.ExtractRTPCNames(aRTPCParams), WwiseEvent.ExtractRTPCValues(aRTPCParams))
EndFunction

Bool Function PlayAndWait(ObjectReference akSource, wwiseevent:wwiseswitchparam[] aSwitchParams, wwiseevent:wwisertpcparam[] aRTPCParams)
  Return Self.PlayAndWaitImpl(akSource, WwiseEvent.ExtractSwitchGroups(aSwitchParams), WwiseEvent.ExtractSwitchStates(aSwitchParams), WwiseEvent.ExtractRTPCNames(aRTPCParams), WwiseEvent.ExtractRTPCValues(aRTPCParams))
EndFunction

Bool Function PlayUIAndWait(wwiseevent:wwiseswitchparam[] aSwitchParams, wwiseevent:wwisertpcparam[] aRTPCParams)
  Return Self.PlayUIAndWaitImpl(WwiseEvent.ExtractSwitchGroups(aSwitchParams), WwiseEvent.ExtractSwitchStates(aSwitchParams), WwiseEvent.ExtractRTPCNames(aRTPCParams), WwiseEvent.ExtractRTPCValues(aRTPCParams))
EndFunction

Function UpdateInstanceRTPCs(Int aiPlaybackInstance, wwiseevent:wwisertpcparam[] aRTPCParams) Global
  WwiseEvent.UpdateInstanceRTPCsImpl(aiPlaybackInstance, WwiseEvent.ExtractRTPCNames(aRTPCParams), WwiseEvent.ExtractRTPCValues(aRTPCParams))
EndFunction

String[] Function ExtractSwitchGroups(wwiseevent:wwiseswitchparam[] aSwitchParams) Global
  String[] switchGroups = None
  If aSwitchParams.Length > 0
    switchGroups = new String[aSwitchParams.Length]
    Int curSwitch = 0
    While curSwitch < aSwitchParams.Length
      switchGroups[curSwitch] = aSwitchParams[curSwitch].GroupName
      curSwitch += 1
    EndWhile
  EndIf
  Return switchGroups
EndFunction

String[] Function ExtractSwitchStates(wwiseevent:wwiseswitchparam[] aSwitchParams) Global
  String[] switchStates = None
  If aSwitchParams.Length > 0
    switchStates = new String[aSwitchParams.Length]
    Int curSwitch = 0
    While curSwitch < aSwitchParams.Length
      switchStates[curSwitch] = aSwitchParams[curSwitch].StateName
      curSwitch += 1
    EndWhile
  EndIf
  Return switchStates
EndFunction

String[] Function ExtractRTPCNames(wwiseevent:wwisertpcparam[] aRTPCParams) Global
  String[] rtpcNames = None
  If aRTPCParams.Length > 0
    rtpcNames = new String[aRTPCParams.Length]
    Int curRTPC = 0
    While curRTPC < aRTPCParams.Length
      rtpcNames[curRTPC] = aRTPCParams[curRTPC].Name
      curRTPC += 1
    EndWhile
  EndIf
  Return rtpcNames
EndFunction

Float[] Function ExtractRTPCValues(wwiseevent:wwisertpcparam[] aRTPCParams) Global
  Float[] rtpcValues = None
  If aRTPCParams.Length > 0
    rtpcValues = new Float[aRTPCParams.Length]
    Int curRTPC = 0
    While curRTPC < aRTPCParams.Length
      rtpcValues[curRTPC] = aRTPCParams[curRTPC].value
      curRTPC += 1
    EndWhile
  EndIf
  Return rtpcValues
EndFunction
