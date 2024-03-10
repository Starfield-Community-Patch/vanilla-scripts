ScriptName SetStageOnPowered Extends ObjectReference Const
{ Set a quest stage when all linked elements are powered. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property myQuest Auto Const mandatory
Int Property questStage Auto Const mandatory
Int Property prereqQuestStage = -1 Auto Const
Keyword Property LinkToPoweredReferences Auto Const mandatory

;-- Functions ---------------------------------------

Event OnCellLoad()
  ObjectReference[] refsLinkedToMe = Self.GetRefsLinkedToMe(LinkToPoweredReferences, None)
  Int I = 0
  While I < refsLinkedToMe.Length
    Self.RegisterForRemoteEvent(refsLinkedToMe[I] as ScriptObject, "OnPowerOn")
    I += 1
  EndWhile
EndEvent

Event ObjectReference.OnPowerOn(ObjectReference akSender, ObjectReference akPowerGenerator)
  Bool allPowered = True
  Int I = 0
  ObjectReference[] refsLinkedToMe = Self.GetRefsLinkedToMe(LinkToPoweredReferences, None)
  While I < refsLinkedToMe.Length
    If refsLinkedToMe[I]
      If refsLinkedToMe[I].IsPowered() == False
        allPowered = False
      EndIf
    EndIf
    I += 1
  EndWhile
  If allPowered == True
    If prereqQuestStage == -1 || myQuest.GetStageDone(prereqQuestStage)
      myQuest.SetStage(questStage)
    EndIf
  EndIf
EndEvent

Event OnUnload()
  Self.UnregisterForAllEvents()
EndEvent
