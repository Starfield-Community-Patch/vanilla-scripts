ScriptName CF07_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property TalkToCompanion = 450 Auto Const
ReferenceAlias Property Companion Auto Const mandatory
GlobalVariable Property CF_SysDefShutdown Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Companion as ScriptObject, "OnAliasChanged")
EndEvent

Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, Bool abRemove)
  If Self.GetStageDone(500) == True
    If CF_SysDefShutdown.GetValue() == 0.0
      If akSender == Companion && Self.IsObjectiveCompleted(TalkToCompanion) == False
        If Companion.GetReference() == None
          Self.SetObjectiveDisplayed(TalkToCompanion, False, False)
        Else
          Self.SetObjectiveDisplayed(TalkToCompanion, True, False)
        EndIf
      EndIf
    EndIf
  EndIf
EndEvent
