ScriptName TestKurtFormationsSwitchScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Variable01 Auto Const mandatory
Message Property TestKurtFormationMessageBox Auto Const
Keyword Property TestKurtButtonKeyword Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Int messageIndex = TestKurtFormationMessageBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Self.UpdateLinkedRefs(messageIndex)
EndEvent

Function UpdateLinkedRefs(Int messageIndex)
  ObjectReference[] myLinkedRefs = Self.GetRefsLinkedToMe(TestKurtButtonKeyword, None)
  Int I = 0
  While I < myLinkedRefs.Length
    Actor myLinkedActor = myLinkedRefs[I] as Actor
    If myLinkedActor
      myLinkedActor.SetValue(Variable01, messageIndex as Float)
      myLinkedActor.EvaluatePackage(False)
    EndIf
    I += 1
  EndWhile
  TestKurtFormationsSwitchScript myLinkedButton = Self.GetLinkedRef(None) as TestKurtFormationsSwitchScript
  If myLinkedButton
    myLinkedButton.UpdateLinkedRefs(messageIndex)
  EndIf
EndFunction
