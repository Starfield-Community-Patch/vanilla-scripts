ScriptName TestJeffBBossBattleControlScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool StopTeleporting = False
Bool foundLocation = False
ObjectReference[] myLocations
Int myPreviousLocation = 0
Int myTimerID = 0
Int rand

;-- Properties --------------------------------------
testjeffbbossbattlescript Property myBoss Auto Const
Float Property myTimer = 5.0 Auto Const
Explosion Property myExplosion Auto Const
Explosion Property myTeleportFX Auto Const
wwiseevent Property mySoundEvent Auto Const
Float Property myScale = 2.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  myLocations = Self.GetLinkedRefChain(None, 100)
  Self.RegisterForCustomEvent(myBoss as ScriptObject, "testjeffbbossbattlescript_ScaleBoss")
  Self.RegisterForCustomEvent(myBoss as ScriptObject, "testjeffbbossbattlescript_StartTeleporting")
  Self.RegisterForCustomEvent(myBoss as ScriptObject, "testjeffbbossbattlescript_StopTeleporting")
EndEvent

Event TestJeffBBossBattleScript.ScaleBoss(testjeffbbossbattlescript akSender, Var[] akArgs)
  Self.UnregisterForCustomEvent(myBoss as ScriptObject, "testjeffbbossbattlescript_ScaleBoss")
  myBoss.setScale(myScale)
EndEvent

Event TestJeffBBossBattleScript.StartTeleporting(testjeffbbossbattlescript akSender, Var[] akArgs)
  Self.UnregisterForCustomEvent(myBoss as ScriptObject, "testjeffbbossbattlescript_StartTeleporting")
  Self.MoveBoss()
EndEvent

Event TestJeffBBossBattleScript.StopTeleporting(testjeffbbossbattlescript akSender, Var[] akArgs)
  Self.UnregisterForCustomEvent(myBoss as ScriptObject, "testjeffbbossbattlescript_StopTeleporting")
  StopTeleporting = True
  Self.CancelTimer(myTimerID)
  myBoss.moveto(myBoss.GetLinkedRef(None), 0.0, 0.0, 0.0, True, False)
  mySoundEvent.PlayAndWait(myBoss as ObjectReference, None, None)
  myBoss.PlaceAtMe(myExplosion as Form, 1, False, False, True, None, None, True)
  myBoss.DisableNoWait(False)
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == myTimerID && StopTeleporting == False
    foundLocation = False
    Self.MoveBoss()
  EndIf
EndEvent

Function MoveBoss()
  While foundLocation == False
    rand = Utility.RandomInt(1, myLocations.Length)
    If rand != myPreviousLocation
      foundLocation = True
      If StopTeleporting == False
        myBoss.PlaceAtMe(myTeleportFX as Form, 1, False, False, True, None, None, True)
        myBoss.moveto(myLocations[rand], 0.0, 0.0, 0.0, True, False)
        myBoss.PlaceAtMe(myTeleportFX as Form, 1, False, False, True, None, None, True)
        Self.StartTimer(myTimer, myTimerID)
      EndIf
      myPreviousLocation = rand
    Else
      Utility.wait(0.01)
    EndIf
  EndWhile
EndFunction
