ScriptName defaultQuestRespawnScript Extends Quest default hidden
{ Simple script to respawn Aliases that have the DefaultAliasRespawnScript on them. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Respawn_Markers
  ObjectReference[] Property RespawnMarkers Auto Const
  { array of respawn markers - actors will randomly respawn at these out of player's LOS }
  ObjectReference Property RespawnMarkerFailsafe Auto Const
  { this is where I will respawn if player has LOS
	on other respawn points }
EndGroup

Group Quest_Stages
  Int Property StartStage = 0 Auto Const
  { Quest stage that needs to be set for respawning
	to start }
  Int Property DoneStage = 0 Auto Const
  { Respawning will stop if this stage is set }
EndGroup

Group Respawning_Values
  Int Property RespawnTimeMin = 5 Auto
  { min time between death and respawn in seconds }
  Int Property RespawnTimeMax = 10 Auto
  { max time between death and respawn in seconds }
  Int Property RespawnPool = 0 Auto
  { how many NPCs can be respawned?
	0 = infinite }
  Int Property MinRespawnDistance = 512 Auto Const
  { if the player is within this distance of a respawn point, don't use it }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log. }
EndGroup

Int Property respawnCount = 0 Auto hidden

;-- Functions ---------------------------------------

Function Respawn(ReferenceAlias aliasToRespawn)
  ObjectReference marker = Self.GetRespawnMarker()
  If aliasToRespawn.GetActorRef().IsDead()
    aliasToRespawn.ForceRefTo(marker.PlaceAtMe(aliasToRespawn.GetActorRef().GetBaseObject(), 1, False, False, True, None, None, True))
  EndIf
EndFunction

Function RespawnCollection(RefCollectionAlias collectionToRespawn, Actor actorToRespawn)
  ObjectReference marker = Self.GetRespawnMarker()
  If actorToRespawn.IsDead()
    collectionToRespawn.RemoveRef(actorToRespawn as ObjectReference)
    collectionToRespawn.AddRef(marker.PlaceAtMe(actorToRespawn.GetBaseObject(), 1, False, False, True, None, None, True))
  EndIf
EndFunction

Function TryToRespawn(ReferenceAlias aliasToRespawn)
  defaultaliasrespawnscript respawnAlias = aliasToRespawn as defaultaliasrespawnscript
  If respawnAlias == None
    Return 
  EndIf
  If Self.ReadyToRespawn()
    If respawnAlias.RespawningOn
      Self.Respawn(respawnAlias as ReferenceAlias)
    EndIf
  EndIf
EndFunction

Function TryToRespawnCollection(RefCollectionAlias collectionToRespawn, Actor actorToRespawn)
  defaultcollectionaliasrespawnscript RespawnCollection = collectionToRespawn as defaultcollectionaliasrespawnscript
  If RespawnCollection == None
    Return 
  ElseIf actorToRespawn == None
    Return 
  EndIf
  If Self.ReadyToRespawn()
    If RespawnCollection.RespawningOn
      Self.RespawnCollection(RespawnCollection as RefCollectionAlias, actorToRespawn)
    EndIf
  EndIf
EndFunction

Bool Function ReadyToRespawn()
  If (StartStage == 0 || StartStage > 0 && Self.GetStageDone(StartStage)) && (DoneStage == 0 || DoneStage > 0 && !Self.GetStageDone(DoneStage)) && (RespawnPool == 0 || RespawnPool > 0 && respawnCount < RespawnPool)
    respawnCount += 1
    Utility.Wait(Utility.RandomInt(RespawnTimeMin, RespawnTimeMax) as Float)
    Return True
  Else
    Return False
  EndIf
EndFunction

ObjectReference Function GetRespawnMarker()
  Int tryIndex = Utility.RandomInt(0, RespawnMarkers.Length - 1)
  Actor playerActor = Game.GetPlayer()
  ObjectReference marker = None
  Int loopCount = 0
  While loopCount < RespawnMarkers.Length
    If playerActor.HasDetectionLOS(RespawnMarkers[tryIndex]) == False && (playerActor.GetDistance(RespawnMarkers[tryIndex]) > MinRespawnDistance as Float)
      Return RespawnMarkers[tryIndex]
    Else
      loopCount += 1
      If tryIndex >= RespawnMarkers.Length - 1
        tryIndex = 0
      Else
        tryIndex += 1
      EndIf
    EndIf
  EndWhile
  Return RespawnMarkerFailsafe
EndFunction
