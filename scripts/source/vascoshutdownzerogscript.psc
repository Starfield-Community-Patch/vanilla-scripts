ScriptName VascoShutDownZeroGScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  ActorValue Property VascoShutDownZeroG Auto Const mandatory
  Perk Property VascoShutDownZeroGPlayerPerk Auto Const mandatory
  Message Property VascoShutDownZeroGActivateMessage Auto Const mandatory
  Scene Property CREW_EliteCrew_Vasco_ShutdownZeroG Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function ShutDown()
  Self.SetUnconscious(True)
  CREW_EliteCrew_Vasco_ShutdownZeroG.Start()
  Self.setvalue(VascoShutDownZeroG, 1.0)
  Game.GetPlayer().AddPerk(VascoShutDownZeroGPlayerPerk, False)
EndFunction

Function StartUp()
  Self.SetUnconscious(False)
  Self.setvalue(VascoShutDownZeroG, 0.0)
  Game.GetPlayer().RemovePerk(VascoShutDownZeroGPlayerPerk)
EndFunction

Function ActivatedDuringShutDown()
  VascoShutDownZeroGActivateMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Event OnActivate(ObjectReference akActionRef)
  If Self.GetValue(VascoShutDownZeroG) == 1.0
    Self.ActivatedDuringShutDown()
  EndIf
EndEvent
