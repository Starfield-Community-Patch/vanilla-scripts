ScriptName OutpostHarvesterFloraPlanterScript Extends ObjectReference
{ script for placing flora at nodes }

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard CreateFloraGuard

;-- Properties --------------------------------------
String Property FloraNodeName = "FloraNode" Auto Const
{ base node name for flora in "planters" }
Int Property FloraNodeMax = 8 Auto Const
{ max number of nodes in any planter (used to create node name string) }
ActorValue Property HandScannerTarget Auto mandatory
{ used to tag created flora }
Float Property FloraScaleMin = 0.150000006 Auto Const
{ possibly temp - we may get this from an actor value on the Flora object that we are spawning }
Float Property FloraScaleMax = 0.25 Auto Const
{ possibly temp - we may get this from an actor value on the Flora object that we are spawning }
ObjectReference[] Property createdFlora Auto hidden

;-- Functions ---------------------------------------

Event OnInit()
  createdFlora = new ObjectReference[0]
EndEvent

Function RegisterForCreateFloraEvent(outpostharvesterflorascript myHarvester)
  Self.RegisterForCustomEvent(myHarvester as ScriptObject, "outpostharvesterflorascript_CreateFloraEvent")
EndFunction

Event OutpostHarvesterFloraScript.CreateFloraEvent(outpostharvesterflorascript akSender, Var[] akArgs)
  Flora floraToCreate = akArgs[0] as Flora
  Self.CreateFlora(floraToCreate)
EndEvent

Function CreateFlora(Flora floraToCreate)
  Guard CreateFloraGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Self.ClearCreatedFlora()
    If floraToCreate
      Int I = 1
      While I <= FloraNodeMax
        String nodeName = FloraNodeName
        If I < 10
          nodeName += "0"
        EndIf
        nodeName += I as String
        If Self.HasNode(nodeName)
          ObjectReference createdFloraRef = Self.PlaceAtNode(nodeName, floraToCreate as Form, 1, False, True, True, True)
          createdFlora.add(createdFloraRef, 1)
          createdFloraRef.SetHarvested(True)
          createdFloraRef.SetValue(HandScannerTarget, 1.0)
          Float scale = Utility.RandomFloat(FloraScaleMin, FloraScaleMax)
          createdFloraRef.SetScale(scale)
          createdFloraRef.Enable(False)
          createdFloraRef.SetScanned(True)
        EndIf
        I += 1
      EndWhile
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function ClearCreatedFlora()
  Int I = 0
  While createdFlora.Length > 0
    Self.ClearCreatedFloraSingle(createdFlora[0])
    createdFlora.remove(0, 1)
  EndWhile
EndFunction

Function ClearCreatedFloraSingle(ObjectReference createdFloraRef)
  If createdFloraRef != None
    createdFloraRef.Delete()
    createdFloraRef = None
  EndIf
EndFunction
