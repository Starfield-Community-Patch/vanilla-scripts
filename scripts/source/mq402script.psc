ScriptName MQ402Script Extends Quest

;-- Structs -----------------------------------------
Struct LodgeArtifacts
  Int ArtifactNumber
  ObjectReference PlacementMarker
  ReferenceAlias ArtifactRefAlias
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
mq402script:lodgeartifacts[] Property LodgeArtifactsArray Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
GlobalVariable Property MQ402LodgeActorsSkip Auto Const mandatory
ReferenceAlias Property Andreja Auto Const mandatory
ReferenceAlias Property Barrett Auto Const mandatory
ReferenceAlias Property SamCoe Auto Const mandatory
ReferenceAlias Property CoraCoe Auto Const mandatory
Faction Property AvailableCompanionFaction Auto Const mandatory
ObjectReference Property Lodge_RoomMarker_Library01 Auto Const mandatory
Quest Property COM_Companion_Andreja Auto Const mandatory

;-- Functions ---------------------------------------

Function AddLodgeArtifacts(Actor akActorRef)
  Int currentElement = 0
  While currentElement < LodgeArtifactsArray.Length
    Int CurrentArtifactNumber = LodgeArtifactsArray[currentElement].ArtifactNumber
    ObjectReference CurrentPlacementMarker = LodgeArtifactsArray[currentElement].PlacementMarker
    ReferenceAlias CurrentRefAlias = LodgeArtifactsArray[currentElement].ArtifactRefAlias
    ObjectReference ArtifactREF = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(CurrentArtifactNumber, CurrentPlacementMarker)
    ArtifactREF.Enable(False)
    akActorRef.AddItem(ArtifactREF as Form, 1, False)
    CurrentRefAlias.ForceRefTo(ArtifactREF)
    (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(CurrentArtifactNumber)
    currentElement += 1
  EndWhile
EndFunction

Function EnableLodgeActors()
  Actor AndrejaREF = Andreja.GetActorRef()
  Actor BarrettREF = Barrett.GetActorRef()
  Actor SamCoeREF = SamCoe.GetActorRef()
  Actor CoraCoeREF = CoraCoe.GetActorRef()
  MQ402LodgeActorsSkip.SetValueInt(1)
  AndrejaREF.AddToFaction(AvailableCompanionFaction)
  BarrettREF.AddToFaction(AvailableCompanionFaction)
  SamCoeREF.AddToFaction(AvailableCompanionFaction)
  AndrejaREF.EvaluatePackage(False)
  BarrettREF.EvaluatePackage(False)
  SamCoeREF.EvaluatePackage(False)
  CoraCoeREF.EvaluatePackage(False)
  AndrejaREF.moveto(Lodge_RoomMarker_Library01, 0.0, 0.0, 0.0, True, False)
  BarrettREF.moveto(Lodge_RoomMarker_Library01, 0.0, 0.0, 0.0, True, False)
  SamCoeREF.moveto(Lodge_RoomMarker_Library01, 0.0, 0.0, 0.0, True, False)
  CoraCoeREF.moveto(Lodge_RoomMarker_Library01, 0.0, 0.0, 0.0, True, False)
  COM_Companion_Andreja.SetStage(50)
  COM_Companion_Andreja.SetStage(100)
EndFunction
