ScriptName TestSpaceshipReferenceScript Extends SpaceshipReference Const

;-- Functions ---------------------------------------

Event OnCombatStateChanged(ObjectReference akTarget, Int aeCombatState)
  ; Empty function
EndEvent

Event OnDestroyed(ObjectReference akDestroyer)
  ; Empty function
EndEvent

Event OnUnload()
  ; Empty function
EndEvent

Function TestFaction(Faction akFaction)
  ; Empty function
EndFunction

Function TestLanding()
  ; Empty function
EndFunction

Function TestDocking()
  SpaceshipReference dockedShip = Self.GetFirstDockedShip()
  If dockedShip != None
    
  EndIf
EndFunction

String Function GetPartName(Int aiPartIndex)
  If aiPartIndex == 0
    Return "weapon"
  ElseIf aiPartIndex == 1
    Return "engine"
  ElseIf aiPartIndex == 2
    Return "shields"
  ElseIf aiPartIndex == 3
    Return "grav drive"
  EndIf
EndFunction

Function TestPowerAllocation()
  Int partType = 0
  While partType < 4
    Int partCount = Self.GetPartCount(partType)
    Int partIndex = 0
    While partIndex < partCount
      Int power = Self.GetPartPower(partType, partIndex)
      partIndex += 1
    EndWhile
    partType += 1
  EndWhile
EndFunction
