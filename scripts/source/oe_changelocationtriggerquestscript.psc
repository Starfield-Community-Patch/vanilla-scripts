ScriptName OE_ChangeLocationTriggerQuestScript Extends Quest
{ finds nearby OE locations with landing markers to use to start OEs with ships }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property OE_Location Auto Const mandatory
{ OE Location to send story event for }
ReferenceAlias Property Trigger Auto Const mandatory
{ The trigger associated with the OE_Location }
Keyword Property REEncounterTypeShip Auto Const mandatory
{ keyword for starting an OE }

;-- Functions ---------------------------------------

Event OnQuestStarted()
  retriggerscript triggerRef = Trigger.GetRef() as retriggerscript
  If (triggerRef as Bool && triggerRef.IsDisabled() == False) && triggerRef.inStateOff == False
    triggerRef.StartEncounter(REEncounterTypeShip)
  ElseIf triggerRef
    
  EndIf
  Self.Stop()
EndEvent
