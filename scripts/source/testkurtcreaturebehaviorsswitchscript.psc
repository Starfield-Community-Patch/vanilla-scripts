ScriptName TestKurtCreatureBehaviorsSwitchScript Extends ObjectReference

;-- Variables ---------------------------------------
testkurtcreaturebehaviorscript myQuest

;-- Properties --------------------------------------
Message Property TestKurtCreatureBehaviorMessage Auto Const mandatory
{ message box for player choices }
Keyword Property TestKurtCreatureBehaviorKeyword Auto Const
Int Property CreatureRigIndex = 7 Auto
{ what rig to create from this button? }
Int Property ResetMessageIndex = 9 Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Int messageIndex = TestKurtCreatureBehaviorMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Self.StartQuest()
  If messageIndex == ResetMessageIndex
    myQuest.ResetCreatures()
  ElseIf messageIndex > -1
    myQuest.CreateCreature(messageIndex)
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
    myQuest = TestKurtCreatureBehaviorKeyword.SendStoryEventAndWait(None, Self as ObjectReference, Self.GetLinkedRef(None), CreatureRigIndex, 0)[0] as testkurtcreaturebehaviorscript
  EndIf
EndFunction

Event OnUnload()
  If myQuest
    myQuest.Stop()
    myQuest = None
  EndIf
EndEvent
