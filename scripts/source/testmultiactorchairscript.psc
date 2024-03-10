ScriptName TestMultiActorChairScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property TestMultiActorMSG Auto Const
ObjectReference Property FirstPerson Auto Const
ObjectReference Property SecondPerson Auto Const
ObjectReference Property SidebySide Auto Const
ObjectReference Property Width Auto Const
ObjectReference Property Depth Auto Const
ObjectReference Property Combo Auto Const
ObjectReference Property FirstMarker Auto Const
Scene Property TestTwoPersonSceneNonPlayerScene Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    Int ButtonValue = TestMultiActorMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    If ButtonValue == 0
      SecondPerson.Disable(False)
      SecondPerson.SetLinkedRef(SidebySide, None, True)
      SecondPerson.Moveto(SidebySide, 0.0, 0.0, 0.0, True, False)
      SecondPerson.Enable(False)
    ElseIf ButtonValue == 1
      SecondPerson.Disable(False)
      SecondPerson.SetLinkedRef(Width, None, True)
      SecondPerson.Moveto(Width, 0.0, 0.0, 0.0, True, False)
      SecondPerson.Enable(False)
    ElseIf ButtonValue == 2
      SecondPerson.Moveto(Depth, 0.0, 0.0, 0.0, True, False)
      SecondPerson.Disable(False)
      SecondPerson.SetLinkedRef(Depth, None, True)
      SecondPerson.Moveto(Depth, 0.0, 0.0, 0.0, True, False)
      SecondPerson.Enable(False)
    ElseIf ButtonValue == 3
      SecondPerson.Disable(False)
      SecondPerson.SetLinkedRef(Combo, None, True)
      SecondPerson.Moveto(Combo, 0.0, 0.0, 0.0, True, False)
      SecondPerson.Enable(False)
    EndIf
  EndIf
EndEvent
