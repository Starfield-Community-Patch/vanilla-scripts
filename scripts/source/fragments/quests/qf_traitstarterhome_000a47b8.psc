ScriptName Fragments:Quests:QF_TraitStarterHome_000A47B8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property TraitStarterHome_Pointer Auto Const mandatory
Perk Property TRAIT_StarterHome Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
ReferenceAlias Property Alias_MapMarkerRename Auto Const mandatory
Keyword Property MapMarkerLinkedRefNameOverride Auto Const mandatory
GlobalVariable Property Trait_StarterHome_Mortgage Auto Const mandatory
ReferenceAlias Property Alias_HomeMarker Auto Const mandatory
RefCollectionAlias Property Alias_HomeDoors Auto Const mandatory
sq_playerhousescript Property PlayerHouseSystem Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  ObjectReference mapMarkerRef = Alias_MapMarker.GetRef()
  ObjectReference mapMarkerRenameRef = Alias_MapMarkerRename.GetRef()
  mapMarkerRef.SetLinkedRef(mapMarkerRenameRef, MapMarkerLinkedRefNameOverride, True)
  ObjectReference[] DoorRef = Alias_HomeDoors.GetArray()
  Int I = 0
  While I < DoorRef.Length
    DoorRef[I].BlockActivation(True, False)
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(200, True, False)
  Self.SetObjectiveDisplayedAtTop(100)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Alias_HomeMarker.GetRef().DisableNoWait(False)
  If Self.GetStageDone(400)
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(400, True, False)
  Self.SetObjectiveDisplayed(500, True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(500, False, False)
  PlayerHouseSystem.PurchaseHouse(Trait_StarterHome_Mortgage, None)
  If Self.GetStageDone(150)
    Self.SetStage(1000)
  EndIf
  ObjectReference[] DoorRef = Alias_HomeDoors.GetArray()
  Int I = 0
  While I < DoorRef.Length
    DoorRef[I].BlockActivation(False, False)
    DoorRef[I].Unlock(False)
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(500, True)
  If !Self.GetStageDone(150)
    Self.SetObjectiveDisplayed(100, False, False)
  EndIf
  Self.SetObjectiveDisplayed(400, False, False)
  Game.GetPlayer().RemovePerk(TRAIT_StarterHome)
  ObjectReference[] DoorRef = Alias_HomeDoors.GetArray()
  Int I = 0
  While I < DoorRef.Length
    DoorRef[I].BlockActivation(False, False)
    DoorRef[I].SetLockLevel(254)
    DoorRef[I].Lock(True, False, True)
    I += 1
  EndWhile
  Self.Stop()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
