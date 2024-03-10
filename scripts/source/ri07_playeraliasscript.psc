ScriptName RI07_PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property RI07_Prototype Auto Const mandatory
ReferenceAlias Property Prototype Auto Const mandatory
RefCollectionAlias Property RDEngineers Auto Const mandatory
Faction Property LC051InfinityLTDPEnemyFaction Auto Const mandatory
ReferenceAlias Property David Auto Const
Location Property CityNewAtlantisLocation Auto Const
Int Property DavidStartStage Auto Const
Int Property DavidDoneStage Auto Const

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

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  Quest RI07 = Self.GetOwningQuest()
  If RI07.GetStageDone(DavidStartStage) && !RI07.GetStageDone(DavidDoneStage)
    If akNewLoc == CityNewAtlantisLocation
      Actor DavidRef = David.GetActorRef()
      If DavidRef.GetCurrentLocation() != CityNewAtlantisLocation
        DavidRef.MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
        DavidRef.MoveToNearestNavmeshLocation()
      EndIf
    EndIf
  EndIf
EndEvent
