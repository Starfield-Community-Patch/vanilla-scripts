ScriptName UC01_PilotExamSeatScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC01 Auto Const mandatory
{ Property for the UC01 quest }
Int Property AccessStage = 410 Auto Const
{ Once the player has completed this stage in UC01, they can access this }
Quest Property UC01_ShipSimulatorHelperQuest Auto Const mandatory
{ Helper quest that handles getting the player into the sim }
Scene Property DialogueUCFaction_Recruitment_999_PilotSeat Auto Const mandatory
{ Scene to play if the player gets here early }

;-- Functions ---------------------------------------

Event OnLoad()
  If !UC01.GetStageDone(AccessStage)
    Self.BlockActivation(True, True)
  EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    If UC01.GetStageDone(410)
      Utility.Wait(0.5)
      UC01_ShipSimulatorHelperQuest.Start()
    ElseIf !DialogueUCFaction_Recruitment_999_PilotSeat.IsPlaying()
      DialogueUCFaction_Recruitment_999_PilotSeat.Start()
    EndIf
  EndIf
EndEvent
