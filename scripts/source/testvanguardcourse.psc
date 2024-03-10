ScriptName TestVanguardCourse Extends ObjectReference

;-- Variables ---------------------------------------
Bool But1p
Bool But2p
Bool But3p
Bool ButCh
Int curTime = 0

;-- Properties --------------------------------------
ObjectReference Property Button1 Auto Const mandatory
ObjectReference Property Button2 Auto Const mandatory
ObjectReference Property Button3 Auto Const mandatory
ObjectReference Property CheatButton Auto Const mandatory
ObjectReference Property ExitDoor Auto Const mandatory

;-- Functions ---------------------------------------

Event OnInit()
  Self.RegisterForRemoteEvent(Button1 as ScriptObject, "OnActivate")
  Self.RegisterForRemoteEvent(Button2 as ScriptObject, "OnActivate")
  Self.RegisterForRemoteEvent(Button3 as ScriptObject, "OnActivate")
  Self.RegisterForRemoteEvent(CheatButton as ScriptObject, "OnActivate")
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  Self.CourseTime()
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  If akSender == Button1 && But1p == False
    But1p = True
    Self.exitTest()
  EndIf
  If akSender == Button2 && But2p == False
    But2p = True
    Self.exitTest()
  EndIf
  If akSender == Button3 && But3p == False
    But3p = True
    Self.exitTest()
  EndIf
  If akSender == CheatButton && ButCh == False
    ButCh = True
  EndIf
EndEvent

Function exitTest()
  If But1p && But2p && But3p
    ExitDoor.SetOpen(True)
    If ButCh == True
      
    EndIf
  EndIf
EndFunction

Function CourseTime()
  While But1p == False && But2p == False && But3p == False
    Utility.Wait(1.0)
    curTime += 1
  EndWhile
EndFunction
