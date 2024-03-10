ScriptName Fragments:Quests:QF_RL027Quest_002611DC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_EnableMarkerShutters Auto Const mandatory
ReferenceAlias Property Alias_EnableMarkerLights Auto Const mandatory
ReferenceAlias Property Alias_Robot01 Auto Const mandatory
Faction Property CreatureFaction Auto Const
ReferenceAlias Property Alias_Boss Auto Const mandatory
ReferenceAlias Property Alias_ControlRoomDoor Auto Const mandatory
ReferenceAlias Property Alias_CentralRoomDoor Auto Const mandatory
Faction Property PredatorAFaction Auto Const
Faction Property PredatorAEnemyFaction Auto Const
wwiseevent Property RL027_MassiveShutters_Open Auto Const
RefCollectionAlias Property Alias_DamagedPipes Auto Const mandatory
RefCollectionAlias Property Alias_AllFlyers Auto Const mandatory
RefCollectionAlias Property Alias_MainRoomCreatures Auto Const mandatory
Spell Property AbModIncomingDamageFakeCombat Auto Const
RefCollectionAlias Property Alias_ExtCreatures Auto Const mandatory
ReferenceAlias Property Alias_AmbianceMarker Auto Const mandatory
ReferenceAlias Property Alias_EnableMarkerLightsMain Auto Const mandatory
ReferenceAlias Property Alias_StingerTrigger Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Int ExtActorCount = Alias_ExtCreatures.GetCount()
  Int currentExtActorIndex = 0
  While currentExtActorIndex < ExtActorCount
    (Alias_ExtCreatures.GetAt(currentExtActorIndex) as Actor).RemoveSpell(AbModIncomingDamageFakeCombat)
    currentExtActorIndex += 1
  EndWhile
EndFunction

Function Fragment_Stage_0002_Item_00()
  Int ActorCount = Alias_MainRoomCreatures.GetCount()
  Int currentActorIndex = 0
  While currentActorIndex < ActorCount
    (Alias_MainRoomCreatures.GetAt(currentActorIndex) as Actor).RemoveSpell(AbModIncomingDamageFakeCombat)
    currentActorIndex += 1
  EndWhile
  Int PipeCount = Alias_DamagedPipes.GetCount()
  Int currentPipeIndex = 0
  While currentPipeIndex < PipeCount
    Alias_DamagedPipes.GetAt(currentPipeIndex).DamageObject(2000.0)
    currentPipeIndex += 1
  EndWhile
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_AmbianceMarker.getref().enable(False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  RL027_MassiveShutters_Open.play(Alias_CentralRoomDoor.getref(), None, None)
  Alias_StingerTrigger.getref().enable(False)
  Utility.wait(1.5)
  Alias_EnableMarkerLightsMain.getref().enable(False)
  Utility.wait(4.0)
  Alias_EnableMarkerLights.getref().enable(False)
  Alias_ControlRoomDoor.getref().unlock(False)
  Alias_ControlRoomDoor.getref().setopen(True)
EndFunction
