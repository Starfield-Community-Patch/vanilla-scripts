ScriptName ForceLegendaryActorScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
legendaryaliasquestscript Property LegendaryAliasQuest Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.IsDead() == False
    LegendaryAliasQuest.MakeLegendary(Self as Actor)
  EndIf
EndEvent

Event OnDeath(ObjectReference akKiller)
  LegendaryAliasQuest.RemoveLegendary(Self as Actor)
EndEvent
