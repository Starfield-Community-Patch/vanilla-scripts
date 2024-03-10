ScriptName RefCollectionAliasManager Extends Quest
{ Looks through a ReferenceCollection and finds the best one and shoves it into sing Reference Alias. }

;-- Structs -----------------------------------------
Struct FactionWeightData
  Faction WhichFaction
  Float Weight
EndStruct

Struct ItemKeywordWeightData
  Keyword ItemKeyword
  Float Weight
EndStruct

Struct MessageData
  Message MessageToDisplay
  GlobalVariable ConditionalGlobal
  Float ConditionalGlobalValue
EndStruct


;-- Variables ---------------------------------------
ObjectReference BestReferenceSoFar
Bool BestWeightHasBeenSet
Float BestWeightSoFar
ObjectReference DistanceToRef
Actor LOSToActor
Keyword StartingKeyword

;-- Properties --------------------------------------
Group Properties
{ Every ref is given a total weight value, this data configures the weights }
  RefCollectionAlias Property RefCollectionToManage Auto Const
  ReferenceAlias Property ReferenceAliasToFill Auto Const
  { What "single" Reference Alias are we going to fill after managing the collection? }
  Float Property DistanceWeight = -1.0 Auto Const
  { Default = -1.  NOTE: Negative value means prefer closest.

How much to we multiply the GetDistance() check to add to a references preference weight?

Check is for distance to player. If you prefer to find closest to something else, see advanced properties. }
  Float Property ValueWeight = 1.0 Auto Const
  { Default = 1.

How much to we multiply the GetGoldValue() check to add to a references preference weight?

Reminder: things without Value GetGoldValue() will return -1 }
  refcollectionaliasmanager:factionweightdata[] Property FactionWeights Auto Const
  { An actor having one or more of these factions will cause the specified amount added to a references preference weight 
(more than one faction listed means more than one weight being added) }
  refcollectionaliasmanager:itemkeywordweightdata[] Property ItemKeywordWeights Auto Const
  { Generates weight based on keywords that item has. If container, GetItemCount() will look for these keywords, each keyword is given a weight, the count of items with each keyword is multiplied by the weight.
Items with multiple keywords get weights based on all the keywords. }
  Bool Property IgnoreCreatedRefs = True Auto Const
  { Default: true; if true, any non-persiting references not existing in the masterfile will be ignored (player dropped, created by script etc.)
Primarily this is used to get dogmeat to ignore things the player dropped. }
  Bool Property IgnoreEmptyContainers = True Auto Const
  { Default: true; if true, empty Containers will not be considered at all for the best reference. In otherwords, they will never fill ReferenceAliasToFill. }
  Bool Property IgnoreThingsBehindPlayer = True Auto Const
  { Ignores anything behind the player's current facing.

See Advanced properties to defining heading angle. }
  Bool Property IgnoreThingsWithoutLOS = False Auto Const
  { ignores anything that doesn't pass a LOS check to the Player OR to ClosestToThisAlias }
  Keyword Property OverrideIgnoreBehindKeyword Auto Const
  { If this quest started by this keyword, ignore the rule about ignoring things behind player.
This is to get this to work better when the player commands dogmeat to find things through dialogue. }
  Bool Property IgnoreIfWouldBeStealing = True Auto Const
  { If true, ignore anything owned }
  ReferenceAlias Property AliasToTestForStealing Auto Const
  { When doing WouldBeStealing check, check for Actor in this alias }
  Float Property MaxZPositionDifference = 300.0 Auto Const
  { Default: 300; if Z position between object and ClosetToThisAlias is greater than this, ignore the item }
  Int Property MinContainerValue = 50 Auto Const
  { Default: 50; ignore any container with a value less than this }
  refcollectionaliasmanager:messagedata[] Property MessagesToDisplayWhenBestItemFound Auto Const
EndGroup

Group Advanced
  ReferenceAlias Property ClosestToThisAlias Auto Const
  { Default: None; if None = Player, if not none, use the reference in this alias for distance calculation }
  ReferenceAlias Property LOSCheckToThisAlias Auto Const
  { Default: None; if None = Player, if not none, use the reference in this alias for LOS calculation }
  Float Property MaxDegreesForInfront = 90.0 Auto Const
  { Default: 90; what is the arc in degrees that means in front of the player }
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  If ClosestToThisAlias
    DistanceToRef = ClosestToThisAlias.GetReference()
  Else
    DistanceToRef = Game.Getplayer() as ObjectReference
  EndIf
  If LOSCheckToThisAlias
    LOSToActor = LOSCheckToThisAlias.GetActorRef()
  Else
    LOSToActor = Game.Getplayer()
  EndIf
EndEvent

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, Int aiValue1, Int aiValue2)
  StartingKeyword = akKeyword
EndEvent

