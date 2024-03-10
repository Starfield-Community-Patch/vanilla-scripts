ScriptName DebugSound_SwitchAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property ButtonIndex Auto Const mandatory
{ Which button functionality this object should trigger }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  (Self.GetOwningQuest() as debugsoundscriptingquest).TriggerButtonBehavior(ButtonIndex)
EndEvent
