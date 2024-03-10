ScriptName MQ101PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Int MineralCount = 5

;-- Properties --------------------------------------
ReferenceAlias Property BarrettShip Auto
ReferenceAlias Property BarrettShipPilotChair Auto
ReferenceAlias Property Vasco Auto
MiscObject Property MineralType Auto
Location Property SystemNarionPlanetAnselonMoonNexumSurface Auto
Keyword Property ArmorTypeHelmet Auto
ReferenceAlias Property VascoStartMarker Auto
ReferenceAlias Property MedBench Auto
Location Property NewAtlantisLocation Auto
Weapon Property Cutter Auto
ActorValue Property Health Auto Const mandatory
Int Property PlayerLowHealthStage = 240 Auto Const
ReferenceAlias Property PlayerShip Auto Const

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.AddInventoryEventFilter(MineralType as Form)
  Self.AddInventoryEventFilter(Cutter as Form)
EndEvent

Function PirateCombatStarts()
  Actor PlayerREF = Game.GetPlayer()
  Float iLowHealth = PlayerREF.GetValue(Health) / 2.0
  Self.RegisterForActorValueLessThanEvent(PlayerREF as ObjectReference, Health, iLowHealth)
EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  Actor PlayerREF = Game.GetPlayer()
  If Utility.IsGameMenuPaused() || PlayerREF.GetSpaceship() != None
    
  Else
    Self.GetOwningQuest().SetStage(PlayerLowHealthStage)
  EndIf
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  Quest myQuest = Self.GetOwningQuest()
  Actor PlayerREF = Game.GetPlayer()
  If (akBaseItem == MineralType as Form) && PlayerREF.GetItemCount(MineralType as Form) >= MineralCount
    myQuest.SetStage(25)
    Self.RemoveInventoryEventFilter(MineralType as Form)
  EndIf
  If akBaseItem == Cutter as Form
    myQuest.SetStage(20)
  EndIf
EndEvent

Event OnEnterShipInterior(ObjectReference akShip)
  Quest myQuest = Self.GetOwningQuest()
  If akShip == BarrettShip.GetRef()
    If myQuest.GetStageDone(320) == False && myQuest.GetStage() < 500
      myQuest.SetStage(320)
    EndIf
  EndIf
  If akShip == PlayerShip.GetRef()
    If myQuest.GetStageDone(900) == True && myQuest.GetStageDone(1000) == False
      myQuest.SetStage(1000)
    EndIf
  EndIf
EndEvent

Event OnExitShipInterior(ObjectReference akShip)
  Quest myQuest = Self.GetOwningQuest()
  If Self.GetRef().IsInLocation(NewAtlantisLocation)
    myQuest.SetStage(1320)
  EndIf
  If myQuest.GetStageDone(900) == True
    myQuest.SetStage(1000)
  EndIf
EndEvent

Event OnSit(ObjectReference akFurniture)
  Quest myQuest = Self.GetOwningQuest()
  If akFurniture == BarrettShipPilotChair.GetRef()
    If myQuest.GetStageDone(340) == False && myQuest.GetStage() < 500
      myQuest.SetStage(340)
    EndIf
  EndIf
  If akFurniture == MedBench.GetRef()
    myQuest.SetStage(100)
  EndIf
EndEvent

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)
  If akBaseObject.HasKeyword(ArmorTypeHelmet)
    Quest myQuest = Self.GetOwningQuest()
    If myQuest.GetStageDone(155)
      If myQuest.GetStageDone(165)
        myQuest.SetStage(168)
      Else
        myQuest.SetStage(169)
      EndIf
    EndIf
  EndIf
EndEvent
