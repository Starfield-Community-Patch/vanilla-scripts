ScriptName OutpostHarvesterFloraScript Extends OutpostEventHandlerParent
{ manages creating the appropriate flora for a flora harvester }

;-- Structs -----------------------------------------
Struct ResourceGlobalData
  ActorValue resourceAV
  GlobalVariable resourceGlobal
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
  ActorValue Property OrganicResourceAV Auto hidden
  { set by menu from build menu event }
  Keyword Property OutpostLinkFloraPlanter Auto mandatory
  { used to get planters to spawn flora }
EndGroup

Group Optional_Properties
  outpostharvesterflorascript:resourceglobaldata[] Property ResourceGlobals Auto Const
  { OPTIONAL - array of global variables to update when the builder is set to build the matching resource AV }
  Float Property ResourceGlobalValueToSet = 25.0 Auto Const
  { value to set resourceGlobal to }
EndGroup

outpostharvesterfloraplanterscript[] Property myPlanters Auto hidden

;-- Functions ---------------------------------------

Function HandleOnWorkshopObjectPlaced(ObjectReference akReference)
  ; Empty function
EndFunction

Event OnInit()
  myPlanters = Self.GetRefsLinkedToMe(OutpostLinkFloraPlanter, None) as outpostharvesterfloraplanterscript[]
  Int I = 0
  While I < myPlanters.Length
    myPlanters[I].RegisterForCreateFloraEvent(Self)
    I += 1
  EndWhile
  Self.UpdateResource()
EndEvent

Event OnBuilderMenuSelect(ActorValue akActorValue)
  OrganicResourceAV = akActorValue
  Self.UpdateResource()
  If ResourceGlobals.Length > 0
    Int resourceGlobalIndex = ResourceGlobals.findstruct("resourceAV", OrganicResourceAV, 0)
    If resourceGlobalIndex > -1
      GlobalVariable globalToSet = ResourceGlobals[resourceGlobalIndex].resourceGlobal
      If globalToSet as Bool && globalToSet.GetValue() != ResourceGlobalValueToSet
        globalToSet.SetValue(ResourceGlobalValueToSet)
      EndIf
    EndIf
  EndIf
EndEvent

Function HandleOnWorkshopObjectRemoved(ObjectReference akReference)
  Self.ClearCreatedFlora()
EndFunction

Function UpdateResource()
  Self.CreateFlora()
EndFunction

Function CreateFlora()
  If OrganicResourceAV
    ObjectReference workshopRef = Self.GetWorkshop()
    Flora floraToCreate = Self.GetFloraForResource(OrganicResourceAV)
    If floraToCreate
      Var[] kargs = new Var[1]
      kargs[0] = floraToCreate as Var
      Self.SendCustomEvent("outpostharvesterflorascript_CreateFloraEvent", kargs)
    EndIf
  EndIf
EndFunction

Function ClearCreatedFlora()
  Var[] kargs = new Var[1]
  kargs[0] = None
  Self.SendCustomEvent("outpostharvesterflorascript_CreateFloraEvent", kargs)
EndFunction
