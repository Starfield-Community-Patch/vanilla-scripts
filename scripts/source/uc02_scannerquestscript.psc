ScriptName UC02_ScannerQuestScript Extends Quest

;-- Variables ---------------------------------------
Int iTimerID = 1 Const

;-- Properties --------------------------------------
Int Property WWiseEventInstanceID Auto
{ Float used to hang onto the instance ID of the WWise event kicked off with the Terrormorph }
Int Property DistanceDisplayFrequency = 5 Auto Const
{ How many second to wait between displays of the distance message while this quest is running }
Int Property PrereqStage = 110 Auto Const
{ Need to wait until this stage it set before we want to start showing this message }
Int Property ShutdownStage = 1000 Auto Const
{ If this stage is done, stop trying to display the message }
Message Property UC02_DistanceToMorph Auto Const mandatory
{ Message object used to display the current distance between player and beast }
ReferenceAlias Property Terrormorph Auto Const mandatory
{ Ref alias for the Terrormorph }

;-- Functions ---------------------------------------

Function DisplayDistanceMessage()
  If Self.GetStageDone(PrereqStage) && !Self.GetStageDone(ShutdownStage)
    Int iDistance = Game.GetPlayer().GetDistance(Terrormorph.GetRef()) as Int
    UC02_DistanceToMorph.Show(iDistance as Float, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    Self.StartTimer(DistanceDisplayFrequency as Float, iTimerID)
  EndIf
EndFunction

Event OnTimer(Int aiTimerID)
  Self.DisplayDistanceMessage()
EndEvent
