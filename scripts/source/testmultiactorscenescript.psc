ScriptName TestMultiActorSceneScript Extends ObjectReference Const

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
ObjectReference Property Chair Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    Int ButtonValue = TestMultiActorMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    If ButtonValue == 0
      SecondPerson.Moveto(SidebySide, 0.0, 0.0, 0.0, True, False)
    ElseIf ButtonValue == 1
      SecondPerson.Moveto(Width, 0.0, 0.0, 0.0, True, False)
    ElseIf ButtonValue == 2
      SecondPerson.Moveto(Depth, 0.0, 0.0, 0.0, True, False)
    ElseIf ButtonValue == 3
      SecondPerson.Moveto(Combo, 0.0, 0.0, 0.0, True, False)
    ElseIf ButtonValue == 4
      SecondPerson.Moveto(Chair, 0.0, 0.0, 0.0, True, False)
    EndIf
    FirstPerson.Moveto(FirstMarker, 0.0, 0.0, 0.0, True, False)
  EndIf
EndEvent
