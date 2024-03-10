ScriptName DefaultAliasMakeAliasRefForInventory Extends ReferenceAlias default

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group RequiredProperties
  Form Property TargetObject Auto Const mandatory
  { The object we're interested in. Must be an inventory object. }
  ReferenceAlias Property AliasToForce Auto Const
  { The alias we want the specified object shoved into. NOTE: This is exclusive with CollectionToAddTo. If this is set, whatever's in CollectionToAddTo will be ignored }
  RefCollectionAlias Property CollectionToAddTo Auto Const
  { The ref collection we want the specifed object shoves into. }
EndGroup

Group OptionalProperties
  Int Property PrereqStage = -1 Auto Const
  { Stage that must be set for this script's functionality to execute }
  Int Property TurnOffStageDone = -1 Auto Const
  { If this stage is specfically done, this script's functionality is ignored }
  Bool Property DoOnce = True Auto Const
  { Only execute this script's functionality once }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { (Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  If PrereqStage == -1
    Self.AddInventoryEventFilter(TargetObject)
    If TurnOffStageDone > -1
      Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
    EndIf
  Else
    Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
  EndIf
EndEvent

Event Quest.OnStageSet(Quest akSenderRef, Int auiStageID, Int auiItemID)
  If auiStageID == PrereqStage
    Self.AddInventoryEventFilter(TargetObject)
  ElseIf TurnOffStageDone > -1 && auiStageID == TurnOffStageDone
    Self.RemoveInventoryEventFilter(TargetObject)
  EndIf
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If akBaseItem == TargetObject
    Self.ProcessMakingRef(akBaseItem)
  EndIf
EndEvent

Function ProcessMakingRef(Form akBaseItem)
  If DoOnce
    Self.RemoveInventoryEventFilter(TargetObject)
  EndIf
  If AliasToForce
    Self.GetRef().MakeAliasedRefFromInventory(akBaseItem, AliasToForce as Alias)
  EndIf
  If CollectionToAddTo as Bool && AliasToForce == None
    ObjectReference CreatedRef = Self.GetRef().MakeAliasedRefFromInventory(akBaseItem, CollectionToAddTo as Alias)
  EndIf
EndFunction
