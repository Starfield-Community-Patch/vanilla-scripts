ScriptName PlayerChangeLocationScript Extends Actor Const
{ Send events when the player changes locations
  For now specifically to get the PlayerShipQuest to run - possibly temp solution? }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property PlayerShipQuestKeyword Auto Const

;-- Functions ---------------------------------------

Event OnEnterShipInterior(ObjectReference akShip)
  PlayerShipQuestKeyword.SendStoryEvent(None, akShip, None, 0, 0)
EndEvent
