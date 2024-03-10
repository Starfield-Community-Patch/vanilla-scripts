ScriptName FFCydoniaR02PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FFCydoniaR02_EquipmentNeededCount Auto Const mandatory
Int Property TurnInStage = 300 Auto Const
Weapon Property Eon Auto Const mandatory

;-- Functions ---------------------------------------

Function RegisterPlayerForItemTracking()
  Self.AddInventoryEventFilter(Eon as Form)
  Self.ItemCheck()
EndFunction

Function ItemCheck()
  If Self.GetRef().GetItemCount(Eon as Form) as Float >= FFCydoniaR02_EquipmentNeededCount.GetValue()
    Self.GetowningQuest().SetStage(TurnInStage)
    Self.RemoveInventoryEventFilter(Eon as Form)
  EndIf
EndFunction

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If (akBaseItem == Eon as Form) && !Self.GetowningQuest().GetStageDone(TurnInStage)
    Self.ItemCheck()
  EndIf
EndEvent

Event OnAliasInit()
  Self.RegisterPlayerForItemTracking()
EndEvent
