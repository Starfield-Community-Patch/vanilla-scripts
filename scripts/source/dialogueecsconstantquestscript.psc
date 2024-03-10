ScriptName DialogueECSConstantQuestScript Extends Quest

;-- Structs -----------------------------------------
Struct NPCData
  ReferenceAlias NPCAlias
  { The Alias for the NPC we want to move }
  ReferenceAlias MarkerAlias
  { The Marker Alias we're moving the NPC to }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property ECSConstantShip Auto Const mandatory
RefCollectionAlias Property GenericNPCs Auto Const mandatory
dialogueecsconstantquestscript:npcdata[] Property NPCDatum Auto Const mandatory

;-- Functions ---------------------------------------

Function MoveNPCs()
  Int I = 0
  Int iLength = NPCDatum.Length
  While I < iLength
    Actor myNPC = NPCDatum[I].NPCAlias.GetActorRef()
    ObjectReference myMarker = NPCDatum[I].MarkerAlias.GetRef()
    myNPC.MoveTo(myMarker, 0.0, 0.0, 0.0, True, False)
    I += 1
  EndWhile
EndFunction

Event OnQuestInit()
  ECSConstantShip.GetShipReference().SetValue(Game.GetInvulnerableAV(), 1.0)
EndEvent
