ScriptName WalkInWaterFX Extends ObjectReference
{ Add an fx when in the water }

;-- Variables ---------------------------------------
ObjectReference mySplash
Bool playFX = False
Actor primeIntrigger

;-- Properties --------------------------------------
Activator Property pLibertyPrimeWaterSplash Auto Const
Race Property LibertyPrimeRace Auto Const
Int Property WaterHeight = 450 Auto

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If (akActionRef as Actor).GetRace() == LibertyPrimeRace && playFX == False
    primeIntrigger = akActionRef as Actor
    playFX = True
    mySplash = primeIntrigger.placeatme(pLibertyPrimeWaterSplash as Form, 1, False, False, True, None, None, True)
  EndIf
  While playFX == True
    mySplash.SetPosition(primeIntrigger.GetPositionX(), primeIntrigger.GetPositionY(), WaterHeight as Float)
    Utility.wait(0.050000001)
  EndWhile
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  If (akActionRef as Actor).GetRace() == LibertyPrimeRace && playFX == True
    playFX = False
    mySplash.playAnimation("StopEffect")
    Utility.wait(0.300000012)
    mySplash = None
    mySplash.delete()
  EndIf
EndEvent
