ScriptName UC05_CollPowerSwitchScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property AllPowerBackOnStage = 600 Auto Const
{ All power's back on. Set the player up to head downstairs }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  Self.RemoveRef(akSenderRef)
  If Self.GetCount() == 0
    Self.GetOwningQuest().SetStage(AllPowerBackOnStage)
  EndIf
EndEvent
