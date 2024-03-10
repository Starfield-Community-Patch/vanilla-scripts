ScriptName FFNewHomesteadR04QuestScript Extends Quest

;-- Structs -----------------------------------------
Struct IceSetupDatum
  ReferenceAlias IceAlias
  { The Ice Alias }
  ReferenceAlias TurbineAlias
  { The Turbine Alias }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory
LocationAlias Property NewHomestead Auto Const mandatory
ReferenceAlias[] Property AllIceRefs Auto Const mandatory
ActorValue Property ProduceUses Auto Const mandatory
Int Property ReturnStage = 300 Auto Const
Int Property CooldownTimerFinishedStage = 9999 Auto Const
Int Property ShutdownQuestStage = 10000 Auto Const
Int Property ObjectiveToUpdate = 200 Auto Const
Int Property IceCleared = 0 Auto
Int Property IceTotal Auto
Float Property CooldownTimerDays = 3.0 Auto Const
GlobalVariable Property FFNewHomesteadR04_CooldownTime Auto Const mandatory
GlobalVariable Property FFNewHomesteadR04_IceCleared Auto Const mandatory
Quest Property FFNewHomesteadR04Misc Auto Const mandatory
ffnewhomesteadr04questscript:icesetupdatum[] Property IceSetupData Auto Const
{ array of data for ice/turbines }

;-- Functions ---------------------------------------

Function RegisterIce()
  FFNewHomesteadR04_IceCleared.SetValue(0.0)
  Self.ModObjectiveGlobal(0.0, FFNewHomesteadR04_IceCleared, ObjectiveToUpdate, -1.0, True, True, True, False)
  Int I = 0
  Int iCount = IceSetupData.Length
  IceTotal = iCount
  While I < iCount
    ObjectReference myIce = IceSetupData[I].IceAlias.GetRef()
    ObjectReference myTurbine = IceSetupData[I].TurbineAlias.GetRef()
    If myTurbine != None
      myIce.SetLinkedRef(myTurbine, LinkCustom01, True)
    EndIf
    Self.RegisterForActorValueLessThanEvent(myIce, ProduceUses, 1.0)
    If myIce.GetValue(ProduceUses) < 1.0
      Self.IceIsCleared(myIce, ProduceUses)
    EndIf
    I += 1
  EndWhile
EndFunction

Function SetCooldown()
  Float CooldownTimerLengthHours = 24.0 * CooldownTimerDays
  Self.StartTimerGameTime(CooldownTimerLengthHours, 0)
EndFunction

Function IceIsCleared(ObjectReference akObjRef, ActorValue akActorValue)
  ObjectReference myLinkedTurbine = akObjRef.GetLinkedRef(LinkCustom01)
  If myLinkedTurbine != None
    myLinkedTurbine.PlayAnimation("Play01")
  EndIf
  akObjRef.Disable(False)
  IceCleared += 1
  Self.ModObjectiveGlobal(1.0, FFNewHomesteadR04_IceCleared, ObjectiveToUpdate, -1.0, True, True, True, False)
  If IceCleared >= IceTotal
    Self.SetStage(ReturnStage)
  EndIf
EndFunction

Event OnQuestInit()
  (FFNewHomesteadR04Misc as ffnewhomesteadr04miscquestscript).ChangeMiscBool()
  Self.RegisterIce()
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  Self.IceIsCleared(akObjRef, akActorValue)
EndEvent

Event OnTimerGameTime(Int aiTimerID)
  Self.SetStage(CooldownTimerFinishedStage)
  If Game.GetPlayer().IsInLocation(NewHomestead.GetLocation())
    Self.SetStage(ShutdownQuestStage)
  EndIf
EndEvent
