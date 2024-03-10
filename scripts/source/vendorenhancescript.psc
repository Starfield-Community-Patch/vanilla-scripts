ScriptName VendorEnhanceScript Extends TopicInfo Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property EnhancePrice Auto Const mandatory
GlobalVariable Property PD_EnhanceSpecialVouchers Auto Const mandatory
Quest Property DialogueParadiso Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If PD_EnhanceSpecialVouchers.GetValue() < 1.0 || Self.GetOwningQuest() != DialogueParadiso
    Game.GetPlayer().RemoveItem(Credits as Form, EnhancePrice.GetValueInt(), False, None)
  ElseIf PD_EnhanceSpecialVouchers.GetValue() >= 2.0
    PD_EnhanceSpecialVouchers.SetValue(1.0)
  ElseIf PD_EnhanceSpecialVouchers.GetValue() == 1.0
    PD_EnhanceSpecialVouchers.SetValue(0.0)
  EndIf
  Utility.Wait(0.200000003)
  Game.ShowRaceMenu(None, 2, None, None, None)
  Self.RegisterForMenuOpenCloseEvent("ChargenMenu")
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If asMenuName == "ChargenMenu"
    If abOpening == False
      Self.UnRegisterForMenuOpenCloseEvent("ChargenMenu")
      Game.FadeOutGame(False, True, 0.0, 0.100000001, False)
    EndIf
  EndIf
EndEvent
