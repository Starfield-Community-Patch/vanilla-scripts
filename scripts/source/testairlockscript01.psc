ScriptName TestAirlockScript01 Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property ArmorTypeHelmet Auto Const mandatory
Message Property TestAirlockMSG01 Auto Const mandatory
Bool Property bPowerered = True Auto

;-- Functions ---------------------------------------

Event OnInit()
  Self.BlockActivation(True, False)
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If bPowerered
    If Self.GetOpenState() == 3
      If (akActionRef as Actor).WornHasKeyword(ArmorTypeHelmet)
        Self.Activate(akActionRef, True)
      ElseIf akActionRef == Game.GetPlayer() as ObjectReference
        Int ButtonPressed = 0
        ButtonPressed = TestAirlockMSG01.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        If ButtonPressed == 1
          Self.Activate(akActionRef, True)
        EndIf
      Else
        Self.Activate(akActionRef, True)
      EndIf
    Else
      Self.Activate(akActionRef, True)
    EndIf
  EndIf
EndEvent

Function PowerOff()
  Self.SetOpen(True)
  bPowerered = False
EndFunction

Function PowerOn()
  Self.SetOpen(False)
  bPowerered = True
EndFunction
