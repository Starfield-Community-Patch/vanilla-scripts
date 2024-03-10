ScriptName UC07_PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PreReqStage = 300 Auto Const
Int Property CraftedCellStage = 495 Auto Const
{ Set this stage if the player crafted the Microcell, rather than bought it }
MiscObject Property UC07_Microcell Auto Const mandatory
{ Object to start watching for once the player knows they need one }
ReferenceAlias Property Microcell Auto Const mandatory
{ Ref alias to hold the acquired MicroCell so the player can't toss it }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If auiStageID == PreReqStage
    Self.UnregisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
    Self.AddInventoryEventFilter(UC07_Microcell as Form)
  EndIf
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If akBaseItem == UC07_Microcell as Form
    Self.RemoveAllInventoryEventFilters()
    Actor PlayACT = Game.GetPlayer()
    PlayACT.RemoveItem(UC07_Microcell as Form, 1, True, None)
    PlayACT.AddAliasedItem(UC07_Microcell as Form, Microcell as Alias, 1, True)
  EndIf
EndEvent

Event OnPlayerCraftItem(ObjectReference akBench, Location akLocation, Form akCreatedItem)
  If akCreatedItem == UC07_Microcell as Form
    Self.GetOwningQuest().SetStage(CraftedCellStage)
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
