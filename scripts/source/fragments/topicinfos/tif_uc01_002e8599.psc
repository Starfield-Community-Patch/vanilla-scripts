ScriptName Fragments:TopicInfos:TIF_UC01_002E8599 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property MostRecentSceneMarker Auto Const mandatory
ReferenceAlias Property SectorASceneMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  MostRecentSceneMarker.ForceRefTo(SectorASceneMarker.GetRef())
EndFunction
