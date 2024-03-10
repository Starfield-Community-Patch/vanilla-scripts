ScriptName SQ_TreasureMapQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property TreasureMap Auto Const mandatory
{ used by SQ_TreasureMapScript to swap dummy map with the real map with text replacement created by this quest }
ReferenceAlias Property Treasure Auto Const mandatory
{ Treasure ref passed in via event - needs to be moved to the treasure container on startup }
ReferenceAlias Property TreasureMapOriginal Auto Const mandatory
{ passed in via event - used to get properties for creating treasure }
GlobalVariable Property TreasureMapQuestCount Auto Const mandatory
{ global variable that matches this treasure map type, to keep track of how many quests are currently running }
Int Property ObjectiveID = 10 Auto Const
Int Property ObjectiveStage = 100 Auto Const

;-- Functions ---------------------------------------

Event OnQuestStarted()
  TreasureMapQuestCount.Mod(1.0)
  If Self.CreateTreasure()
    Self.SetObjectiveDisplayed(ObjectiveID, True, False)
  Else
    Game.GetPlayer().RemoveItem(TreasureMap.GetRef() as Form, 1, True, None)
    Self.Stop()
  EndIf
EndEvent

Event OnQuestShutdown()
  TreasureMapQuestCount.Mod(-1.0)
EndEvent

Event OnQuestRejected()
  Self.HandleOnQuestRejected()
EndEvent

Function HandleOnQuestRejected()
  Self.SetObjectiveDisplayed(ObjectiveID, False, False)
  Self.Stop()
EndFunction

Bool Function CreateTreasure()
  Return False
EndFunction
