ScriptName TestBountyBoardScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest[] Property Missions Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Int currentElement = 0
  While currentElement < Missions.Length
    If Missions[currentElement].IsRunning() == False
      Missions[currentElement].Start()
    EndIf
    currentElement += 1
  EndWhile
EndEvent
