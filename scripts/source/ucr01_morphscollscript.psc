ScriptName UCR01_MorphsCollScript Extends RefCollectionAlias

;-- Functions ---------------------------------------

Event OnLoad(ObjectReference akSenderRef)
  Actor currACT = akSenderRef as Actor
  If currACT as Bool && !currACT.GetNoBleedoutRecovery()
    currACT.SetNoBleedoutRecovery(True)
  EndIf
EndEvent
