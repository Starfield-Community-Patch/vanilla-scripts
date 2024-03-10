ScriptName SQ_SurveySlateQuestScript Extends Quest

;-- Variables ---------------------------------------
Int iSlateAdded = 0
Int iSurveyPercent = 0
Bool questStarted = False
Int waitforStartTimerID = 1 Const

;-- Properties --------------------------------------
Message Property SQ_SurveySlateAddedMessage Auto Const mandatory
Message Property SQ_SurveySlateReplacedMessage Auto Const mandatory
Int Property SaveInstanceDataStage = 10 Auto Const

;-- Functions ---------------------------------------

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, Int aiValue1, Int aiValue2)
  iSlateAdded = aiValue1
  iSurveyPercent = aiValue2
  If iSlateAdded > 0
    SQ_SurveySlateAddedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Else
    SQ_SurveySlateReplacedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
  Self.SetStage(SaveInstanceDataStage)
  Self.Stop()
EndEvent