Function ProcessCollection()
  Actor TestStealingRef = AliasToTestForStealing.GetActorRef()
  Int CountOfRefCollection = RefCollectionToManage.GetCount()
  ObjectReference ClosestToThisRef = ClosestToThisAlias.GetReference()
  Int I = 0
  While I < CountOfRefCollection
    ObjectReference CurrentRef = RefCollectionToManage.GetAt(I)
    Float CurrentDistance = CurrentRef.GetDistance(DistanceToRef)
    Float CurrentWeightedDistance = CurrentDistance * DistanceWeight
    Float CurrentZPositionDifference = Self.GetZPositionDifference(CurrentRef)
    Float CurrentValue = 0.0
    If CurrentRef.GetBaseObject() is Container
      CurrentValue = CurrentRef.GetInventoryValue() as Float
    Else
      CurrentValue = CurrentRef.GetGoldValue() as Float
    EndIf
    Float CurrentWeightedValue = CurrentValue * ValueWeight
    Float CurrentFactionsWeight = Self.GetFactionsWeight(CurrentRef)
    Float CurrentItemKeywordsWeight = Self.GetItemKeywordsWeight(CurrentRef)
    Float CurrentWeightedTotal = CurrentWeightedDistance + CurrentWeightedValue + CurrentFactionsWeight + CurrentItemKeywordsWeight
    If CurrentRef.GetBaseObject() is Container
      
    EndIf
    Bool ignoreMe = False
    Actor PlayerRef = Game.Getplayer()
    If TestStealingRef.WouldBeStealing(CurrentRef) && IgnoreIfWouldBeStealing
      ignoreMe = True
    ElseIf IgnoreThingsWithoutLOS && LOSToActor.HasDirectLOS(CurrentRef, "", "") == False && PlayerRef.HasDirectLOS(CurrentRef, "", "") == False && PlayerRef.HasDetectionLOS(CurrentRef) == False
      ignoreMe = True
    ElseIf CurrentRef.IsCreated() && IgnoreCreatedRefs
      ignoreMe = True
    ElseIf CurrentZPositionDifference > MaxZPositionDifference
      ignoreMe = True
    ElseIf CurrentRef.GetBaseObject() is Container
      If CurrentRef.GetItemCount(None) == 0 && IgnoreEmptyContainers
        ignoreMe = True
      ElseIf CurrentRef.GetInventoryValue() < MinContainerValue
        ignoreMe = True
      EndIf
    ElseIf IgnoreThingsBehindPlayer && Self.IsBehindPlayer(CurrentRef) && StartingKeyword != OverrideIgnoreBehindKeyword
      ignoreMe = True
    EndIf
    If ignoreMe == False && (CurrentWeightedTotal > BestWeightSoFar || BestWeightHasBeenSet == False)
      BestWeightHasBeenSet = True
      BestWeightSoFar = CurrentWeightedTotal
      BestReferenceSoFar = CurrentRef
    EndIf
    I += 1
  EndWhile
  If BestReferenceSoFar == None
    Self.stop()
  Else
    ReferenceAliasToFill.ForceRefTo(BestReferenceSoFar)
    Message MessageToDisplayWhenBestItemFound = Self.GetMessageToDisplay()
    If MessageToDisplayWhenBestItemFound
      MessageToDisplayWhenBestItemFound.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
  EndIf
EndFunction

Message Function GetMessageToDisplay()
  Int I = 0
  While I < MessagesToDisplayWhenBestItemFound.Length
    refcollectionaliasmanager:messagedata currentMessageData = MessagesToDisplayWhenBestItemFound[I]
    If currentMessageData.ConditionalGlobal.GetValue() == currentMessageData.ConditionalGlobalValue
      Return currentMessageData.MessageToDisplay
    EndIf
    I += 1
  EndWhile
EndFunction

Float Function GetFactionsWeight(ObjectReference ReferenceToCheck)
  Float returnVal = 0.0
  Actor ActorToCheck = ReferenceToCheck as Actor
  Float TotalFactionWeights = 0.0
  If ActorToCheck
    Int I = 0
    While I < FactionWeights.Length
      If ActorToCheck.IsInFaction(FactionWeights[I].WhichFaction)
        TotalFactionWeights += FactionWeights[I].Weight
      EndIf
      I += 1
    EndWhile
    returnVal = TotalFactionWeights
  Else
    returnVal = 0.0
  EndIf
  Return returnVal
EndFunction

Float Function GetItemKeywordsWeight(ObjectReference ReferenceToCheck)
  Float returnVal = 0.0
  Float TotalItemKeywordsWeights = 0.0
  If ReferenceToCheck
    Int I = 0
    While I < ItemKeywordWeights.Length
      If ReferenceToCheck.GetBaseObject() is Container
        Int itemCount = ReferenceToCheck.GetItemCount(ItemKeywordWeights[I].ItemKeyword as Form)
        If itemCount > 0
          TotalItemKeywordsWeights += itemCount as Float * ItemKeywordWeights[I].Weight
        EndIf
      Else
        TotalItemKeywordsWeights += ItemKeywordWeights[I].Weight
      EndIf
      I += 1
    EndWhile
    returnVal = TotalItemKeywordsWeights
  EndIf
  Return returnVal
EndFunction

Bool Function IsBehindPlayer(ObjectReference ObjectToCheck)
  Float heading = Game.Getplayer().GetHeadingAngle(ObjectToCheck)
  Bool returnVal = Math.abs(heading) > MaxDegreesForInfront / 2.0
  Return returnVal
EndFunction

Float Function GetZPositionDifference(ObjectReference ObjectToCheck)
  Float ActorZ = ClosestToThisAlias.GetReference().GetPositionZ()
  Float ObjectZ = ObjectToCheck.GetPositionZ()
  Return Math.abs(ActorZ - ObjectZ)
EndFunction
