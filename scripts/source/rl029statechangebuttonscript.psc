ScriptName RL029StateChangeButtonScript Extends ObjectReference
{ Script for the tree state change in RL029. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property EnableMarkerRef1 Auto Const mandatory
ObjectReference Property EnableMarkerRef2 Auto Const mandatory
ObjectReference Property EnableMarkerRef3 Auto Const mandatory
ObjectReference Property PipeRef Auto Const mandatory
ObjectReference Property SoundLocPump Auto Const mandatory
ObjectReference Property SoundLocBig1 Auto Const mandatory
ObjectReference Property SoundLocBig2 Auto Const mandatory
ObjectReference Property SoundLocSmall1 Auto Const mandatory
ObjectReference Property SoundLocSmall2 Auto Const mandatory
wwiseevent Property WiseEventWaterPump Auto Const mandatory
wwiseevent Property WiseEventBigTree1 Auto Const mandatory
wwiseevent Property WiseEventBigTree2 Auto Const mandatory
wwiseevent Property WiseEventSmallTree1 Auto Const mandatory
wwiseevent Property WiseEventSmallTree2 Auto Const mandatory

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActionRef)
    Self.GoToState("Done")
    PipeRef.DamageObject(2000.0)
    Utility.wait(1.0)
    WiseEventWaterPump.Play(SoundLocPump, None, None)
    EnableMarkerRef1.Enable(False)
    EnableMarkerRef3.Enable(False)
    Utility.wait(2.0)
    EnableMarkerRef2.Enable(False)
    Utility.wait(3.0)
    WiseEventBigTree1.Play(SoundLocBig1, None, None)
    Game.ShakeCamera(None, 0.5, 0.0)
    Utility.wait(2.0)
    Game.ShakeCamera(None, 0.5, 0.0)
    Utility.wait(4.0)
    WiseEventBigTree2.Play(SoundLocBig2, None, None)
    Game.ShakeCamera(None, 0.5, 0.0)
    Utility.wait(10.0)
    WiseEventSmallTree1.Play(SoundLocSmall1, None, None)
    Utility.wait(7.0)
    WiseEventSmallTree2.Play(SoundLocSmall2, None, None)
  EndEvent
EndState
