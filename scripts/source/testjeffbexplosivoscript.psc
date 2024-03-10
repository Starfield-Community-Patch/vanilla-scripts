ScriptName TestJeffBExplosivoScript Extends ObjectReference

;-- Variables ---------------------------------------
ObjectReference[] myArray
ObjectReference[] myTempArray
Int numExplosionMarkers = 0

;-- Properties --------------------------------------
Explosion Property myExplosion Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  numExplosionMarkers = Self.CountLinkedRefChain(None, 100)
  myArray = new ObjectReference[numExplosionMarkers]
  myTempArray = new ObjectReference[numExplosionMarkers]
  Int I = 0
  While I < numExplosionMarkers
    myArray[I] = Self.getNthLinkedRef(I + 1, None)
    I += 1
  EndWhile
EndEvent

Function RandomExplosions()
  Int I = 0
  While I < numExplosionMarkers
    Int rand = Utility.randomint(0, myArray.Length - 1)
    myTempArray[I] = myArray[rand]
    myArray.remove(rand, 1)
    I += 1
  EndWhile
  I = 0
  While I < numExplosionMarkers
    myArray.add(myTempArray[I], 1)
    I += 1
  EndWhile
EndFunction

;-- State -------------------------------------------
State DoNothing

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.getPlayer() as ObjectReference
      Self.GotoState("DoNothing")
      Self.RandomExplosions()
      Int I = 0
      While I < numExplosionMarkers
        myArray[I].placeatme(myExplosion as Form, 1, False, False, True, None, None, True)
        Float rand = Utility.RandomFloat(0.5, 3.0)
        Utility.Wait(rand)
        I += 1
      EndWhile
      Self.GotoState("Waiting")
    EndIf
  EndEvent
EndState
