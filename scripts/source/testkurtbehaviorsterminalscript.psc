ScriptName TestKurtBehaviorsTerminalScript Extends TerminalMenu

;-- Variables ---------------------------------------
testkurtcreaturebehaviorscript myQuest
ObjectReference myTerminal

;-- Properties --------------------------------------
TerminalMenu Property TestKurtCreatureBehavior_BehaviorList Auto Const mandatory
{ terminal for behaviors }
TerminalMenu Property TestKurtCreatureBehavior_RigList Auto Const mandatory
{ terminal for rigs }
Keyword Property TestKurtCreatureBehaviorKeyword Auto Const
Int Property CreatureRigIndex = 7 Auto
{ what rig to create from this button? }
Int Property Behavior_ResetID = 12 Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  If myTerminal == None
    myTerminal = akTerminalRef
    Self.RegisterForRemoteEvent(akTerminalRef as ScriptObject, "OnUnload")
    Self.StartQuest()
  EndIf
EndEvent

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  If akTerminalBase == TestKurtCreatureBehavior_BehaviorList
    If auiMenuItemID == Behavior_ResetID
      myQuest.ResetCreatures()
    Else
      Int creatureIndex = auiMenuItemID - 1
      myQuest.CreateCreature(creatureIndex)
    EndIf
  ElseIf akTerminalBase == TestKurtCreatureBehavior_RigList
    Self.ChangeRig(auiMenuItemID - 1)
  EndIf
EndEvent

Function ChangeRig(Int newRigIndex)
  myQuest.ResetCreatures()
  myQuest.Stop()
  myQuest = None
  CreatureRigIndex = newRigIndex
  Self.StartQuest()
EndFunction

Function StartQuest()
  If myQuest == None
    Quest[] questArray = TestKurtCreatureBehaviorKeyword.SendStoryEventAndWait(None, myTerminal, myTerminal.GetLinkedRef(None), CreatureRigIndex, 0)
    If questArray.Length > 0
      myQuest = questArray[0] as testkurtcreaturebehaviorscript
    EndIf
  EndIf
EndFunction

Event ObjectReference.OnUnload(ObjectReference akSource)
  If myQuest
    myQuest.Stop()
    myQuest = None
  EndIf
  myTerminal = None
EndEvent
