ScriptName RQ_CollectScript Extends RQScript

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group CollectProperties
  RefCollectionAlias Property Creatures Auto Const
  RefCollectionAlias Property CollectedMeat Auto Const
  MiscObject Property RQS_CollectColonist_Meat Auto Const mandatory
  { misc item player takes from creatures }
  MiscObject Property RQS_CollectColonist_Meat_Player Auto Const mandatory
  { misc item that gets placed into player inventory - use different base object so we don't trigger OnItemAdded again }
  GlobalVariable Property RQS_CollectColonist_MaxMeat Auto Const mandatory
  Int Property MeatCollectedStage = 300 Auto Const
  { Stage to set when all meat has been collected. }
  Int Property ShutdownStage = 999 Auto Const
  { Stage to set when all minerals have been collected. }
EndGroup


;-- Functions ---------------------------------------

Function QuestStartedSpecific()
  Int MaxCreatures = Creatures.GetCount()
  If MaxCreatures > 0
    RQS_CollectColonist_MaxMeat.SetValueInt(MaxCreatures)
  Else
    Self.SetStage(ShutdownStage)
  EndIf
EndFunction

Function StartTrackingCollection()
  Self.AddInventoryEventFilter(RQS_CollectColonist_Meat as Form)
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnItemAdded")
EndFunction

Event ObjectReference.OnItemAdded(ObjectReference akSource, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  akSource.RemoveItem(akBaseItem, 1, True, None)
  akSource.AddAliasedItemSingle(RQS_CollectColonist_Meat_Player as Form, CollectedMeat as Alias, True)
  If CollectedMeat.GetCount() >= RQS_CollectColonist_MaxMeat.GetValueInt()
    Self.SetStage(MeatCollectedStage)
    Self.UnregisterForRemoteEvent(akSource as ScriptObject, "OnItemAdded")
  EndIf
EndEvent
