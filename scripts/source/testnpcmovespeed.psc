ScriptName TestNPCMoveSpeed Extends ObjectReference

;-- Variables ---------------------------------------
Int I = 0

;-- Properties --------------------------------------
ObjectReference Property SpawnController Auto Const mandatory
Keyword[] Property DestinationLocationKeywords Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If I < DestinationLocationKeywords.Length - 1
    I += 1
  Else
    I = 0
  EndIf
  (SpawnController as testnpcarenascript).SetPatrolSpeed(DestinationLocationKeywords[I])
EndEvent
