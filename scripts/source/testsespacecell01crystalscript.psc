ScriptName TestSESpaceCell01CrystalScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property InorgUncommonBeryllium Auto Const mandatory

;-- Functions ---------------------------------------

Event OnDestroyed(ObjectReference akDestroyer)
  Int MineralCount = Utility.RandomInt(1, 4)
  Utility.Wait(1.0)
  Game.GetPlayer().AddItem(InorgUncommonBeryllium as Form, MineralCount, False)
EndEvent

Event OnActivate(ObjectReference akActionRef)
  Self.DisableNoWait(False)
EndEvent
