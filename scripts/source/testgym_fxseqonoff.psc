ScriptName TestGym_FXSeqOnOff Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
String Property SeqName = "TestSmoothLoop01" Auto
Bool Property OnOff = False Auto
ObjectReference Property TargetArt Auto

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If OnOff == True
    OnOff = False
    TargetArt.StopSequence(SeqName)
  ElseIf OnOff == False
    OnOff = True
    TargetArt.StartSequence(SeqName, True, 1.0)
  EndIf
EndEvent
