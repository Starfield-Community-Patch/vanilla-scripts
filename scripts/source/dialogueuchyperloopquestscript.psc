ScriptName DialogueUCHyperloopQuestScript Extends Quest conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property DepartureLocation Auto conditional
Int Property ArrivalLocation Auto conditional
ReferenceAlias Property Speaker_Spaceport Auto Const

;-- Functions ---------------------------------------

Function UpdateDeparture()
  If Game.GetPlayer().GetDistance(Speaker_Spaceport.GetRef()) < 10.0
    DepartureLocation = 1
  EndIf
EndFunction
