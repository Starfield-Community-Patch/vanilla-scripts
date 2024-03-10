ScriptName RI07_PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property RI07_Prototype Auto Const mandatory
ReferenceAlias Property Prototype Auto Const mandatory
RefCollectionAlias Property RDEngineers Auto Const mandatory
Faction Property LC051InfinityLTDPEnemyFaction Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.AddInventoryEventFilter(RI07_Prototype as Form)
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If akBaseItem == RI07_Prototype as Form
    Self.RemoveInventoryEventFilter(RI07_Prototype as Form)
    Game.GetPlayer().AddAliasedItem(RI07_Prototype as Form, Prototype as Alias, 1, True)
  EndIf
  Int iCurrentCount = 0
  Int iTotalCount = RDEngineers.GetCount()
  While iCurrentCount < iTotalCount
    Actor EngineerRef = RDEngineers.GetAt(iCurrentCount) as Actor
    Actor PlayerRef = Game.GetPlayer()
    If EngineerRef.HasDetectionLOS(PlayerRef as ObjectReference)
      PlayerRef.AddToFaction(LC051InfinityLTDPEnemyFaction)
    Else
      iCurrentCount += 1
    EndIf
  EndWhile
EndEvent
