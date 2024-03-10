ScriptName TestFuelBinScript Extends ObjectReference
{ attempts to refuel the spaceship it is in }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property FuelObject Auto
Float Property FuelScorePerObject Auto Const
Float Property MaxPossibleFuel Auto Const
ActorValue Property FuelActorValue Auto Const
Quest Property myQuest Auto Const
Int Property StageToSet Auto Const
Int Property PrereqStage = -1 Auto Const
Int Property FuelNeededToSetStage = 10 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.AddInventoryEventFilter(FuelObject as Form)
EndEvent

Event OnClose(ObjectReference akActionRef)
  ObjectReference spaceship = None
  spaceship = Self.GetCurrentShipRef() as ObjectReference
  If (Self.GetItemCount(FuelObject as Form) > 0 && spaceship as Bool) && spaceship.GetValue(FuelActorValue) < 100.0
    Self.RemoveItem(FuelObject as Form, 1, False, None)
    Self.ModValue(FuelActorValue, FuelScorePerObject)
  EndIf
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  ObjectReference spaceship = None
  spaceship = Self.GetCurrentShipRef() as ObjectReference
  If spaceship
    Float currentFuel = spaceship.GetValue(FuelActorValue)
    Int numFuel = Self.GetItemCount(FuelObject as Form)
    If (FuelScorePerObject * numFuel as Float) + currentFuel > MaxPossibleFuel
      numFuel = Math.Floor((MaxPossibleFuel - currentFuel) / FuelScorePerObject)
    EndIf
    Self.RemoveItem(FuelObject as Form, numFuel, False, None)
    spaceship.ModValue(FuelActorValue, FuelScorePerObject * numFuel as Float)
  EndIf
  If spaceship.GetValue(FuelActorValue) as Int >= FuelNeededToSetStage
    If PrereqStage == -1 || myQuest.GetStageDone(PrereqStage) == True
      myQuest.SetStage(StageToSet)
    EndIf
  EndIf
EndEvent
