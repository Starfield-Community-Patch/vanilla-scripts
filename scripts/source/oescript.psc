ScriptName OEScript Extends REScript
{ Main Manager for the Overlay Encounter System }

;-- Structs -----------------------------------------
Struct ActorValueDatum
  ActorValue ActorValueToSet
  Float value
EndStruct

Struct CreatureCorpseDatum
  ReferenceAlias CreatureAlias
  { Creature corpse to spawn. This kills the reference in the alias and moves it to the specified marker. 
        Use DefaultGroupSpawnQuestScript to spawn NPC corpses. }
  ReferenceAlias MoveTo
  { Marker to move the corpse to. }
EndStruct

Struct VendorDatum
  ReferenceAlias NPCAlias
  { The Vendor that uses the particular container. }
  ReferenceAlias VendorContainer
  { This is the alias that will hold the Vendor's container. Normally this would hold items by default, 
        but because the contents may change with Keywords added by this script, the container will be cleared and the LL for VendorInventory will be added to the container. }
  LeveledItem VendorInventory
  { The items loaded into the Vendor's container. }
  Faction VendorFaction
  { Filter for: Vendor_OE_* }
  String Comment
  { Used for traces. }
EndStruct


;-- Variables ---------------------------------------
defaultgroupspawnquestscript DefaultGroupSpawnQuest
ObjectReference[] OwnedObjects
Bool gGroupSpawnsFinished = False

;-- Properties --------------------------------------
Group RangeCheck
  Float Property RangeCheckDistance Auto Const
  { Optional - When player's distance to trigger is less than this, stage RangeCheckStage will be set. }
  Int Property RangeCheckStage Auto Const
  { Optional - When player's distance to trigger is less than RangeCheckDistance, set this stage. }
EndGroup

Group Overlay_Settings
  oescript:actorvaluedatum[] Property LocationActorValues Auto Const
  { actor values added to the Location }
  Location Property OE_Location Auto hidden
  { set on startup with the current Location }
EndGroup

Group Creature_Settings
  oescript:creaturecorpsedatum[] Property CreatureCorpseData Auto Const
EndGroup

Group Object_Settings
  oescript:vendordatum[] Property VendorData Auto Const
  Faction Property OwningFaction Auto
  { If set to None, nothing created by the OEScript is owned
         If NONE, will be set by DefaultGroupSpawnQuestScript to first owner faction it sets }
  Int Property RewardContainerLockLevel = 0 Auto Const
  { If a Reward Container is available, this sets its lock level.
        0=Unlocked, 25=Novice, 50=Advanced, 75=Expert, 100=Master
        251=Barred, 252=Chained, 253=Terminal Only, 254=Inaccessible, 255=Requires Key.
        If set to 255, it will try to generate a key and place it in the Key_Reward alias. }
  ReferenceAlias Property Marker_Key Auto Const
  { Location where the Key will be spawned if the RewardContainerLockLevel is set to 255. If blank, the key won't be spawned. By default, key is enabled. }
  LeveledItem Property LL_OE_Default_Reward Auto Const
  { Used to populate the Reward Container. }
EndGroup

Group Stage_Settings
  Int Property QuestSetupCompleteStage = -1 Auto Const
  { stage is set when quest is fully setup (bFinishedOnStoryEvent=true) }
EndGroup

Group AutofillProperties
  ReferenceAlias Property Trigger Auto Const mandatory
  ReferenceAlias Property Container_Reward Auto Const
  ReferenceAlias Property Key_Reward Auto Const
  { The Reference to the Reward Container's key, if applicable. }
  ReferenceAlias Property Marker_Center Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  Parent.OnQuestStarted()
  DefaultGroupSpawnQuest = (Self as Quest) as defaultgroupspawnquestscript
  OwnedObjects = new ObjectReference[0]
  Parent.DefineCustomLogs()
  If DefaultGroupSpawnQuest
    DefaultGroupSpawnQuest.InitialGroupSpawn(LocalScriptName)
    gGroupSpawnsFinished = DefaultGroupSpawnQuest.GroupSetupCompleted
  EndIf
  Self._PushLocationAVs()
  Int failsafeCounter = 20
  While gGroupSpawnsFinished == False && failsafeCounter > 0 && DefaultGroupSpawnQuest as Bool
    gGroupSpawnsFinished = DefaultGroupSpawnQuest.GroupSetupCompleted
    Utility.wait(1.0)
    failsafeCounter -= 1
  EndWhile
  Self._SetupRewardContainer()
  Self._SetupCreatureCorpses()
  If RangeCheckDistance > 0.0
    ObjectReference centerMarkerRef = Marker_Center.GetRef()
    Self.RegisterForDistanceLessThanEvent(Game.GetPlayer() as ScriptObject, centerMarkerRef as ScriptObject, RangeCheckDistance, 0)
  EndIf
  bFinishedOnStoryEvent = True
  If QuestSetupCompleteStage > -1
    Self.SetStage(QuestSetupCompleteStage)
  EndIf
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.SetStage(RangeCheckStage)
  Self._SetupVendors()
EndEvent

Function _PushLocationAVs()
  Int index = 0
  If OE_Location == None
    If Marker_Center.GetRef()
      OE_Location = Marker_Center.GetRef().GetCurrentLocation()
    EndIf
  EndIf
  If OE_Location
    index = 0
    While index < LocationActorValues.Length
      OE_Location.SetValue(LocationActorValues[index].ActorValueToSet, LocationActorValues[index].value)
      index += 1
    EndWhile
  EndIf
EndFunction

Function _SetupVendors()
  Int index = 0
  While index < VendorData.Length
    If ((VendorData[index].VendorContainer as Bool && VendorData[index].NPCAlias as Bool) && VendorData[index].VendorFaction as Bool) && VendorData[index].VendorInventory as Bool
      Self._SetupVendor(index)
    EndIf
    index += 1
  EndWhile
EndFunction

Function _SetupVendor(Int aiVendorIndex)
  ObjectReference VendorContainer = VendorData[aiVendorIndex].VendorContainer.GetRef()
  Faction VendorFaction = VendorData[aiVendorIndex].VendorFaction
  LeveledItem VendorInventory = VendorData[aiVendorIndex].VendorInventory
  ReferenceAlias VendorNPC = VendorData[aiVendorIndex].NPCAlias
  String VendorName = VendorData[aiVendorIndex].Comment
  VendorContainer.RemoveAllItems(None, False, False)
  If VendorNPC
    VendorContainer.AddItem(VendorInventory as Form, 1, False)
    (VendorNPC.GetRef() as Actor).AddToFaction(VendorFaction)
  EndIf
  VendorContainer.Lock(True, False, True)
EndFunction

Function _SetupRewardContainer()
  If Container_Reward
    ObjectReference ContainerREF = Container_Reward.GetRef()
    If ContainerREF
      If LL_OE_Default_Reward
        ContainerREF.AddItem(LL_OE_Default_Reward as Form, 1, False)
      EndIf
      ContainerREF.SetLockLevel(RewardContainerLockLevel)
      If RewardContainerLockLevel > 0
        ContainerREF.Lock(True, False, True)
      EndIf
      If RewardContainerLockLevel == 255
        Self._SetupContainerKey(ContainerREF)
      EndIf
      Self._SetupOwners(ContainerREF)
    EndIf
  EndIf
EndFunction

Function _SetupOwners(ObjectReference akRefToOwn)
  If akRefToOwn as Bool && OwningFaction as Bool
    akRefToOwn.SetFactionOwner(OwningFaction, False)
    OwnedObjects.add(akRefToOwn, 1)
  EndIf
EndFunction

Function _ClearOwners(Bool bClearRewardContainer, Bool bClearObjects)
  ObjectReference ContainerREF = Container_Reward.GetRef()
  Int index = 0
  If bClearObjects
    While index < OwnedObjects.Length
      OwnedObjects[index].SetFactionOwner(None, False)
      index += 1
    EndWhile
  EndIf
  If bClearRewardContainer && ContainerREF as Bool
    ContainerREF.SetFactionOwner(None, False)
  EndIf
EndFunction

Function _SetupContainerKey(ObjectReference akLockedObjectRef)
  ObjectReference KeyMarkerREF = Marker_Key.GetRef()
  ObjectReference KeyObjectREF = None
  Key KeyToPlace = None
  If KeyMarkerREF == None
    KeyMarkerREF = Marker_Center.GetRef()
  EndIf
  If KeyMarkerREF as Bool && akLockedObjectRef as Bool
    KeyObjectREF = KeyMarkerREF.PlaceLockedRefKeyAtMe(akLockedObjectRef, 1, False, False, True)
    If KeyObjectREF
      Key_Reward.ForceRefTo(KeyObjectREF)
    Else
      KeyToPlace = akLockedObjectRef.GetKey()
      If KeyToPlace
        KeyObjectREF = KeyMarkerREF.PlaceAtMe(KeyToPlace as Form, 1, False, False, True, None, Key_Reward as Alias, True)
      EndIf
    EndIf
  EndIf
EndFunction

Function _SetupCreatureCorpses()
  Int CorpseIndex = 0
  While CorpseIndex < CreatureCorpseData.Length
    oescript:creaturecorpsedatum theCorpseData = CreatureCorpseData[CorpseIndex]
    If theCorpseData.CreatureAlias
      ObjectReference Corpse = theCorpseData.CreatureAlias.GetRef()
      If Corpse
        Corpse.TryToKill(None)
        If theCorpseData.MoveTo
          ObjectReference Marker = theCorpseData.MoveTo.GetRef()
          If Corpse as Bool && Marker as Bool
            Corpse.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
          EndIf
        EndIf
      EndIf
    EndIf
    CorpseIndex += 1
  EndWhile
EndFunction

Function ClearAllObjectOwnership(Bool bRewardContainer, Bool bClearAllObjects)
  Self._ClearOwners(bRewardContainer, bClearAllObjects)
EndFunction
