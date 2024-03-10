ScriptName LoadElevatorFloorNamesScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group TwoFloorElevator
{ Only set these properties if your elevator has exactly two floors. }
  Message Property Floor0Name Auto Const
  Message Property Floor1Name Auto Const
EndGroup

Group ThreeOrMoreFloorElevator
{ Only set these properties if your elevator has three or more floors. }
  Message Property FloorNameList Auto Const
EndGroup


;-- Functions ---------------------------------------

Message Function GetFloor0Name()
  Return Floor0Name
EndFunction

Message Function GetFloor1Name()
  Return Floor1Name
EndFunction

Message Function GetFloorNameList()
  Return FloorNameList
EndFunction
