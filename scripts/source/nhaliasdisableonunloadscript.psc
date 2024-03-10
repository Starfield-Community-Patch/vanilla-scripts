ScriptName NHAliasDisableOnUnloadScript Extends ReferenceAlias
{ Used when the NPCs leave the interior during the Establishing scene }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StagePrereq Auto Const mandatory

;-- Functions ---------------------------------------

Event OnUnload()
  If Self.GetOwningQuest().GetStageDone(StagePrereq)
    Self.GetRef().Disable(False)
  EndIf
EndEvent
