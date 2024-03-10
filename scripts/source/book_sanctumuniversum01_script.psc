ScriptName Book_SanctumUniversum01_Script Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_NA_Aquilus01 Auto Const mandatory
GlobalVariable Property City_NA_Aquilus01_BookRead Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference ActionRef)
  If ActionRef == Game.GetPlayer() as ObjectReference
    If City_NA_Aquilus01.GetStageDone(100) == True
      City_NA_Aquilus01.SetStage(300)
    EndIf
  EndIf
EndEvent

Event OnRead()
  If City_NA_Aquilus01_BookRead.GetValue() == 0.0
    City_NA_Aquilus01_BookRead.SetValue(1.0)
  EndIf
EndEvent
