ScriptName SQ_CCT_Enviro_AmbusherScript Extends Quest

;-- Structs -----------------------------------------
Struct AmbushData
  ReferenceAlias AmbushMarker
  ReferenceAlias Prey
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SQ_CCT_Enviro_AmbusherScene Auto Const mandatory
{ scene to start once target is initialized }
sq_cct_enviro_ambusherscript:ambushdata[] Property AmbushMarkers Auto Const mandatory
{ array of ambush markers and nearest prey }
ReferenceAlias Property BehaviorActor Auto Const mandatory
{ ambusher }
ReferenceAlias Property BehaviorTarget Auto Const mandatory
{ ambush marker to use - fill in with one that's farthest from prey }
RefCollectionAlias Property BehaviorActorHerd Auto Const
{ OPTIONAL - used for herd actors }

;-- Functions ---------------------------------------

Event OnQuestStarted()
  ObjectReference actorRef = BehaviorActor.GetRef()
  ObjectReference targetRef = BehaviorTarget.GetRef()
  Int h = 0
  While h < BehaviorActorHerd.GetCount()
    h += 1
  EndWhile
  Float minDistance = 0.0
  ObjectReference bestMarker = None
  Int I = 0
  While I < AmbushMarkers.Length
    ObjectReference AmbushMarker = AmbushMarkers[I].AmbushMarker.GetRef()
    ObjectReference preyRef = AmbushMarkers[I].Prey.GetRef()
    If AmbushMarker as Bool && preyRef as Bool
      Float preyDistance = AmbushMarker.GetDistance(preyRef)
      If preyDistance > minDistance
        minDistance = preyDistance
        bestMarker = AmbushMarker
      EndIf
    EndIf
    I += 1
  EndWhile
  If bestMarker
    BehaviorTarget.ForceRefTo(bestMarker)
  EndIf
  SQ_CCT_Enviro_AmbusherScene.Start()
EndEvent
