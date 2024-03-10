ScriptName CF02_RestartTourOnActivate Extends ReferenceAlias

;-- Structs -----------------------------------------
Struct TourScene
  Scene sceneToStart
  Int requiredStage
  Int turnOffStage
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
cf02_restarttouronactivate:tourscene[] Property TourScenes Auto Const mandatory
Int Property DoneStage Auto Const mandatory
{ Scene to change to done state }

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActionRef)
    Self.goToState("Done")
    Quest pQuest = Self.GetOwningQuest()
    If pQuest.GetStageDone(DoneStage)
      Return 
    ElseIf akActionRef == Game.GetPlayer() as ObjectReference
      Int I = 0
      While I < TourScenes.Length
        cf02_restarttouronactivate:tourscene TourSceneData = TourScenes[I]
        If pQuest.GetStageDone(TourSceneData.requiredStage) && !pQuest.GetStageDone(TourSceneData.turnOffStage) && !TourSceneData.sceneToStart.IsPlaying()
          TourSceneData.sceneToStart.Start()
          Self.goToState("Waiting")
          Return 
        EndIf
        I += 1
      EndWhile
    EndIf
    Self.goToState("Waiting")
  EndEvent
EndState
