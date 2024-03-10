ScriptName COM_SMQ01_AliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group StagesAndIndices
  Int Property GenetagSearchStage = 120 Auto Const
  { Once this stage is set, start tracking the player's collection of Genetags }
  Int Property GenetagObjectiveStartStage = 160 Auto Const
  { Once this stage is set, start displaying the Objective with the count of Genetags }
  Int Property GenetagObjIndex = 160 Auto Const
  { Objective index we need to update each time the player collects Genetags }
  Int Property SpawnBoss = 165 Auto Const
  { Stage to set once the player's got enough Genetags to spawn the final boss }
  Int Property CompletionStage = 170 Auto Const
  { Stage to set once the player's got enough Genetags to finish this portion of the quest }
EndGroup

Group Globals
  GlobalVariable Property COM_SMQ01_GenetagsCollected Auto Const mandatory
  { Global var used to track how many Genetags the player has collected }
  GlobalVariable Property COM_SMQ01_GenetagsTotal Auto Const mandatory
  { Global var used to know how many Genetags we want the player to collect }
  GlobalVariable Property COM_SMQ01_GenetagsSpawnTotal Auto Const mandatory
  { Global var used to know how many Genetags we want the player to collect before spawning the boss }
EndGroup

Group Objects
  MiscObject Property COM_SMQ01_Genetag Auto Const mandatory
  { Genetag misc object }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If auiStageID == GenetagSearchStage
    Self.UnregisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
    Self.RegisterPlayerForGentagPickup()
  EndIf
EndEvent

Function RegisterPlayerForGentagPickup()
  Self.AddInventoryEventFilter(COM_SMQ01_Genetag as Form)
EndFunction

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  Quest myQuest = Self.GetOwningQuest()
  If myQuest.GetStageDone(GenetagObjectiveStartStage)
    myQuest.ModObjectiveGlobal(aiItemCount as Float, COM_SMQ01_GenetagsCollected, GenetagObjIndex, -1.0, True, True, True, False)
    Self.SpawnBossOrEnd()
  Else
    COM_SMQ01_GenetagsCollected.Mod(1.0)
  EndIf
EndEvent

Function SpawnBossOrEnd()
  Quest myQuest = Self.GetOwningQuest()
  Int collected = COM_SMQ01_GenetagsCollected.GetValueInt()
  If collected as Float == COM_SMQ01_GenetagsSpawnTotal.GetValue()
    myQuest.SetStage(SpawnBoss)
  ElseIf collected as Float >= COM_SMQ01_GenetagsTotal.GetValue()
    myQuest.SetStage(CompletionStage)
  EndIf
EndFunction
