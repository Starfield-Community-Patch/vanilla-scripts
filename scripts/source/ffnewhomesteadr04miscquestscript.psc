ScriptName FFNewHomesteadR04MiscQuestScript Extends Quest

;-- Structs -----------------------------------------
Struct IceSetupDatum
  ReferenceAlias IceMarkerAlias
  { The Ice Marker Alias }
  ReferenceAlias IceAlias
  { The Ice Alias }
  ReferenceAlias TurbineAlias
  { The Turbine Alias }
EndStruct


;-- Variables ---------------------------------------
Bool bQuestactive = False

;-- Properties --------------------------------------
ActorValue Property ProduceUses Auto Const mandatory
Keyword Property LinkCustom01 Auto Const mandatory
ReferenceAlias[] Property AllIceRefs Auto Const mandatory
RefCollectionAlias Property LightEnableMarkers Auto Const mandatory
RefCollectionAlias Property AllTurbines Auto Const mandatory
ffnewhomesteadr04miscquestscript:icesetupdatum[] Property IceSetupData Auto Const
{ array of data for ice/Markers/turbines }

;-- Functions ---------------------------------------

Function RegisterIce()
  Self.ResetTurbines()
  Self.SetupBrokenTurbines()
  Int I = 0
  Int iCount = AllIceRefs.Length
  While I < iCount
    ObjectReference myIce = AllIceRefs[I].GetRef()
    Self.RegisterForActorValueLessThanEvent(myIce, ProduceUses, 1.0)
    If myIce.GetValue(ProduceUses) < 1.0
      Self.IceIsCleared(myIce, ProduceUses)
    EndIf
    I += 1
  EndWhile
EndFunction

Function ResetTurbines()
  Int I = 0
  Int iCount = AllTurbines.GetCount()
  While I < iCount
    ObjectReference myTurbine = AllTurbines.GetAt(I)
    myTurbine.PlayAnimation("StateB_Idle")
    I += 1
  EndWhile
EndFunction

Function SetupBrokenTurbines()
  Int I = 0
  Int iLength = IceSetupData.Length
  While I < iLength
    ObjectReference myMarker = IceSetupData[I].IceMarkerAlias.GetRef()
    ObjectReference myLinkedTurbine = myMarker.GetLinkedRef(None)
    If myLinkedTurbine != None
      IceSetupData[I].TurbineAlias.ForceRefTo(myLinkedTurbine)
      myLinkedTurbine.PlayAnimation("StateC_Play")
    EndIf
    I += 1
  EndWhile
EndFunction

Function ChangeMiscBool()
  bQuestactive = True
EndFunction

Function IceIsCleared(ObjectReference akObjRef, ActorValue akActorValue)
  If bQuestactive == False
    ObjectReference myLinkedTurbine = akObjRef.GetLinkedRef(LinkCustom01)
    If myLinkedTurbine != None
      myLinkedTurbine.PlayAnimation("Play01")
    EndIf
    akObjRef.Disable(False)
  EndIf
EndFunction

Event OnQuestInit()
  LightEnableMarkers.EnableAll(False)
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  Self.IceIsCleared(akObjRef, akActorValue)
EndEvent
