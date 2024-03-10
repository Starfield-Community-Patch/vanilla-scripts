ScriptName Fragments:Quests:QF_LC102Combat_0009CBC7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_LC102DoorsToLock Auto Const mandatory
ReferenceAlias Property Alias_LC102DoorToBallroomKitchen Auto Const mandatory
ReferenceAlias Property Alias_LC102DoorToBallroomKitchenTrigger Auto Const mandatory
ReferenceAlias Property Alias_LC102DoorToEngineeringLevel Auto Const mandatory
ReferenceAlias Property Alias_LC102DoorToEngineeringLevelTrigger Auto Const mandatory
ReferenceAlias Property Alias_LifeSupportMachine01Activator Auto Const mandatory
ReferenceAlias Property Alias_LifeSupportMachine02Activator Auto Const mandatory
ReferenceAlias Property Alias_LifeSupportMachine03Activator Auto Const mandatory
ReferenceAlias Property Alias_EngineeringDeckTrigger Auto Const mandatory
RefCollectionAlias Property Alias_LC102DoorsToLockEngineeringDeck Auto Const mandatory
RefCollectionAlias Property Alias_LC102Passengers Auto Const mandatory
ActorValue Property pSpeedMult Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  lc102combatquestscript kmyQuest = __temp as lc102combatquestscript
  kmyQuest.SetTargetQuestStage()
  Alias_LC102Passengers.SetValue(pSpeedMult, 100.0)
  Alias_LifeSupportMachine01Activator.GetRef().BlockActivation(True, True)
  Alias_LifeSupportMachine02Activator.GetRef().BlockActivation(True, True)
  Alias_LifeSupportMachine03Activator.GetRef().BlockActivation(True, True)
  ObjectReference[] doorRefs = Alias_LC102DoorsToLock.GetArray()
  Int I = 0
  While I < doorRefs.Length
    doorRefs[I].SetLockLevel(254)
    I += 1
  EndWhile
  If !Alias_EngineeringDeckTrigger.GetRef().IsInTrigger(Game.GetPlayer() as ObjectReference)
    ObjectReference[] engineeringDoorRefs = Alias_LC102DoorsToLockEngineeringDeck.GetArray()
    I = 0
    While I < engineeringDoorRefs.Length
      engineeringDoorRefs[I].SetLockLevel(254)
      I += 1
    EndWhile
  EndIf
  Self.EvaluateDoorForCloseAndLock(Alias_LC102DoorToBallroomKitchen.GetRef(), Alias_LC102DoorToBallroomKitchenTrigger.GetRef())
  Self.EvaluateDoorForCloseAndLock(Alias_LC102DoorToEngineeringLevel.GetRef(), Alias_LC102DoorToEngineeringLevelTrigger.GetRef())
EndFunction

Function EvaluateDoorForCloseAndLock(ObjectReference doorRef, ObjectReference triggerRef)
  If triggerRef != None
    If triggerRef.IsInTrigger(Game.GetPlayer() as ObjectReference) == True
      Return 
    EndIf
  EndIf
  doorRef.SetOpen(False)
  doorRef.SetLockLevel(254)
  doorRef.Lock(True, False, True)
EndFunction
