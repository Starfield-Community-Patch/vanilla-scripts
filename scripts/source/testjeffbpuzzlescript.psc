ScriptName TestJeffBPuzzleScript Extends ObjectReference

;-- Variables ---------------------------------------
Int counter = 0
ObjectReference myDoor
Int myTimerID = 0
ObjectReference player
Bool timerStarted = False

;-- Properties --------------------------------------
ObjectReference Property button01 Auto Const
ObjectReference Property button02 Auto Const
ObjectReference Property button03 Auto Const
ObjectReference Property MasterButton Auto Const
Int Property NumberOfButtons Auto Const
wwiseevent Property SoundSuccessEvent Auto Const
wwiseevent Property SoundFailEvent Auto Const
Message Property myMessage Auto Const
Float Property myTimer = 10.0 Auto

;-- Functions ---------------------------------------

Event OnLoad()
  player = Game.GetPlayer() as ObjectReference
  myDoor = Self.getLinkedRef(None)
  Self.RegisterForRemoteEvent(button01 as ScriptObject, "OnActivate")
  Self.RegisterForRemoteEvent(button02 as ScriptObject, "OnActivate")
  Self.RegisterForRemoteEvent(button03 as ScriptObject, "OnActivate")
  Self.RegisterForRemoteEvent(MasterButton as ScriptObject, "OnActivate")
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  If akActionRef == player
    If timerStarted == False
      timerStarted = True
      Self.StartTimer(myTimer, myTimerID)
    EndIf
    If akSender == button01
      counter = 1
    ElseIf akSender == button02
      If counter == 1
        counter += 1
      Else
        Self.ResetPuzzle()
      EndIf
    ElseIf akSender == button03
      If counter == 2
        counter += 1
      Else
        Self.ResetPuzzle()
      EndIf
    ElseIf akSender == MasterButton
      If counter == NumberOfButtons
        Self.UnRegisterForRemoteEvent(button01 as ScriptObject, "OnActivate")
        Self.UnRegisterForRemoteEvent(button02 as ScriptObject, "OnActivate")
        Self.UnRegisterForRemoteEvent(button03 as ScriptObject, "OnActivate")
        Self.UnRegisterForRemoteEvent(MasterButton as ScriptObject, "OnActivate")
        Int SoundSuccessID = SoundSuccessEvent.play(myDoor, None, None)
        myDoor.setOpen(True)
      Else
        Int SoundFailID = SoundFailEvent.play(myDoor, None, None)
        Self.ResetPuzzle()
      EndIf
    EndIf
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == myTimerID
    myMessage.show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndEvent

Function ResetPuzzle()
  counter = 0
  Self.RegisterForRemoteEvent(button01 as ScriptObject, "OnActivate")
  Self.RegisterForRemoteEvent(button02 as ScriptObject, "OnActivate")
  Self.RegisterForRemoteEvent(button03 as ScriptObject, "OnActivate")
EndFunction
