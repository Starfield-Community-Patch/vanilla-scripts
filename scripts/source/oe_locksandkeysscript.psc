ScriptName OE_LocksAndKeysScript Extends Quest

;-- Structs -----------------------------------------
Struct LockedObjectDatum
  ReferenceAlias LockedObjectAlias
  { the ReferenceAlias with the container or terminal that should be locked and needs a key/password }
  RefCollectionAlias PossibleKeySpawnMarkersAlias
  { Ref Collection holding all the possible Spawn Markers (we will need to test if they are LinkedRef after the quest starts and everything is persisting) }
  ReferenceAlias KeySpawnMarkerAlias
  { the ReferenceAlias with the marker where the key/password should be placed (will pick one of the refs in PossibleKeySpawnMarkersAlias that is linked Ref to the LockedObjectAlias ref) }
  ReferenceAlias KeyAlias
  { the ReferenceAlias that will have the created key/password forced into it }
  Bool EnableIfPlaceKeyFails = True
  { if true (default), even if we can't place the key, still enable LockedObjectAlias. }
  Bool LockIfPlaceKeyFails = True
  { if true (default), even if we can't place the key, still lock LockedObjectAlias. }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
oe_locksandkeysscript:lockedobjectdatum[] Property LockedObjectData Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestStarted()
  Int I = 0
  While I < LockedObjectData.Length
    oe_locksandkeysscript:lockedobjectdatum currentLockedObjectDatum = LockedObjectData[I]
    ObjectReference lockedRef = currentLockedObjectDatum.LockedObjectAlias.GetReference()
    ReferenceAlias KeyAlias = currentLockedObjectDatum.KeyAlias
    ObjectReference spawnMarkerRef = None
    ObjectReference[] possibleKeySpawnMarkerRefs = currentLockedObjectDatum.PossibleKeySpawnMarkersAlias.GetArray()
    Int j = 0
    While spawnMarkerRef == None && j < possibleKeySpawnMarkerRefs.Length
      ObjectReference currentRef = possibleKeySpawnMarkerRefs[j]
      If currentRef.GetLinkedRef(None) == lockedRef
        spawnMarkerRef = currentRef
      EndIf
      j += 1
    EndWhile
    If spawnMarkerRef == None
      
    EndIf
    ObjectReference keyRef = None
    If (lockedRef as Bool && spawnMarkerRef as Bool) && KeyAlias as Bool
      currentLockedObjectDatum.KeySpawnMarkerAlias.ForceRefTo(spawnMarkerRef)
      keyRef = spawnMarkerRef.PlaceLockedRefKeyAtMe(lockedRef, 1, False, False, True)
      KeyAlias.ForceRefTo(keyRef)
    EndIf
    If keyRef as Bool || currentLockedObjectDatum.EnableIfPlaceKeyFails
      lockedRef.Enable(False)
    EndIf
    If keyRef as Bool || currentLockedObjectDatum.LockIfPlaceKeyFails
      lockedRef.Lock(True, False, True)
    EndIf
    I += 1
  EndWhile
EndEvent

Function DebugMoveToKey(Int keyIndex)
  Game.GetPlayer().MoveTo(LockedObjectData[keyIndex].KeyAlias.GetReference(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function DebugMoveToLockedObject(Int objectIndex)
  Game.GetPlayer().MoveTo(LockedObjectData[objectIndex].LockedObjectAlias.GetReference(), 0.0, 0.0, 0.0, True, False)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
