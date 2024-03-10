ScriptName MQ206ALodgeBedScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property MessageToShow Auto Const mandatory
Int Property Button1StageToSet = 17 Auto Const
Int Property PrereqStageDone = 15 Auto Const
Int Property TurnOffStageDone = 20 Auto Const
Int Property TurnOffStageDone02 = 30 Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    Quest myQuest = Self.GetOwningQuest()
    If myQuest.GetStageDone(PrereqStageDone) && myQuest.GetStageDone(TurnOffStageDone) == False && myQuest.GetStageDone(TurnOffStageDone02) == False
      Int iButton = MessageToShow.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      If iButton == 1
        myQuest.SetStage(Button1StageToSet)
      EndIf
    EndIf
  EndIf
EndEvent
