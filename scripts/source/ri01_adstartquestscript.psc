ScriptName RI01_AdStartQuestScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RI01 Auto Const mandatory
Message Property RI01_AdMessage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If !RI01.IsActive() && !RI01.IsCompleted()
    RI01_AdMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    RI01.Start()
  EndIf
EndEvent
