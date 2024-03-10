ScriptName LC115CombatStateChange Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group QuestStages_Properties
  Int Property iLC115Hostile = 10 Auto Const
  Int Property iLC115Shutdown = 1000 Auto Const
  Int Property iRI05FindImogene = 600 Auto Const
  Int Property iRI05TalkToDalton = 1200 Auto Const
EndGroup

Quest Property RI05 Auto Const mandatory
GlobalVariable Property RI05_LC115PreviouslyExplored Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad(ObjectReference akSenderRef)
  Self.RegisterForRemoteEvent(Self as ScriptObject, "OnCombatStateChanged")
EndEvent

Event OnCombatStateChanged(ObjectReference akSenderRef, ObjectReference akTarget, Int aeCombatState)
  If aeCombatState > 0
    If RI05.GetStageDone(iRI05FindImogene) && !RI05.GetStageDone(iRI05TalkToDalton)
      Self.GetOwningQuest().SetStage(iLC115Hostile)
    Else
      RI05_LC115PreviouslyExplored.SetValue(1.0)
      Self.GetOwningQuest().SetStage(iLC115Shutdown)
    EndIf
  EndIf
EndEvent
