ScriptName UC03_PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group StagesAndIndices
  Int Property BloodstoneHuntStage = 810 Auto Const
  { Once this stage is set, start tracking the player's collection of Bloodstone }
  Int Property CompletionStage = 820 Auto Const
  { Stage to set once the player's got enough Bloodstone }
EndGroup

Group Objects
  MiscObject Property InorgUniqueBloodstone Auto Const mandatory
  { Bloodstone misc object }
EndGroup

Group Aliases
  ReferenceAlias Property HematiteQuestItem Auto Const mandatory
  { Holding alias for the Hematite misc object the player acquires }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
EndEvent

Function RegisterPlayerForBloodstoneCollection()
  Self.AddInventoryEventFilter(InorgUniqueBloodstone as Form)
EndFunction

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If akBaseItem == InorgUniqueBloodstone as Form
    Quest myInst = Self.GetOwningQuest()
    Game.GetPlayer().RemoveItem(InorgUniqueBloodstone as Form, 1, True, None)
    Game.GetPlayer().AddAliasedItem(InorgUniqueBloodstone as Form, HematiteQuestItem as Alias, 1, True)
    Self.RemoveInventoryEventFilter(InorgUniqueBloodstone as Form)
    If myInst.GetStageDone(BloodstoneHuntStage)
      myInst.SetStage(CompletionStage)
    EndIf
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
